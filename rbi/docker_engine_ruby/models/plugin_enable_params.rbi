# typed: strong

module DockerEngineRuby
  module Models
    class PluginEnableParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PluginEnableParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout

      sig { params(timeout: Integer).void }
      attr_writer :timeout

      sig do
        params(
          timeout: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(timeout: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            timeout: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
