# typed: strong

module DockerEngine
  module Models
    class Error < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::Error, DockerEngine::Internal::AnyHash)
        end

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
