# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#inspect_
    class ContainerInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute size
      #
      #   @return [Boolean, nil]
      optional :size, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(size: nil, request_options: {})
      #   @param size [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
