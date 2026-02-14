# typed: strong

module DockerEngine
  module Models
    class PluginEnableParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::PluginEnableParams,
            DockerEngine::Internal::AnyHash
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
          request_options: DockerEngine::RequestOptions::OrHash
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
          { timeout: Integer, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
