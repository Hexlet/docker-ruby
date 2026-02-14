# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#inspect_
    class ImageInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute manifests
      #   Include Manifests in the image summary.
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(manifests: nil, request_options: {})
      #   @param manifests [Boolean] Include Manifests in the image summary.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
