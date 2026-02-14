# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#kill
    class ContainerKillParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute signal
      #   Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @return [String, nil]
      optional :signal, String

      # @!method initialize(signal: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerKillParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
