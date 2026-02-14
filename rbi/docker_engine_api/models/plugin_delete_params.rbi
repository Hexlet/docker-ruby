# typed: strong

module DockerEngineAPI
  module Models
    class PluginDeleteParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginDeleteParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Disable the plugin before removing. This may result in issues if the plugin is
      # in use by a container.
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
        # Disable the plugin before removing. This may result in issues if the plugin is
        # in use by a container.
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
