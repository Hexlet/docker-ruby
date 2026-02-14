# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#history
    class ImageHistoryParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute platform
      #   JSON-encoded OCI platform to select the platform-variant. If omitted, it
      #   defaults to any locally available platform, prioritizing the daemon's host
      #   platform.
      #
      #   If the daemon provides a multi-platform image store, this selects the
      #   platform-variant to show the history for. If the image is a single-platform
      #   image, or if the multi-platform image does not provide a variant matching the
      #   given platform, an error is returned.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [String, nil]
      optional :platform, String

      # @!method initialize(platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageHistoryParams} for more details.
      #
      #   @param platform [String] JSON-encoded OCI platform to select the platform-variant.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
