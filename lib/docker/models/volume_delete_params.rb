# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Volumes#delete
    class VolumeDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute force
      #   Force the removal of the volume
      #
      #   @return [Boolean, nil]
      optional :force, Docker::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   @param force [Boolean] Force the removal of the volume
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
