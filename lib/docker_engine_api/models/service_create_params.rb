# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Services#create
    class ServiceCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [DockerEngineAPI::Models::ServiceCreateParams::Spec]
      required :spec, -> { DockerEngineAPI::ServiceCreateParams::Spec }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(spec:, x_registry_auth: nil, request_options: {})
      #   @param spec [DockerEngineAPI::Models::ServiceCreateParams::Spec] User modifiable configuration for a service.
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineAPI::Models::Spec
        # @!method initialize
        #   User modifiable configuration for a service.
      end
    end
  end
end
