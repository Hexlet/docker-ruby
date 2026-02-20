# typed: strong

module DockerEngineRuby
  module Models
    class PluginCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PluginCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(DockerEngineRuby::Internal::FileInput) }
      attr_accessor :body

      sig do
        params(
          name: String,
          body: DockerEngineRuby::Internal::FileInput,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(name:, body:, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            body: DockerEngineRuby::Internal::FileInput,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
