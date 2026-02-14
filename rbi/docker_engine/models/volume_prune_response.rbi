# typed: strong

module DockerEngine
  module Models
    class VolumePruneResponse < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::Models::VolumePruneResponse,
            DockerEngine::Internal::AnyHash
          )
        end

      # Disk space reclaimed in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

      # Volumes that were deleted
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :volumes_deleted

      sig { params(volumes_deleted: T::Array[String]).void }
      attr_writer :volumes_deleted

      sig do
        params(
          space_reclaimed: Integer,
          volumes_deleted: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Disk space reclaimed in bytes
        space_reclaimed: nil,
        # Volumes that were deleted
        volumes_deleted: nil
      )
      end

      sig do
        override.returns(
          { space_reclaimed: Integer, volumes_deleted: T::Array[String] }
        )
      end
      def to_hash
      end
    end
  end
end
