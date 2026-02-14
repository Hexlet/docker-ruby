# typed: strong

module DockerEngineRuby
  module Models
    class SwarmUnlockKeyResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::SwarmUnlockKeyResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :unlock_key

      sig { params(unlock_key: String).void }
      attr_writer :unlock_key

      sig { params(unlock_key: String).returns(T.attached_class) }
      def self.new(unlock_key: nil)
      end

      sig { override.returns({ unlock_key: String }) }
      def to_hash
      end
    end
  end
end
