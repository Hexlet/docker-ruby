# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#get_all
    class ImageGetAllParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute names
      #   Image names to filter by
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute platform
      #   JSON encoded OCI platform(s) which will be used to select the platform-specific
      #   image(s) to be saved if the image is multi-platform. If not provided, the full
      #   multi-platform image will be saved.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(names: nil, platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImageGetAllParams} for more details.
      #
      #   @param names [Array<String>] Image names to filter by
      #
      #   @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
