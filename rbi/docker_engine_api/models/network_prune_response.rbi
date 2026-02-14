# typed: strong

module DockerEngineAPI
  module Models
    class NetworkPruneResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::Models::NetworkPruneResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Networks that were deleted
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :networks_deleted

      sig { params(networks_deleted: T::Array[String]).void }
      attr_writer :networks_deleted

      sig do
        params(networks_deleted: T::Array[String]).returns(T.attached_class)
      end
      def self.new(
        # Networks that were deleted
        networks_deleted: nil
      )
      end

      sig { override.returns({ networks_deleted: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
