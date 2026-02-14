# typed: strong

module DockerEngineRuby
  module Models
    class ServiceInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceInspectParams,
            DockerEngineRuby::Internal::AnyHash
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
