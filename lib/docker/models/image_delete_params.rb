# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Images#delete
    class ImageDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute force
      #   Remove the image even if it is being used by stopped containers or has other
      #   tags
      #
      #   @return [Boolean, nil]
      optional :force, Docker::Internal::Type::Boolean

      # @!attribute noprune
      #   Do not delete untagged parent images
      #
      #   @return [Boolean, nil]
      optional :noprune, Docker::Internal::Type::Boolean

      # @!attribute platforms
      #   Select platform-specific content to delete. Multiple values are accepted. Each
      #   platform is a OCI platform encoded as a JSON string.
      #
      #   @return [Array<String>, nil]
      optional :platforms, Docker::Internal::Type::ArrayOf[String]

      # @!method initialize(force: nil, noprune: nil, platforms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ImageDeleteParams} for more details.
      #
      #   @param force [Boolean] Remove the image even if it is being used by stopped containers or has other tag
      #
      #   @param noprune [Boolean] Do not delete untagged parent images
      #
      #   @param platforms [Array<String>] Select platform-specific content to delete.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
