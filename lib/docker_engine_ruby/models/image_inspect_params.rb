# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#inspect_
    class ImageInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute manifests
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(name:, manifests: nil, request_options: {})
      #   @param name [String]
      #   @param manifests [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
