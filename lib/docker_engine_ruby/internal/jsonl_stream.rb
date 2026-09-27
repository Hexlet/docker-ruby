# frozen_string_literal: true

module DockerEngineRuby
  module Internal
    # Progress streams of Docker (`/build`, `/images/create`, `/images/{name}/push`) are one JSON
    # object per line, sent as `application/json`. Each line is coerced to `model` as it arrives.
    #
    # @generic Elem
    class JSONLStream
      include Enumerable

      # @param model [DockerEngineRuby::Internal::Type::Converter, Class]
      # @param stream [Enumerable<String>] raw response lines
      def initialize(model:, stream:, **)
        @model = model
        @lines = stream
      end

      # @yieldparam message [generic<Elem>]
      def each
        return enum_for(__method__) unless block_given?

        @lines.each do |line|
          next if line.strip.empty?

          yield(DockerEngineRuby::Internal::Type::Converter.coerce(
            @model,
            JSON.parse(line, symbolize_names: true)
          ))
        end
      end
    end
  end
end
