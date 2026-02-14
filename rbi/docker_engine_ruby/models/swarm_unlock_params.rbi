# typed: strong

module DockerEngineRuby
  module Models
    class SwarmUnlockParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SwarmUnlockParams,
            DockerEngineRuby::Internal::AnyHash
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
