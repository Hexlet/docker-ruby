# typed: strong

module DockerEngine
  module Models
    class Privilege < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::Privilege, DockerEngine::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :value

      sig { params(value: T::Array[String]).void }
      attr_writer :value

      # Describes a permission the user has to accept upon installing the plugin.
      sig do
        params(
          description: String,
          name: String,
          value: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(description: nil, name: nil, value: nil)
      end

      sig do
        override.returns(
          { description: String, name: String, value: T::Array[String] }
        )
      end
      def to_hash
      end
    end
  end
end
