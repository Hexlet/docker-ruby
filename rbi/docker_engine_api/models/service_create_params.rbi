# typed: strong

module DockerEngineAPI
  module Models
    class ServiceCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ServiceCreateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # User modifiable configuration for a service.
      sig { returns(DockerEngineAPI::ServiceCreateParams::Spec) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineAPI::ServiceCreateParams::Spec::OrHash).void
      end
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          spec: DockerEngineAPI::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # User modifiable configuration for a service.
        spec:,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            spec: DockerEngineAPI::ServiceCreateParams::Spec,
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
              DockerEngineAPI::ServiceCreateParams::Spec,
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
    end
  end
end
