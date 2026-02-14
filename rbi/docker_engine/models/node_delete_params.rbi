# typed: strong

module DockerEngine
  module Models
    class NodeDeleteParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::NodeDeleteParams, DockerEngine::Internal::AnyHash)
        end

      # Force remove a node from the swarm
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      sig do
        params(
          force: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Force remove a node from the swarm
        force: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { force: T::Boolean, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
