# typed: strong

module Docker
  module Models
    class Error < Docker::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Docker::Error, Docker::Internal::AnyHash) }

      # The error message.
      sig { returns(String) }
      attr_accessor :message

      # Represents an error.
      sig { params(message: String).returns(T.attached_class) }
      def self.new(
        # The error message.
        message:
      )
      end

      sig { override.returns({ message: String }) }
      def to_hash
      end
    end
  end
end
