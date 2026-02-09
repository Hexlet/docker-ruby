# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Services#create
    class ServiceCreateParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [Docker::Models::ServiceCreateParams::Spec]
      required :spec, -> { Docker::ServiceCreateParams::Spec }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(spec:, x_registry_auth: nil, request_options: {})
      #   @param spec [Docker::Models::ServiceCreateParams::Spec] User modifiable configuration for a service.
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]

      class Spec < Docker::Models::Spec
        # @!method initialize
        #   User modifiable configuration for a service.
      end
    end
  end
end
