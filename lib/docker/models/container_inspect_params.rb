# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#inspect_
    class ContainerInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute size
      #   Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @return [Boolean, nil]
      optional :size, Docker::Internal::Type::Boolean

      # @!method initialize(size: nil, request_options: {})
      #   @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
