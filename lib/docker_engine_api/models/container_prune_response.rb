# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#prune
    class ContainerPruneResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute containers_deleted
      #   Container IDs that were deleted
      #
      #   @return [Array<String>, nil]
      optional :containers_deleted,
               DockerEngineAPI::Internal::Type::ArrayOf[String],
               api_name: :ContainersDeleted

      # @!attribute space_reclaimed
      #   Disk space reclaimed in bytes
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!method initialize(containers_deleted: nil, space_reclaimed: nil)
      #   @param containers_deleted [Array<String>] Container IDs that were deleted
      #
      #   @param space_reclaimed [Integer] Disk space reclaimed in bytes
    end
  end
end
