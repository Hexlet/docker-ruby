# typed: strong

module DockerEngineRuby
  module Models
    class PluginSetParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PluginSetParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :body

      sig { params(body: T::Array[String]).void }
      attr_writer :body

      sig do
        params(
          body: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            body: T::Array[String],
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
