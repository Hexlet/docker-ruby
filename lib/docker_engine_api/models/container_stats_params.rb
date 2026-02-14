# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#stats
    class ContainerStatsParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute one_shot
      #   Only get a single stat instead of waiting for 2 cycles. Must be used with
      #   `stream=false`.
      #
      #   @return [Boolean, nil]
      optional :one_shot, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute stream
      #   Stream the output. If false, the stats will be output once and then it will
      #   disconnect.
      #
      #   @return [Boolean, nil]
      optional :stream, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(one_shot: nil, stream: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ContainerStatsParams} for more details.
      #
      #   @param one_shot [Boolean] Only get a single stat instead of waiting for 2 cycles. Must be used
      #
      #   @param stream [Boolean] Stream the output. If false, the stats will be output once and then
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
