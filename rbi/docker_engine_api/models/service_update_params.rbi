# typed: strong

module DockerEngineAPI
  module Models
    class ServiceUpdateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ServiceUpdateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The version number of the service object being updated. This is required to
      # avoid conflicting writes. This version number should be the value as currently
      # set on the service _before_ the update. You can find the current version by
      # calling `GET /services/{id}`
      sig { returns(Integer) }
      attr_accessor :version

      # User modifiable configuration for a service.
      sig { returns(DockerEngineAPI::ServiceUpdateParams::Spec) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineAPI::ServiceUpdateParams::Spec::OrHash).void
      end
      attr_writer :spec

      # If the `X-Registry-Auth` header is not specified, this parameter indicates where
      # to find registry authorization credentials.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
          )
        )
      end
      attr_reader :registry_auth_from

      sig do
        params(
          registry_auth_from:
            DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
        ).void
      end
      attr_writer :registry_auth_from

      # Set to this parameter to `previous` to cause a server-side rollback to the
      # previous service spec. The supplied spec will be ignored in this case.
      sig { returns(T.nilable(String)) }
      attr_reader :rollback

      sig { params(rollback: String).void }
      attr_writer :rollback

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          version: Integer,
          spec: DockerEngineAPI::ServiceUpdateParams::Spec::OrHash,
          registry_auth_from:
            DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
          rollback: String,
          x_registry_auth: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The version number of the service object being updated. This is required to
        # avoid conflicting writes. This version number should be the value as currently
        # set on the service _before_ the update. You can find the current version by
        # calling `GET /services/{id}`
        version:,
        # User modifiable configuration for a service.
        spec:,
        # If the `X-Registry-Auth` header is not specified, this parameter indicates where
        # to find registry authorization credentials.
        registry_auth_from: nil,
        # Set to this parameter to `previous` to cause a server-side rollback to the
        # previous service spec. The supplied spec will be ignored in this case.
        rollback: nil,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            version: Integer,
            spec: DockerEngineAPI::ServiceUpdateParams::Spec,
            registry_auth_from:
              DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
            rollback: String,
            x_registry_auth: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Spec < DockerEngineAPI::Models::Spec
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::ServiceUpdateParams::Spec,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # User modifiable configuration for a service.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end

      # If the `X-Registry-Auth` header is not specified, this parameter indicates where
      # to find registry authorization credentials.
      module RegistryAuthFrom
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SPEC =
          T.let(
            :spec,
            DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )
        PREVIOUS_SPEC =
          T.let(
            :"previous-spec",
            DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineAPI::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
