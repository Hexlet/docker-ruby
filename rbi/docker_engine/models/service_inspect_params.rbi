# typed: strong

module DockerEngine
  module Models
    class ServiceInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ServiceInspectParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Fill empty fields with default values.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :insert_defaults

      sig { params(insert_defaults: T::Boolean).void }
      attr_writer :insert_defaults

      sig do
        params(
          insert_defaults: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Fill empty fields with default values.
        insert_defaults: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            insert_defaults: T::Boolean,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
