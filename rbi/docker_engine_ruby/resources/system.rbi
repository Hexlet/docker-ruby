# typed: strong

module DockerEngineRuby
  module Resources
    class System
      # Get data usage information
      sig do
        params(
          type:
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol,
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::OrSymbol
              ]
            ),
          verbose: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::SystemDataUsageResponse)
      end
      def data_usage(type: nil, verbose: nil, request_options: {})
      end

      # Monitor events
      sig do
        params(
          filters: String,
          since: String,
          until_: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::SystemEventsResponse)
      end
      def events(filters: nil, since: nil, until_: nil, request_options: {})
      end

      # Get system information
      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Info)
      end
      def info(request_options: {})
      end

      # Ping
      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(String)
      end
      def ping(request_options: {})
      end

      # Get version
      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Version)
      end
      def version(request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
