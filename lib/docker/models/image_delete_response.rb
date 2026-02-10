# frozen_string_literal: true

module Docker
  module Models
    class ImageDeleteResponseItem < Docker::Internal::Type::BaseModel
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

    # @type [Docker::Internal::Type::Converter]
    ImageDeleteResponse = Docker::Internal::Type::ArrayOf[-> { Docker::Models::ImageDeleteResponseItem }]
  end
end
