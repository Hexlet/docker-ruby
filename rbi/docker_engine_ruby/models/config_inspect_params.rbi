# typed: strong

module DockerEngineRuby
  module Models
    class ConfigInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ConfigInspectParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngineRuby::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
