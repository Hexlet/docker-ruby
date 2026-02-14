# frozen_string_literal: true

module DockerEngineAPI
  module Models
    class ImageSearchResponseItem < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute is_automated
      #   Whether this repository has automated builds enabled.
      #
      #   <p><br /></p>
      #
      #   > **Deprecated**: This field is deprecated and will always be "false".
      #
      #   @return [Boolean, nil]
      optional :is_automated, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute is_official
      #
      #   @return [Boolean, nil]
      optional :is_official, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute star_count
      #
      #   @return [Integer, nil]
      optional :star_count, Integer

      # @!method initialize(description: nil, is_automated: nil, is_official: nil, name: nil, star_count: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ImageSearchResponseItem} for more details.
      #
      #   @param description [String]
      #
      #   @param is_automated [Boolean] Whether this repository has automated builds enabled.
      #
      #   @param is_official [Boolean]
      #
      #   @param name [String]
      #
      #   @param star_count [Integer]
    end

    # @type [DockerEngineAPI::Internal::Type::Converter]
    ImageSearchResponse =
      DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Models::ImageSearchResponseItem }]
  end
end
