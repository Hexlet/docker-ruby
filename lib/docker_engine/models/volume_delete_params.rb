# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Volumes#delete
    class VolumeDeleteParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute force
      #   Force the removal of the volume
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngine::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   @param force [Boolean] Force the removal of the volume
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
