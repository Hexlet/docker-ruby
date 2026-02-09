# typed: strong

module Docker
  module Models
    class CreateResponse < Docker::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Docker::CreateResponse, Docker::Internal::AnyHash)
        end

      # The ID of the created container
      sig { returns(String) }
      attr_accessor :id

      # Warnings encountered when creating the container
      sig { returns(T::Array[String]) }
      attr_accessor :warnings

      # OK response to ContainerCreate operation
      sig do
        params(id: String, warnings: T::Array[String]).returns(T.attached_class)
      end
      def self.new(
        # The ID of the created container
        id:,
        # Warnings encountered when creating the container
        warnings:
      )
      end

      sig { override.returns({ id: String, warnings: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
