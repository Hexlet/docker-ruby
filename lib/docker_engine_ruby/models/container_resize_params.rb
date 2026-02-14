# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#resize
    class ContainerResizeParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute h
      #
      #   @return [Integer]
      required :h, Integer

      # @!attribute w
      #
      #   @return [Integer]
      required :w, Integer

      # @!method initialize(h:, w:, request_options: {})
      #   @param h [Integer]
      #   @param w [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
