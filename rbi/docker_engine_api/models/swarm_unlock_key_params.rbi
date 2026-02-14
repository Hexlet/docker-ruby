# typed: strong

module DockerEngineAPI
  module Models
    class SwarmUnlockKeyParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SwarmUnlockKeyParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngineAPI::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
