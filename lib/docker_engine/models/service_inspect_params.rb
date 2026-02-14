# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Services#inspect_
    class ServiceInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute insert_defaults
      #   Fill empty fields with default values.
      #
      #   @return [Boolean, nil]
      optional :insert_defaults, DockerEngine::Internal::Type::Boolean

      # @!method initialize(insert_defaults: nil, request_options: {})
      #   @param insert_defaults [Boolean] Fill empty fields with default values.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
