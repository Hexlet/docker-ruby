# typed: strong

module DockerEngineRuby
  module Models
    class ServiceUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :version

      sig do
        returns(
          T.nilable(
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
          )
        )
      end
      attr_reader :registry_auth_from

      sig do
        params(
          registry_auth_from:
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol
        ).void
      end
      attr_writer :registry_auth_from

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
          registry_auth_from:
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
          rollback: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        version:,
        registry_auth_from: nil,
        rollback: nil,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            version: Integer,
            registry_auth_from:
              DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
            rollback: String,
            x_registry_auth: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      module RegistryAuthFrom
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SPEC =
          T.let(
            :spec,
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )
        PREVIOUS_SPEC =
          T.let(
            :"previous-spec",
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
