# typed: strong

module DockerEngine
  module Models
    class PluginPrivilegesParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::PluginPrivilegesParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # The name of the plugin. The `:latest` tag is optional, and is the default if
      # omitted.
      sig { returns(String) }
      attr_accessor :remote

      sig do
        params(
          remote: String,
          request_options: DockerEngine::RequestOptions::OrHash
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
          { remote: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
