# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#resize
    class ContainerResizeParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute h
      #   Height of the TTY session in characters
      #
      #   @return [Integer]
      required :h, Integer

      # @!attribute w
      #   Width of the TTY session in characters
      #
      #   @return [Integer]
      required :w, Integer

      # @!method initialize(h:, w:, request_options: {})
      #   @param h [Integer] Height of the TTY session in characters
      #
      #   @param w [Integer] Width of the TTY session in characters
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
