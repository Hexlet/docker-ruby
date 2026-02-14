# typed: strong

module DockerEngineAPI
  module Models
    class ImageHistoryParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ImageHistoryParams,
            DockerEngineAPI::Internal::AnyHash
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
          { platform: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
