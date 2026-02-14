# typed: strong

module DockerEngineAPI
  module Models
    class PluginSetParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::PluginSetParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :body

      sig { params(body: T::Array[String]).void }
      attr_writer :body

      sig do
        params(
          body: T::Array[String],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            body: T::Array[String],
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
