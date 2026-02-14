# typed: strong

module DockerEngineRuby
  module Models
    class InspectResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::InspectResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :arguments

      sig { params(arguments: T::Array[String]).void }
      attr_writer :arguments

      sig { returns(T.nilable(String)) }
      attr_reader :entrypoint

      sig { params(entrypoint: String).void }
      attr_writer :entrypoint

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :privileged

      sig { params(privileged: T::Boolean).void }
      attr_writer :privileged

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      sig { returns(T.nilable(String)) }
      attr_reader :user

      sig { params(user: String).void }
      attr_writer :user

      sig do
        params(
          arguments: T::Array[String],
          entrypoint: String,
          privileged: T::Boolean,
          tty: T::Boolean,
          user: String
        ).returns(T.attached_class)
      end
      def self.new(
        arguments: nil,
        entrypoint: nil,
        privileged: nil,
        tty: nil,
        user: nil
      )
      end

      sig do
        override.returns(
          {
            arguments: T::Array[String],
            entrypoint: String,
            privileged: T::Boolean,
            tty: T::Boolean,
            user: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
