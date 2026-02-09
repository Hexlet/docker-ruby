# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#kill
    class ContainerKillParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute signal
      #   Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @return [String, nil]
      optional :signal, String

      # @!method initialize(signal: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ContainerKillParams} for more details.
      #
      #   @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
