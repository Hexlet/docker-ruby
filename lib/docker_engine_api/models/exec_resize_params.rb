# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Exec#resize
    class ExecResizeParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

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
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
