# typed: strong

module DockerEngineRuby
  module Models
    class ImagePushParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImagePushParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :x_registry_auth

      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig do
        params(
          x_registry_auth: String,
          platform: String,
          tag: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        x_registry_auth:,
        platform: nil,
        tag: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            x_registry_auth: String,
            platform: String,
            tag: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
