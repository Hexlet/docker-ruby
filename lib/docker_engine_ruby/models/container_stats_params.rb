# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#stats
    class ContainerStatsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute one_shot
      #   Only get a single stat instead of waiting for 2 cycles. Must be used with
      #   `stream=false`.
      #
      #   @return [Boolean, nil]
      optional :one_shot, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stream
      #   Stream the output. If false, the stats will be output once and then it will
      #   disconnect.
      #
      #   @return [Boolean, nil]
      optional :stream, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(one_shot: nil, stream: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ContainerStatsParams} for more details.
      #
      #   @param one_shot [Boolean] Only get a single stat instead of waiting for 2 cycles. Must be used
      #
      #   @param stream [Boolean] Stream the output. If false, the stats will be output once and then
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
