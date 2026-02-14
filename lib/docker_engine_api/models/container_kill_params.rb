# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#kill
    class ContainerKillParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute signal
      #   Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @return [String, nil]
      optional :signal, String

      # @!method initialize(signal: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ContainerKillParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
