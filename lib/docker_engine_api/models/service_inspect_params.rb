# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Services#inspect_
    class ServiceInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute insert_defaults
      #   Fill empty fields with default values.
      #
      #   @return [Boolean, nil]
      optional :insert_defaults, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(insert_defaults: nil, request_options: {})
      #   @param insert_defaults [Boolean] Fill empty fields with default values.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
