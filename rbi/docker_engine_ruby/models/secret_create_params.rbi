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

      sig { returns(DockerEngineRuby::SecretSpec) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::SecretSpec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          spec: DockerEngineRuby::SecretSpec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec:, request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngineRuby::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
