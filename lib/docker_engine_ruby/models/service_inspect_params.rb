# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#inspect_
    class ServiceInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute insert_defaults
      #
      #   @return [Boolean, nil]
      optional :insert_defaults, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(id:, insert_defaults: nil, request_options: {})
      #   @param id [String]
      #   @param insert_defaults [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
