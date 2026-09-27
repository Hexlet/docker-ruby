# frozen_string_literal: true

require "base64"

module DockerEngineRuby
  module Helpers
    # Progress of a BuildKit build (`version: :"2"`). The daemon sends it as `BuildInfo` messages
    # with `id: "moby.buildkit.trace"` and a base64 protobuf `StatusResponse` in `aux`
    # (moby/buildkit `api/services/control/control.proto`). Only the fields a progress log
    # needs are decoded; the rest are skipped.
    module BuildkitStatus
      TRACE_ID = "moby.buildkit.trace"

      Vertex = Struct.new(:digest, :name, :cached, :started, :completed, :error, keyword_init: true)
      Log = Struct.new(:vertex, :stream, :msg, keyword_init: true)
      Status = Struct.new(:vertexes, :logs, keyword_init: true)

      class << self
        # @param info [DockerEngineRuby::Models::BuildInfo]
        # @return [Boolean]
        def trace?(info) = info.id == TRACE_ID && info.aux.is_a?(String)

        # @param aux [String] base64-encoded `StatusResponse`
        # @return [DockerEngineRuby::Helpers::BuildkitStatus::Status]
        def decode(aux)
          status = Status.new(vertexes: [], logs: [])
          each_field(Base64.decode64(aux)) do |number, value|
            case number
            in 1 then status.vertexes << decode_vertex(value)
            in 3 then status.logs << decode_log(value)
            else nil
            end
          end
          status
        end

        private

        def decode_vertex(bytes)
          vertex = Vertex.new(cached: false, started: false, completed: false)
          each_field(bytes) do |number, value|
            case number
            in 1 then vertex.digest = utf8(value)
            in 3 then vertex.name = utf8(value)
            in 4 then vertex.cached = value != 0
            in 5 then vertex.started = true
            in 6 then vertex.completed = true
            in 7 then vertex.error = utf8(value)
            else nil
            end
          end
          vertex
        end

        def decode_log(bytes)
          log = Log.new(stream: 0, msg: +"")
          each_field(bytes) do |number, value|
            case number
            in 1 then log.vertex = utf8(value)
            in 3 then log.stream = value
            in 4 then log.msg = utf8(value)
            else nil
            end
          end
          log
        end

        def utf8(bytes) = bytes.dup.force_encoding(Encoding::UTF_8).scrub

        # Protobuf wire format: yields [field number, varint Integer | length-delimited String].
        def each_field(bytes)
          reader = StringIO.new(bytes.b)
          until reader.eof?
            key = read_varint(reader)
            number = key >> 3
            case key & 7
            in 0 then yield(number, read_varint(reader))
            in 1 then reader.read(8)
            in 2 then yield(number, reader.read(read_varint(reader)).to_s)
            in 5 then reader.read(4)
            end
          end
        end

        def read_varint(reader)
          result = 0
          shift = 0
          loop do
            byte = reader.readbyte
            result |= (byte & 0x7f) << shift
            return result if byte < 0x80

            shift += 7
          end
        end
      end

      # Renders statuses as `docker build --progress=plain` does: vertexes are numbered in the
      # order they appear, and each state change or log chunk becomes a line.
      class PlainPrinter
        # @param out [#call] receives each rendered line
        def initialize(&out)
          @out = out
          @numbers = {}
          @printed = {}
        end

        # @param status [DockerEngineRuby::Helpers::BuildkitStatus::Status]
        def print(status)
          status.vertexes.each { print_vertex(_1) }
          status.logs.each do |log|
            prefix = "##{number(log.vertex)} "
            log.msg.each_line { @out.call(prefix + _1.chomp) }
          end
        end

        private

        def number(digest) = @numbers[digest] ||= @numbers.size + 1

        def print_vertex(vertex)
          n = number(vertex.digest)
          state = if vertex.error then "ERROR: #{vertex.error}"
          elsif vertex.cached then "CACHED"
          elsif vertex.completed then "DONE"
          elsif vertex.started then vertex.name
          end
          return if state.nil? || @printed[[n, state]]

          @printed[[n, state]] = true
          @out.call(state == vertex.name ? "##{n} #{vertex.name}" : "##{n} #{state}")
        end
      end
    end
  end
end
