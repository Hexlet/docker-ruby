# typed: strong

module DockerEngineRuby
  module Models
    class NetworkCreateResponse < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NetworkCreateResponse,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # The ID of the created network.
      sig { returns(String) }
      attr_accessor :id

      # Warnings encountered when creating the container
      sig { returns(String) }
      attr_accessor :warning

      # OK response to NetworkCreate operation
      sig { params(id: String, warning: String).returns(T.attached_class) }
      def self.new(
        # The ID of the created network.
        id:,
        # Warnings encountered when creating the container
        warning:
      )
      end

      sig { override.returns({ id: String, warning: String }) }
      def to_hash
      end
    end
  end
end
