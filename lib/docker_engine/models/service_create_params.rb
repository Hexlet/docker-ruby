# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Services#create
    class ServiceCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [DockerEngine::Models::ServiceCreateParams::Spec]
      required :spec, -> { DockerEngine::ServiceCreateParams::Spec }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(spec:, x_registry_auth: nil, request_options: {})
      #   @param spec [DockerEngine::Models::ServiceCreateParams::Spec] User modifiable configuration for a service.
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngine::Models::Spec
        # @!method initialize
        #   User modifiable configuration for a service.
      end
    end
  end
end
