# typed: strong

module DockerEngine
  module Models
    class DeleteItem < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::DeleteItem, DockerEngine::Internal::AnyHash)
        end

      # The image ID of an image that was deleted
      sig { returns(T.nilable(String)) }
      attr_reader :deleted

      sig { params(deleted: String).void }
      attr_writer :deleted

      # The image ID of an image that was untagged
      sig { returns(T.nilable(String)) }
      attr_reader :untagged

      sig { params(untagged: String).void }
      attr_writer :untagged

      sig do
        params(deleted: String, untagged: String).returns(T.attached_class)
      end
      def self.new(
        # The image ID of an image that was deleted
        deleted: nil,
        # The image ID of an image that was untagged
        untagged: nil
      )
      end

      sig { override.returns({ deleted: String, untagged: String }) }
      def to_hash
      end
    end
  end
end
