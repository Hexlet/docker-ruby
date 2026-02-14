# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Images#build_prune
    class ImageBuildPruneResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute caches_deleted
      #
      #   @return [Array<String>, nil]
      optional :caches_deleted, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :CachesDeleted

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
