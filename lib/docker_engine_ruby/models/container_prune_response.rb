# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#prune
    class ContainerPruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute containers_deleted
      #
      #   @return [Array<String>, nil]
      optional :containers_deleted,
               DockerEngineRuby::Internal::Type::ArrayOf[String],
               api_name: :ContainersDeleted

      # @!attribute space_reclaimed
      #
      #   @return [Integer, nil]
      optional :space_reclaimed, Integer, api_name: :SpaceReclaimed

      # @!method initialize(containers_deleted: nil, space_reclaimed: nil)
      #   @param containers_deleted [Array<String>]
      #   @param space_reclaimed [Integer]
    end
  end
end
