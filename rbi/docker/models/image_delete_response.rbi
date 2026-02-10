# typed: strong

module Docker
  module Models
    class ImageDeleteResponseItem < Docker::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Docker::Models::ImageDeleteResponseItem,
            Docker::Internal::AnyHash
          )
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

    ImageDeleteResponse =
      T.let(
        Docker::Internal::Type::ArrayOf[
          Docker::Models::ImageDeleteResponseItem
        ],
        Docker::Internal::Type::Converter
      )
  end
end
