# typed: strong

module DockerEngineAPI
  module Models
    class SwarmUnlockParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SwarmUnlockParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The swarm's unlock key.
      sig { returns(T.nilable(String)) }
      attr_reader :unlock_key

      sig { params(unlock_key: String).void }
      attr_writer :unlock_key

      sig do
        params(
          unlock_key: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The swarm's unlock key.
        unlock_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            unlock_key: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
