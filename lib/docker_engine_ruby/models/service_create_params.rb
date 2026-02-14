# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#create
    class ServiceCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [DockerEngineRuby::Models::ServiceCreateParams::Spec]
      required :spec, -> { DockerEngineRuby::ServiceCreateParams::Spec }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(spec:, x_registry_auth: nil, request_options: {})
      #   @param spec [DockerEngineRuby::Models::ServiceCreateParams::Spec] User modifiable configuration for a service.
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineRuby::Models::Spec
        # @!method initialize
        #   User modifiable configuration for a service.
      end
    end
  end
end
