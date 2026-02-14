# typed: strong

module DockerEngineRuby
  module Models
    class SecretUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SecretUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          version: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(version:, request_options: {})
      end

      sig do
        override.returns(
          {
            version: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
