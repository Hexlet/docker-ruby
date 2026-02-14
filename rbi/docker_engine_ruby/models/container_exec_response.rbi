# typed: strong

module DockerEngineRuby
  module Models
    class ContainerExecResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::ContainerExecResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # The id of the newly created object.
      sig { returns(String) }
      attr_accessor :id

      # Response to an API call that returns just an Id
      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # The id of the newly created object.
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
