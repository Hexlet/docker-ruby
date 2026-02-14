# typed: strong

module DockerEngine
  module Models
    class PluginCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::PluginCreateParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # The name of the plugin. The `:latest` tag is optional, and is the default if
      # omitted.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(DockerEngine::Internal::FileInput) }
      attr_accessor :body

      sig do
        params(
          name: String,
          body: DockerEngine::Internal::FileInput,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name:,
        body:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            body: DockerEngine::Internal::FileInput,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
