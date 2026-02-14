# typed: strong

module DockerEngineAPI
  module Models
    class PluginCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginCreateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The name of the plugin. The `:latest` tag is optional, and is the default if
      # omitted.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(DockerEngineAPI::Internal::FileInput) }
      attr_accessor :body

      sig do
        params(
          name: String,
          body: DockerEngineAPI::Internal::FileInput,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            body: DockerEngineAPI::Internal::FileInput,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
