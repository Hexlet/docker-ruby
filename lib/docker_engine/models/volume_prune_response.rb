# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Volumes#prune
    class VolumePruneResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!attribute volumes_deleted
      #   Volumes that were deleted
      #
      #   @return [Array<String>, nil]
      optional :volumes_deleted, DockerEngine::Internal::Type::ArrayOf[String], api_name: :VolumesDeleted

      # @!method initialize(space_reclaimed: nil, volumes_deleted: nil)
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
      #
      #   @param volumes_deleted [Array<String>] Volumes that were deleted
    end
  end
end
