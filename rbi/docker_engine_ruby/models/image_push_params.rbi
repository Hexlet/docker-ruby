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

      # JSON-encoded OCI platform to select the platform-variant to push. If not
      # provided, all available variants will attempt to be pushed.
      #
      # If the daemon provides a multi-platform image store, this selects the
      # platform-variant to push to the registry. If the image is a single-platform
      # image, or if the multi-platform image does not provide a variant matching the
      # given platform, an error is returned.
      #
      # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      # Tag of the image to push. For example, `latest`. If no tag is provided, all tags
      # of the given image that are present in the local image store are pushed.
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
        # JSON-encoded OCI platform to select the platform-variant to push. If not
        # provided, all available variants will attempt to be pushed.
        #
        # If the daemon provides a multi-platform image store, this selects the
        # platform-variant to push to the registry. If the image is a single-platform
        # image, or if the multi-platform image does not provide a variant matching the
        # given platform, an error is returned.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        # Tag of the image to push. For example, `latest`. If no tag is provided, all tags
        # of the given image that are present in the local image store are pushed.
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
