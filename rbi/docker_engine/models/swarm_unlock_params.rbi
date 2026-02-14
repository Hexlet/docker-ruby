# typed: strong

module DockerEngine
  module Models
    class SwarmUnlockParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::SwarmUnlockParams,
            DockerEngine::Internal::AnyHash
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
          request_options: DockerEngine::RequestOptions::OrHash
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
          { unlock_key: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
