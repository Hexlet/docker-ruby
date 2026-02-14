# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#get
    class ImageGetParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute platform
      #   JSON encoded OCI platform describing a platform which will be used to select a
      #   platform-specific image to be saved if the image is multi-platform. If not
      #   provided, the full multi-platform image will be saved.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImageGetParams} for more details.
      #
      #   @param platform [Array<String>] JSON encoded OCI platform describing a platform which will be used
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
