# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#stop
    class ContainerStopParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

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
      #   {Docker::Models::ContainerStopParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param t [Integer] Number of seconds to wait before killing the container
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
