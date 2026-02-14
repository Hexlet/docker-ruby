# typed: strong

module DockerEngineAPI
  module Models
    class SwarmLeaveParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SwarmLeaveParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Force leave swarm, even if this is the last manager or that it will break the
      # cluster.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      sig do
        params(
          force: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Force leave swarm, even if this is the last manager or that it will break the
        # cluster.
        force: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            force: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
