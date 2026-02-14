# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#kill
    class ContainerKillParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute signal
      #   Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @return [String, nil]
      optional :signal, String

      # @!method initialize(signal: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ContainerKillParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
