# typed: strong

module DockerEngineRuby
  module Models
    class ContainerPruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::ContainerPruneResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Container IDs that were deleted
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :containers_deleted

      sig { params(containers_deleted: T::Array[String]).void }
      attr_writer :containers_deleted

      # Disk space reclaimed in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

      sig do
        params(
          containers_deleted: T::Array[String],
          space_reclaimed: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Container IDs that were deleted
        containers_deleted: nil,
        # Disk space reclaimed in bytes
        space_reclaimed: nil
      )
      end

      sig do
        override.returns(
          { containers_deleted: T::Array[String], space_reclaimed: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
