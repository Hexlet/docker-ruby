# typed: strong

module DockerEngineAPI
  module Models
    class PluginDisableParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginDisableParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Force disable a plugin even if still in use.
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
        # Force disable a plugin even if still in use.
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
