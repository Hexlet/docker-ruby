# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Services#update
    class ServiceUpdateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the service object being updated. This is required to
      #   avoid conflicting writes. This version number should be the value as currently
      #   set on the service _before_ the update. You can find the current version by
      #   calling `GET /services/{id}`
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute spec
      #   User modifiable configuration for a service.
      #
      #   @return [DockerEngineAPI::Models::ServiceUpdateParams::Spec]
      required :spec, -> { DockerEngineAPI::ServiceUpdateParams::Spec }

      # @!attribute registry_auth_from
      #   If the `X-Registry-Auth` header is not specified, this parameter indicates where
      #   to find registry authorization credentials.
      #
      #   @return [Symbol, DockerEngineAPI::Models::ServiceUpdateParams::RegistryAuthFrom, nil]
      optional :registry_auth_from, enum: -> { DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom }

      # @!attribute rollback
      #   Set to this parameter to `previous` to cause a server-side rollback to the
      #   previous service spec. The supplied spec will be ignored in this case.
      #
      #   @return [String, nil]
      optional :rollback, String

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(version:, spec:, registry_auth_from: nil, rollback: nil, x_registry_auth: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ServiceUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the service object being updated. This is
      #
      #   @param spec [DockerEngineAPI::Models::ServiceUpdateParams::Spec] User modifiable configuration for a service.
      #
      #   @param registry_auth_from [Symbol, DockerEngineAPI::Models::ServiceUpdateParams::RegistryAuthFrom] If the `X-Registry-Auth` header is not specified, this parameter
      #
      #   @param rollback [String] Set to this parameter to `previous` to cause a server-side rollback
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineAPI::Models::Spec
        # @!method initialize
        #   User modifiable configuration for a service.
      end

      # If the `X-Registry-Auth` header is not specified, this parameter indicates where
      # to find registry authorization credentials.
      module RegistryAuthFrom
        extend DockerEngineAPI::Internal::Type::Enum

        SPEC = :spec
        PREVIOUS_SPEC = :"previous-spec"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
