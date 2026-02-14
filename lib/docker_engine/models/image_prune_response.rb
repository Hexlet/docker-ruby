# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#prune
    class ImagePruneResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute images_deleted
      #   Images that were deleted
      #
      #   @return [Array<DockerEngine::Models::DeleteItem>, nil]
      optional :images_deleted,
               -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::DeleteItem] },
               api_name: :ImagesDeleted

      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!method initialize(images_deleted: nil, space_reclaimed: nil)
      #   @param images_deleted [Array<DockerEngine::Models::DeleteItem>] Images that were deleted
      #
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
    end
  end
end
