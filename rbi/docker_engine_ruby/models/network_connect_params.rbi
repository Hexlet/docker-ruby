# typed: strong

module DockerEngineRuby
  module Models
    class NetworkConnectParams < DockerEngineRuby::Models::ConnectRequest
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NetworkConnectParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngineRuby::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
