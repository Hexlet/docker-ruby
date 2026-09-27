# typed: strong

module DockerEngineRuby
  module Models
    class VolumeCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::VolumeCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::CreateRequest) }
      attr_reader :create_request

      sig do
        params(create_request: DockerEngineRuby::CreateRequest::OrHash).void
      end
      attr_writer :create_request

      sig do
        params(
          create_request: DockerEngineRuby::CreateRequest::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(create_request:, request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngineRuby::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
