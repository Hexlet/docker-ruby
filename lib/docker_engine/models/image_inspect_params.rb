# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#inspect_
    class ImageInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute manifests
      #   Include Manifests in the image summary.
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngine::Internal::Type::Boolean

      # @!method initialize(manifests: nil, request_options: {})
      #   @param manifests [Boolean] Include Manifests in the image summary.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
