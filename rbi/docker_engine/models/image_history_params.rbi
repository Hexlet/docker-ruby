# typed: strong

module DockerEngine
  module Models
    class ImageHistoryParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ImageHistoryParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # JSON-encoded OCI platform to select the platform-variant. If omitted, it
      # defaults to any locally available platform, prioritizing the daemon's host
      # platform.
      #
      # If the daemon provides a multi-platform image store, this selects the
      # platform-variant to show the history for. If the image is a single-platform
      # image, or if the multi-platform image does not provide a variant matching the
      # given platform, an error is returned.
      #
      # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig do
        params(
          platform: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # JSON-encoded OCI platform to select the platform-variant. If omitted, it
        # defaults to any locally available platform, prioritizing the daemon's host
        # platform.
        #
        # If the daemon provides a multi-platform image store, this selects the
        # platform-variant to show the history for. If the image is a single-platform
        # image, or if the multi-platform image does not provide a variant matching the
        # given platform, an error is returned.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { platform: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
