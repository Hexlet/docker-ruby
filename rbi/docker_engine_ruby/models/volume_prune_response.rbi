# typed: strong

module DockerEngineRuby
  module Models
    class VolumePruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::VolumePruneResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :space_reclaimed

      sig { params(space_reclaimed: Integer).void }
      attr_writer :space_reclaimed

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
      def self.new(space_reclaimed: nil, volumes_deleted: nil)
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
