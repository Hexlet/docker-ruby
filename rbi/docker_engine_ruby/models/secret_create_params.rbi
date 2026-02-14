# typed: strong

module DockerEngineRuby
  module Models
    class SecretCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SecretCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(DockerEngineRuby::SecretCreateParams::Spec)) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineRuby::SecretCreateParams::Spec::OrHash).void
      end
      attr_writer :spec

      sig do
        params(
          spec: DockerEngineRuby::SecretCreateParams::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            spec: DockerEngineRuby::SecretCreateParams::Spec,
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
              DockerEngineRuby::SecretCreateParams::Spec,
              DockerEngineRuby::Internal::AnyHash
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
