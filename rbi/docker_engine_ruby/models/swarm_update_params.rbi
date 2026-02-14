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

      sig { returns(Integer) }
      attr_accessor :version

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rotate_manager_token

      sig { params(rotate_manager_token: T::Boolean).void }
      attr_writer :rotate_manager_token

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rotate_manager_unlock_key

      sig { params(rotate_manager_unlock_key: T::Boolean).void }
      attr_writer :rotate_manager_unlock_key

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
        version:,
        rotate_manager_token: nil,
        rotate_manager_unlock_key: nil,
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
