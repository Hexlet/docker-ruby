# typed: strong

module DockerEngineRuby
  module Models
    class ServiceCreateResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceCreateResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # The ID of the created service.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Optional warning message.
      #
      # FIXME(thaJeztah): this should have "omitempty" in the generated type.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :warnings

      # contains the information returned to a client on the creation of a new service.
      sig do
        params(id: String, warnings: T.nilable(T::Array[String])).returns(
          T.attached_class
        )
      end
      def self.new(
        # The ID of the created service.
        id: nil,
        # Optional warning message.
        #
        # FIXME(thaJeztah): this should have "omitempty" in the generated type.
        warnings: nil
      )
      end

      sig do
        override.returns({ id: String, warnings: T.nilable(T::Array[String]) })
      end
      def to_hash
      end
    end
  end
end
