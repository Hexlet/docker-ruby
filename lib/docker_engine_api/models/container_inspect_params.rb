# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#inspect_
    class ContainerInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute size
      #   Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @return [Boolean, nil]
      optional :size, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(size: nil, request_options: {})
      #   @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
