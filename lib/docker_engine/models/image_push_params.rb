# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#push
    class ImagePushParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute x_registry_auth
      #
      #   @return [String]
      required :x_registry_auth, String

      # @!attribute platform
      #   JSON-encoded OCI platform to select the platform-variant to push. If not
      #   provided, all available variants will attempt to be pushed.
      #
      #   If the daemon provides a multi-platform image store, this selects the
      #   platform-variant to push to the registry. If the image is a single-platform
      #   image, or if the multi-platform image does not provide a variant matching the
      #   given platform, an error is returned.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute tag
      #   Tag of the image to push. For example, `latest`. If no tag is provided, all tags
      #   of the given image that are present in the local image store are pushed.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(x_registry_auth:, platform: nil, tag: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImagePushParams} for more details.
      #
      #   @param x_registry_auth [String]
      #
      #   @param platform [String] JSON-encoded OCI platform to select the platform-variant to push.
      #
      #   @param tag [String] Tag of the image to push. For example, `latest`. If no tag is provided,
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
