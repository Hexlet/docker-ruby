# typed: strong

module DockerEngineRuby
  module Models
    class ImageGetParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageGetParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # JSON encoded OCI platform describing a platform which will be used to select a
      # platform-specific image to be saved if the image is multi-platform. If not
      # provided, the full multi-platform image will be saved.
      #
      # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :platform

      sig { params(platform: T::Array[String]).void }
      attr_writer :platform

      sig do
        params(
          platform: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # JSON encoded OCI platform describing a platform which will be used to select a
        # platform-specific image to be saved if the image is multi-platform. If not
        # provided, the full multi-platform image will be saved.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            platform: T::Array[String],
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
