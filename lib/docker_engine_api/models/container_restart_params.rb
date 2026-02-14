# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#restart
    class ContainerRestartParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute signal
      #   Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @return [String, nil]
      optional :signal, String

      # @!attribute t
      #   Number of seconds to wait before killing the container
      #
      #   @return [Integer, nil]
      optional :t, Integer

      # @!method initialize(signal: nil, t: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ContainerRestartParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param t [Integer] Number of seconds to wait before killing the container
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
