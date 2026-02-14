# typed: strong

module DockerEngineRuby
  module Models
    class PluginPrivilegesParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PluginPrivilegesParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :remote

      sig do
        params(
          remote: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(remote:, request_options: {})
      end

      sig do
        override.returns(
          { remote: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
