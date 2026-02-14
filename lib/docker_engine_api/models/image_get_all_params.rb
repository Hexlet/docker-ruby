# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#get_all
    class ImageGetAllParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute names
      #   Image names to filter by
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngineAPI::Internal::Type::ArrayOf[String]

      # @!attribute platform
      #   JSON encoded OCI platform(s) which will be used to select the platform-specific
      #   image(s) to be saved if the image is multi-platform. If not provided, the full
      #   multi-platform image will be saved.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineAPI::Internal::Type::ArrayOf[String]

      # @!method initialize(names: nil, platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ImageGetAllParams} for more details.
      #
      #   @param names [Array<String>] Image names to filter by
      #
      #   @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
