# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#build_prune
    class ImageBuildPruneResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute caches_deleted
      #
      #   @return [Array<String>, nil]
      optional :caches_deleted, DockerEngine::Internal::Type::ArrayOf[String], api_name: :CachesDeleted

      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!method initialize(caches_deleted: nil, space_reclaimed: nil)
      #   @param caches_deleted [Array<String>]
      #
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
    end
  end
end
