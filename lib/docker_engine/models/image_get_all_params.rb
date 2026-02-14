# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#get_all
    class ImageGetAllParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute names
      #   Image names to filter by
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngine::Internal::Type::ArrayOf[String]

      # @!attribute platform
      #   JSON encoded OCI platform(s) which will be used to select the platform-specific
      #   image(s) to be saved if the image is multi-platform. If not provided, the full
      #   multi-platform image will be saved.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngine::Internal::Type::ArrayOf[String]

      # @!method initialize(names: nil, platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageGetAllParams} for more details.
      #
      #   @param names [Array<String>] Image names to filter by
      #
      #   @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
