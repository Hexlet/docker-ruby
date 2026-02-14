# typed: strong

module DockerEngineAPI
  module Models
    class PluginPrivilegesParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginPrivilegesParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The name of the plugin. The `:latest` tag is optional, and is the default if
      # omitted.
      sig { returns(String) }
      attr_accessor :remote

      sig do
        params(
          remote: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        remote:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { remote: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
