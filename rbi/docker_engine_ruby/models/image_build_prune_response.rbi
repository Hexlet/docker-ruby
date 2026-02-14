# typed: strong

module DockerEngineRuby
  module Models
    class ImageBuildPruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::ImageBuildPruneResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :caches_deleted

      sig { params(caches_deleted: T::Array[String]).void }
      attr_writer :caches_deleted

      # Disk space reclaimed in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

      sig do
        params(
          caches_deleted: T::Array[String],
          space_reclaimed: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        caches_deleted: nil,
        # Disk space reclaimed in bytes
        space_reclaimed: nil
      )
      end

      sig do
        override.returns(
          { caches_deleted: T::Array[String], space_reclaimed: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
