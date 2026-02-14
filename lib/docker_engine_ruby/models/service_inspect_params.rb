# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#inspect_
    class ServiceInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute insert_defaults
      #   Fill empty fields with default values.
      #
      #   @return [Boolean, nil]
      optional :insert_defaults, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(insert_defaults: nil, request_options: {})
      #   @param insert_defaults [Boolean] Fill empty fields with default values.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
