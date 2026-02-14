# typed: strong

module DockerEngineAPI
  module Models
    class PluginEnableParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginEnableParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Set the HTTP client timeout (in seconds)
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout

      sig { params(timeout: Integer).void }
      attr_writer :timeout

      sig do
        params(
          timeout: Integer,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Set the HTTP client timeout (in seconds)
        timeout: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { timeout: Integer, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
