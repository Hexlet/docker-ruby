# typed: strong

module DockerEngine
  module Models
    class ConfigCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ConfigCreateParams,
            DockerEngine::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(DockerEngine::ConfigCreateParams::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngine::ConfigCreateParams::Spec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          spec: DockerEngine::ConfigCreateParams::Spec::OrHash,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            spec: DockerEngine::ConfigCreateParams::Spec,
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
              DockerEngine::ConfigCreateParams::Spec,
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
