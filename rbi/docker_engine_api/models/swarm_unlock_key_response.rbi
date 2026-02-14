# typed: strong

module DockerEngineAPI
  module Models
    class SwarmUnlockKeyResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::Models::SwarmUnlockKeyResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The swarm's unlock key.
      sig { returns(T.nilable(String)) }
      attr_reader :unlock_key

      sig { params(unlock_key: String).void }
      attr_writer :unlock_key

      sig { params(unlock_key: String).returns(T.attached_class) }
      def self.new(
        # The swarm's unlock key.
        unlock_key: nil
      )
      end

      sig { override.returns({ unlock_key: String }) }
      def to_hash
      end
    end
  end
end
