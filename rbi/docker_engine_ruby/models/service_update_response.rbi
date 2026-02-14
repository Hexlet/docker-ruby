# typed: strong

module DockerEngineRuby
  module Models
    class ServiceUpdateResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceUpdateResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Optional warning messages
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :warnings

      sig { params(warnings: T::Array[String]).void }
      attr_writer :warnings

      sig { params(warnings: T::Array[String]).returns(T.attached_class) }
      def self.new(
        # Optional warning messages
        warnings: nil
      )
      end

      sig { override.returns({ warnings: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
