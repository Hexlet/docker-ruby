# typed: strong

module DockerEngine
  module Models
    class ServiceCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ServiceCreateParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # User modifiable configuration for a service.
      sig { returns(DockerEngine::ServiceCreateParams::Spec) }
      attr_reader :spec

      sig { params(spec: DockerEngine::ServiceCreateParams::Spec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          spec: DockerEngine::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: DockerEngine::RequestOptions::OrHash
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
            spec: DockerEngine::ServiceCreateParams::Spec,
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
              DockerEngine::ServiceCreateParams::Spec,
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
    end
  end
end
