# typed: strong

module DockerEngine
  module Models
    class SecretCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::SecretCreateParams,
            DockerEngine::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(DockerEngine::SecretCreateParams::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngine::SecretCreateParams::Spec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          spec: DockerEngine::SecretCreateParams::Spec::OrHash,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            spec: DockerEngine::SecretCreateParams::Spec,
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
              DockerEngine::SecretCreateParams::Spec,
              DockerEngine::Internal::AnyHash
            )
          end

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
