# frozen_string_literal: true

module DockerEngineRuby
  module Internal
    module Transport
      # @api private
      class PooledNetRequester
        extend DockerEngineRuby::Internal::Util::SorbetRuntimeSupport

        class UnixSocketHTTP < Net::HTTP
          def initialize(socket_path)
            super("localhost", Net::HTTP.http_default_port)
            @socket_path = socket_path
          end

          private def connect
            raise ArgumentError.new("TLS over unix sockets is not supported") if use_ssl?

            @socket = Net::BufferedIO.new(UNIXSocket.new(@socket_path))
            @last_communicated = nil
            on_connect
          end
        end

        # from the golang stdlib
        # https://github.com/golang/go/blob/c8eced8580028328fde7c03cbfcb720ce15b2358/src/net/http/transport.go#L49
        KEEP_ALIVE_TIMEOUT = 30

        DEFAULT_MAX_CONNECTIONS = [Etc.nprocessors, 99].max

        class << self
          # @api private
          #
          # @param cert_store [OpenSSL::X509::Store]
          # @param tls_cert [OpenSSL::X509::Certificate, nil]
          # @param tls_key [OpenSSL::PKey::PKey, nil]
          # @param unix_socket_path [String, nil]
          # @param url [URI::Generic]
          #
          # @return [Net::HTTP]
          def connect(cert_store:, tls_cert:, tls_key:, unix_socket_path:, url:)
            if unix_socket_path
              return UnixSocketHTTP.new(unix_socket_path).tap do
                _1.use_ssl = false
                _1.max_retries = 0
              end
            end
            port =
              case [url.port, url.scheme]
              in [Integer, _]
                url.port
              in [nil, "http" | "ws"]
                Net::HTTP.http_default_port
              in [nil, "https" | "wss"]
                Net::HTTP.https_default_port
              end

            Net::HTTP.new(url.host, port).tap do
              _1.use_ssl = %w[https wss].include?(url.scheme)
              _1.max_retries = 0

              if _1.use_ssl?
                _1.cert_store = cert_store
                _1.cert = tls_cert if tls_cert
                _1.key = tls_key if tls_key
              end
            end
          end

          # @api private
          #
          # @param conn [Net::HTTP]
          # @param deadline [Float]
          def calibrate_socket_timeout(conn, deadline)
            timeout = deadline - DockerEngineRuby::Internal::Util.monotonic_secs
            conn.open_timeout = conn.read_timeout = conn.write_timeout = conn.continue_timeout = timeout
          end

          # @api private
          #
          # @param request [Hash{Symbol=>Object}] .
          #
          #   @option request [Symbol] :method
          #
          #   @option request [URI::Generic] :url
          #
          #   @option request [Hash{String=>String}] :headers
          #
          # @param blk [Proc]
          #
          # @yieldparam [String]
          # @return [Array(Net::HTTPGenericRequest, Proc)]
          def build_request(request, &blk)
            method, url, headers, body = request.fetch_values(:method, :url, :headers, :body)
            req = Net::HTTPGenericRequest.new(
              method.to_s.upcase,
              !body.nil?,
              method != :head,
              URI(url.to_s) # ensure we construct a URI class of the right scheme
            )

            headers.each { req[_1] = _2 }

            case body
            in nil
              req["content-length"] ||= 0 unless req["transfer-encoding"]
            in String
              req["content-length"] ||= body.bytesize.to_s unless req["transfer-encoding"]
              req.body_stream = DockerEngineRuby::Internal::Util::ReadIOAdapter.new(body, &blk)
            in StringIO
              req["content-length"] ||= body.size.to_s unless req["transfer-encoding"]
              req.body_stream = DockerEngineRuby::Internal::Util::ReadIOAdapter.new(body, &blk)
            in Pathname | IO | Enumerator
              req["transfer-encoding"] ||= "chunked" unless req["content-length"]
              req.body_stream = DockerEngineRuby::Internal::Util::ReadIOAdapter.new(body, &blk)
            end

            [req, req.body_stream&.method(:close)]
          end
        end

        # @api private
        #
        # @param url [URI::Generic]
        # @param unix_socket_path [String, nil]
        # @param deadline [Float]
        # @param blk [Proc]
        #
        # @raise [Timeout::Error]
        # @yieldparam [Net::HTTP]
        private def with_pool(url, unix_socket_path:, deadline:, &blk)
          origin = unix_socket_path || DockerEngineRuby::Internal::Util.uri_origin(url)
          timeout = deadline - DockerEngineRuby::Internal::Util.monotonic_secs
          pool =
            @mutex.synchronize do
              @pools[origin] ||= ConnectionPool.new(size: @size) do
                self.class.connect(
                  cert_store: @cert_store,
                  tls_cert: @tls_cert,
                  tls_key: @tls_key,
                  unix_socket_path: unix_socket_path,
                  url: url
                )
              end
            end

          pool.with(timeout: timeout, &blk)
        end

        # @api private
        #
        # @param request [Hash{Symbol=>Object}] .
        #
        #   @option request [Symbol] :method
        #
        #   @option request [URI::Generic] :url
        #
        #   @option request [Hash{String=>String}] :headers
        #
        #   @option request [Object] :body
        #
        #   @option request [Float] :deadline
        #
        # @return [Array(Integer, Net::HTTPResponse, Enumerable<String>)]
        def execute(request)
          url, deadline = request.fetch_values(:url, :deadline)
          unix_socket_path = request.fetch(:unix_socket_path, @default_unix_socket_path)

          req = nil
          finished = false

          # rubocop:disable Metrics/BlockLength
          enum = Enumerator.new do |y|
            next if finished

            with_pool(url, unix_socket_path: unix_socket_path, deadline: deadline) do |conn|
              eof = false
              closing = nil
              ::Thread.handle_interrupt(Object => :never) do
                ::Thread.handle_interrupt(Object => :immediate) do
                  req, closing = self.class.build_request(request) do
                    self.class.calibrate_socket_timeout(conn, deadline)
                  end

                  self.class.calibrate_socket_timeout(conn, deadline)
                  unless conn.started?
                    conn.keep_alive_timeout = self.class::KEEP_ALIVE_TIMEOUT
                    conn.start
                  end

                  self.class.calibrate_socket_timeout(conn, deadline)
                  ::Kernel.catch(:jump) do
                    conn.request(req) do |rsp|
                      y << [req, rsp]
                      ::Kernel.throw(:jump) if finished

                      rsp.read_body do |bytes|
                        y << bytes.force_encoding(Encoding::BINARY)
                        ::Kernel.throw(:jump) if finished

                        self.class.calibrate_socket_timeout(conn, deadline)
                      end
                      eof = true
                    end
                  end
                end
              ensure
                begin
                  conn.finish if !eof && conn&.started?
                ensure
                  closing&.call
                end
              end
            end
          rescue Timeout::Error
            raise DockerEngineRuby::Errors::APITimeoutError.new(url: url, request: req)
          rescue StandardError
            raise DockerEngineRuby::Errors::APIConnectionError.new(url: url, request: req)
          end
          # rubocop:enable Metrics/BlockLength

          _, response = enum.next
          body = DockerEngineRuby::Internal::Util.fused_enum(enum, external: true) do
            finished = true
            loop { enum.next }
          end
          [Integer(response.code), response, body]
        end

        # @api private
        #
        # @param size [Integer]
        # @param tls_ca_cert_path [String, nil]
        # @param tls_client_cert_path [String, nil]
        # @param tls_client_key_path [String, nil]
        def initialize(
          size: self.class::DEFAULT_MAX_CONNECTIONS,
          tls_ca_cert_path: nil,
          tls_client_cert_path: nil,
          tls_client_key_path: nil,
          unix_socket_path: nil
        )
          @mutex = Mutex.new
          @size = size
          @default_unix_socket_path = unix_socket_path
          @cert_store = OpenSSL::X509::Store.new.tap(&:set_default_paths)
          @cert_store.add_file(tls_ca_cert_path) if tls_ca_cert_path

          if tls_client_cert_path || tls_client_key_path
            if tls_client_cert_path.nil? || tls_client_key_path.nil?
              raise ArgumentError.new(
                "Both tls_client_cert_path and tls_client_key_path must be provided together."
              )
            end

            @tls_cert = OpenSSL::X509::Certificate.new(File.read(tls_client_cert_path))
            @tls_key = OpenSSL::PKey.read(File.read(tls_client_key_path))
          else
            @tls_cert = nil
            @tls_key = nil
          end

          @pools = {}
        end

        define_sorbet_constant!(:Request) do
          T.type_alias do
            {
              method: Symbol,
              url: URI::Generic,
              unix_socket_path: T.nilable(String),
              headers: T::Hash[String, String],
              body: T.anything,
              deadline: Float
            }
          end
        end
      end
    end
  end
end
