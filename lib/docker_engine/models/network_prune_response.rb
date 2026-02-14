# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Networks#prune
    class NetworkPruneResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute networks_deleted
      #   Networks that were deleted
      #
      #   @return [Array<String>, nil]
      optional :networks_deleted, DockerEngine::Internal::Type::ArrayOf[String], api_name: :NetworksDeleted

      # @!method initialize(networks_deleted: nil)
      #   @param networks_deleted [Array<String>] Networks that were deleted
    end
  end
end
