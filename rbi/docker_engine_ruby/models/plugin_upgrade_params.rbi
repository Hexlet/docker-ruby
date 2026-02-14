# typed: strong

module DockerEngineRuby
  module Models
    class PluginUpgradeParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::PluginUpgradeParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :remote

      sig { returns(T::Array[DockerEngineRuby::Privilege]) }
      attr_accessor :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          remote: String,
          body: T::Array[DockerEngineRuby::Privilege::OrHash],
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(remote:, body:, x_registry_auth: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            remote: String,
            body: T::Array[DockerEngineRuby::Privilege],
            x_registry_auth: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
