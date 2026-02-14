# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class ImageSearchResponseItem < DockerEngineRuby::Internal::Type::BaseModel
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
      optional :is_automated, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute is_official
      #
      #   @return [Boolean, nil]
      optional :is_official, DockerEngineRuby::Internal::Type::Boolean

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
      #   {DockerEngineRuby::Models::ImageSearchResponseItem} for more details.
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

    # @type [DockerEngineRuby::Internal::Type::Converter]
    ImageSearchResponse =
      DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Models::ImageSearchResponseItem }]
  end
end
