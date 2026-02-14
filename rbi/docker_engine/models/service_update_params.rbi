# typed: strong

module DockerEngine
  module Models
    class ServiceUpdateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ServiceUpdateParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # The version number of the service object being updated. This is required to
      # avoid conflicting writes. This version number should be the value as currently
      # set on the service _before_ the update. You can find the current version by
      # calling `GET /services/{id}`
      sig { returns(Integer) }
      attr_accessor :version

      # User modifiable configuration for a service.
      sig { returns(DockerEngine::ServiceUpdateParams::Spec) }
      attr_reader :spec

      sig { params(spec: DockerEngine::ServiceUpdateParams::Spec::OrHash).void }
      attr_writer :spec

      # If the `X-Registry-Auth` header is not specified, this parameter indicates where
      # to find registry authorization credentials.
      sig do
        returns(
          T.nilable(
            DockerEngine::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
          )
        )
      end
      attr_reader :registry_auth_from

      sig do
        params(
          registry_auth_from:
            DockerEngine::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
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
          spec: DockerEngine::ServiceUpdateParams::Spec::OrHash,
          registry_auth_from:
            DockerEngine::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
          rollback: String,
          x_registry_auth: String,
          request_options: DockerEngine::RequestOptions::OrHash
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
            spec: DockerEngine::ServiceUpdateParams::Spec,
            registry_auth_from:
              DockerEngine::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
            rollback: String,
            x_registry_auth: String,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Spec < DockerEngine::Models::Spec
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::ServiceUpdateParams::Spec,
              DockerEngine::Internal::AnyHash
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
        extend DockerEngine::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngine::ServiceUpdateParams::RegistryAuthFrom)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SPEC =
          T.let(
            :spec,
            DockerEngine::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )
        PREVIOUS_SPEC =
          T.let(
            :"previous-spec",
            DockerEngine::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngine::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
