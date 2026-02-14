# frozen_string_literal: true

module DockerEngine
  module Models
    class ImageDeleteResponseItem < DockerEngine::Internal::Type::BaseModel
      # @!attribute deleted
      #   The image ID of an image that was deleted
      #
      #   @return [String, nil]
      optional :deleted, String, api_name: :Deleted

      # @!attribute untagged
      #   The image ID of an image that was untagged
      #
      #   @return [String, nil]
      optional :untagged, String, api_name: :Untagged

      # @!method initialize(deleted: nil, untagged: nil)
      #   @param deleted [String] The image ID of an image that was deleted
      #
      #   @param untagged [String] The image ID of an image that was untagged
    end

    # @type [DockerEngine::Internal::Type::Converter]
    ImageDeleteResponse =
      DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Models::ImageDeleteResponseItem }]
  end
end
