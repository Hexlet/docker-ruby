# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#prune
    class VolumePruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!attribute volumes_deleted
      #   Volumes that were deleted
      #
      #   @return [Array<String>, nil]
      optional :volumes_deleted, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :VolumesDeleted

      # @!method initialize(space_reclaimed: nil, volumes_deleted: nil)
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
      #
      #   @param volumes_deleted [Array<String>] Volumes that were deleted
    end
  end
end
