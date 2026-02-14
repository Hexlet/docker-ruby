# typed: strong

module DockerEngineRuby
  module Models
    class HistoryItem < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::HistoryItem,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :comment

      sig { returns(Integer) }
      attr_accessor :created

      sig { returns(String) }
      attr_accessor :created_by

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :size

      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # individual image layer information in response to ImageHistory operation
      sig do
        params(
          comment: String,
          created: Integer,
          created_by: String,
          id: String,
          size: Integer,
          tags: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(comment:, created:, created_by:, id:, size:, tags:)
      end

      sig do
        override.returns(
          {
            comment: String,
            created: Integer,
            created_by: String,
            id: String,
            size: Integer,
            tags: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
