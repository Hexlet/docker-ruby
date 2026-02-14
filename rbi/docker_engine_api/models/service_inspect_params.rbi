# typed: strong

module DockerEngineAPI
  module Models
    class ServiceInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ServiceInspectParams,
            DockerEngineAPI::Internal::AnyHash
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
