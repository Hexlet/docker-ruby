# typed: strong

module Docker
  module Models
    class ServiceInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ServiceInspectParams, Docker::Internal::AnyHash)
        end

      # Fill empty fields with default values.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :insert_defaults

      sig { params(insert_defaults: T::Boolean).void }
      attr_writer :insert_defaults

      sig do
        params(
          insert_defaults: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
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
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
