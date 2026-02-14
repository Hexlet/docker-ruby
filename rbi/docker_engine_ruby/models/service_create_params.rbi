# typed: strong

module DockerEngineRuby
  module Models
    class ServiceCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # User modifiable configuration for a service.
      sig { returns(DockerEngineRuby::ServiceCreateParams::Spec) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineRuby::ServiceCreateParams::Spec::OrHash).void
      end
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          spec: DockerEngineRuby::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            spec: DockerEngineRuby::ServiceCreateParams::Spec,
            x_registry_auth: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Spec < DockerEngineRuby::Models::Spec
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ServiceCreateParams::Spec,
              DockerEngineRuby::Internal::AnyHash
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
