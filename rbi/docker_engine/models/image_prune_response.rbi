# typed: strong

module DockerEngine
  module Models
    class ImagePruneResponse < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::Models::ImagePruneResponse,
            DockerEngine::Internal::AnyHash
          )
        end

      # Images that were deleted
      sig { returns(T.nilable(T::Array[DockerEngine::DeleteItem])) }
      attr_reader :images_deleted

      sig do
        params(images_deleted: T::Array[DockerEngine::DeleteItem::OrHash]).void
      end
      attr_writer :images_deleted

      # Disk space reclaimed in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

      sig do
        params(
          images_deleted: T::Array[DockerEngine::DeleteItem::OrHash],
          space_reclaimed: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Images that were deleted
        images_deleted: nil,
        # Disk space reclaimed in bytes
        space_reclaimed: nil
      )
      end

      sig do
        override.returns(
          {
            images_deleted: T::Array[DockerEngine::DeleteItem],
            space_reclaimed: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
