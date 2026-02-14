# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Exec#resize
    class ExecResizeParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
