# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#prune
    class ImagePruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute images_deleted
      #
      #   @return [Array<DockerEngineRuby::Models::DeleteItem>, nil]
      optional :images_deleted,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::DeleteItem] },
               api_name: :ImagesDeleted

      # @!attribute space_reclaimed
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!method initialize(images_deleted: nil, space_reclaimed: nil)
      #   @param images_deleted [Array<DockerEngineRuby::Models::DeleteItem>]
      #   @param space_reclaimed [Integer]
    end
  end
end
