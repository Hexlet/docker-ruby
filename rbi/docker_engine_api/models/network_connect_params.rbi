# typed: strong

module DockerEngineAPI
  module Models
    class NetworkConnectParams < DockerEngineAPI::Models::ConnectRequest
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::NetworkConnectParams,
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
