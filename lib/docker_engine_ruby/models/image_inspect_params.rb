# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#inspect_
    class ImageInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute manifests
      #   Include Manifests in the image summary.
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(manifests: nil, request_options: {})
      #   @param manifests [Boolean] Include Manifests in the image summary.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
