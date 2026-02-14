# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Volumes#prune
    class VolumePruneResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!attribute volumes_deleted
      #   Volumes that were deleted
      #
      #   @return [Array<String>, nil]
      optional :volumes_deleted, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :VolumesDeleted

      # @!method initialize(space_reclaimed: nil, volumes_deleted: nil)
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
      #
      #   @param volumes_deleted [Array<String>] Volumes that were deleted
    end
  end
end
