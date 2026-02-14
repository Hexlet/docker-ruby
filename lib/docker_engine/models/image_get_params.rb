# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#get
    class ImageGetParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute platform
      #   JSON encoded OCI platform describing a platform which will be used to select a
      #   platform-specific image to be saved if the image is multi-platform. If not
      #   provided, the full multi-platform image will be saved.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngine::Internal::Type::ArrayOf[String]

      # @!method initialize(platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageGetParams} for more details.
      #
      #   @param platform [Array<String>] JSON encoded OCI platform describing a platform which will be used
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
