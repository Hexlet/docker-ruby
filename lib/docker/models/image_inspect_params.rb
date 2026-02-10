# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Images#inspect_
    class ImageInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute manifests
      #   Include Manifests in the image summary.
      #
      #   @return [Boolean, nil]
      optional :manifests, Docker::Internal::Type::Boolean

      # @!method initialize(manifests: nil, request_options: {})
      #   @param manifests [Boolean] Include Manifests in the image summary.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
