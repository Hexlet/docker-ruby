# typed: strong

module DockerEngineAPI
  module Models
    class ConfigCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ConfigCreateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(DockerEngineAPI::ConfigCreateParams::Spec)) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineAPI::ConfigCreateParams::Spec::OrHash).void
      end
      attr_writer :spec

      sig do
        params(
          spec: DockerEngineAPI::ConfigCreateParams::Spec::OrHash,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            spec: DockerEngineAPI::ConfigCreateParams::Spec,
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
              DockerEngineAPI::ConfigCreateParams::Spec,
              DockerEngineAPI::Internal::AnyHash
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
