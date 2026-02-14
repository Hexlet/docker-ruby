# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#inspect_
    class ContainerInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute size
      #   Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @return [Boolean, nil]
      optional :size, DockerEngine::Internal::Type::Boolean

      # @!method initialize(size: nil, request_options: {})
      #   @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
