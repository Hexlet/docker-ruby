# typed: strong

module DockerEngineRuby
  module Models
    class ImagePruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::ImagePruneResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[DockerEngineRuby::DeleteItem])) }
      attr_reader :images_deleted

      sig do
        params(
          images_deleted: T::Array[DockerEngineRuby::DeleteItem::OrHash]
        ).void
      end
      attr_writer :images_deleted

      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

      sig do
        params(
          images_deleted: T::Array[DockerEngineRuby::DeleteItem::OrHash],
          space_reclaimed: Integer
        ).returns(T.attached_class)
      end
      def self.new(images_deleted: nil, space_reclaimed: nil)
      end

      sig do
        override.returns(
          {
            images_deleted: T::Array[DockerEngineRuby::DeleteItem],
            space_reclaimed: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
