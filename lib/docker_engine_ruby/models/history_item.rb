# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class HistoryItem < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute comment
      #
      #   @return [String]
      required :comment, String, api_name: :Comment

      # @!attribute created
      #
      #   @return [Integer]
      required :created, Integer, api_name: :Created

      # @!attribute created_by
      #
      #   @return [String]
      required :created_by, String, api_name: :CreatedBy

      # @!attribute id
      #
      #   @return [String]
      required :id, String, api_name: :Id

      # @!attribute size
      #
      #   @return [Integer]
      required :size, Integer, api_name: :Size

      # @!attribute tags
      #
      #   @return [Array<String>]
      required :tags, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Tags

      # @!method initialize(comment:, created:, created_by:, id:, size:, tags:)
      #   individual image layer information in response to ImageHistory operation
      #
      #   @param comment [String]
      #   @param created [Integer]
      #   @param created_by [String]
      #   @param id [String]
      #   @param size [Integer]
      #   @param tags [Array<String>]
    end
  end
end
