# typed: strong

module DockerEngineRuby
  module Models
    class UpdateResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::UpdateResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Warnings encountered when updating the container.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :warnings

      sig { params(warnings: T::Array[String]).void }
      attr_writer :warnings

      # Response for a successful container-update.
      sig { params(warnings: T::Array[String]).returns(T.attached_class) }
      def self.new(
        # Warnings encountered when updating the container.
        warnings: nil
      )
      end

      sig { override.returns({ warnings: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
