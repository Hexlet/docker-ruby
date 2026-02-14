# typed: strong

module DockerEngine
  module Models
    class NodeUpdateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::NodeUpdateParams, DockerEngine::Internal::AnyHash)
        end

      # The version number of the node object being updated. This is required to avoid
      # conflicting writes.
      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          version: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The version number of the node object being updated. This is required to avoid
        # conflicting writes.
        version:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { version: Integer, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
