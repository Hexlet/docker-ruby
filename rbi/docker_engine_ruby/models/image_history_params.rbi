# typed: strong

module DockerEngineRuby
  module Models
    class ImageHistoryParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageHistoryParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig do
        params(
          platform: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(platform: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            platform: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
