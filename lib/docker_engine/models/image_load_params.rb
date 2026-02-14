# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#load_
    class ImageLoadParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngine::FilePart]
      required :body, DockerEngine::Internal::Type::FileInput

      # @!attribute platform
      #   JSON encoded OCI platform(s) which will be used to select the platform-specific
      #   image(s) to load if the image is multi-platform. If not provided, the full
      #   multi-platform image will be loaded.
      #
      #   Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngine::Internal::Type::ArrayOf[String]

      # @!attribute quiet
      #   Suppress progress details during load.
      #
      #   @return [Boolean, nil]
      optional :quiet, DockerEngine::Internal::Type::Boolean

      # @!method initialize(body:, platform: nil, quiet: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageLoadParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngine::FilePart]
      #
      #   @param platform [Array<String>] JSON encoded OCI platform(s) which will be used to select the
      #
      #   @param quiet [Boolean] Suppress progress details during load.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
