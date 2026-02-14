# typed: strong

module DockerEngineAPI
  module Models
    class SecretUpdateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SecretUpdateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The version number of the secret object being updated. This is required to avoid
      # conflicting writes.
      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          version: Integer,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The version number of the secret object being updated. This is required to avoid
        # conflicting writes.
        version:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { version: Integer, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
