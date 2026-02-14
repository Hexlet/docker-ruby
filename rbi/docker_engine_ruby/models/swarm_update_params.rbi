# typed: strong

module DockerEngineRuby
  module Models
    class SwarmUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SwarmUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # The version number of the swarm object being updated. This is required to avoid
      # conflicting writes.
      sig { returns(Integer) }
      attr_accessor :version

      # Rotate the manager join token.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rotate_manager_token

      sig { params(rotate_manager_token: T::Boolean).void }
      attr_writer :rotate_manager_token

      # Rotate the manager unlock key.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rotate_manager_unlock_key

      sig { params(rotate_manager_unlock_key: T::Boolean).void }
      attr_writer :rotate_manager_unlock_key

      # Rotate the worker join token.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rotate_worker_token

      sig { params(rotate_worker_token: T::Boolean).void }
      attr_writer :rotate_worker_token

      sig do
        params(
          version: Integer,
          rotate_manager_token: T::Boolean,
          rotate_manager_unlock_key: T::Boolean,
          rotate_worker_token: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The version number of the swarm object being updated. This is required to avoid
        # conflicting writes.
        version:,
        # Rotate the manager join token.
        rotate_manager_token: nil,
        # Rotate the manager unlock key.
        rotate_manager_unlock_key: nil,
        # Rotate the worker join token.
        rotate_worker_token: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            version: Integer,
            rotate_manager_token: T::Boolean,
            rotate_manager_unlock_key: T::Boolean,
            rotate_worker_token: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
