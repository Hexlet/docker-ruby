# typed: strong

module DockerEngine
  module Models
    class PluginSetParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::PluginSetParams, DockerEngine::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :body

      sig { params(body: T::Array[String]).void }
      attr_writer :body

      sig do
        params(
          body: T::Array[String],
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            body: T::Array[String],
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
