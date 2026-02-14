# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#stats
    class ContainerStatsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute one_shot
      #
      #   @return [Boolean, nil]
      optional :one_shot, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute stream
      #
      #   @return [Boolean, nil]
      optional :stream, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(one_shot: nil, stream: nil, request_options: {})
      #   @param one_shot [Boolean]
      #   @param stream [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
