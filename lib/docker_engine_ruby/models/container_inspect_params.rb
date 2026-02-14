# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#inspect_
    class ContainerInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute size
      #   Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @return [Boolean, nil]
      optional :size, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(size: nil, request_options: {})
      #   @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
