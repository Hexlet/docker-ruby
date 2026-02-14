# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#load_
    class ImageLoadParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngineRuby::FilePart]
      required :body, DockerEngineRuby::Internal::Type::FileInput

      # @!attribute platform
      #   JSON encoded OCI platform(s) which will be used to select the platform-specific
      #   image(s) to load if the image is multi-platform. If not provided, the full
      #   multi-platform image will be loaded.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute quiet
      #   Suppress progress details during load.
      #
      #   @return [Boolean, nil]
      optional :quiet, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(body:, platform: nil, quiet: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ImageLoadParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngineRuby::FilePart]
      #
      #   @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      #   @param quiet [Boolean] Suppress progress details during load.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
