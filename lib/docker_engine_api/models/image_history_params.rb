# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#history
    class ImageHistoryParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

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
      #   {DockerEngineAPI::Models::ImageHistoryParams} for more details.
      #
      #   @param platform [String] JSON-encoded OCI platform to select the platform-variant.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
