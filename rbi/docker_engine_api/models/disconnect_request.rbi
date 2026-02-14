# typed: strong

module DockerEngineAPI
  module Models
    class DisconnectRequest < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::DisconnectRequest,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The ID or name of the container to disconnect from the network.
      sig { returns(String) }
      attr_accessor :container

      # Force the container to disconnect from the network.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      # NetworkDisconnectRequest represents the data to be used to disconnect a
      # container from a network.
      sig do
        params(container: String, force: T::Boolean).returns(T.attached_class)
      end
      def self.new(
        # The ID or name of the container to disconnect from the network.
        container:,
        # Force the container to disconnect from the network.
        force: nil
      )
      end

      sig { override.returns({ container: String, force: T::Boolean }) }
      def to_hash
      end
    end
  end
end
