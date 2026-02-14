# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Networks#prune
    class NetworkPruneResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute networks_deleted
      #   Networks that were deleted
      #
      #   @return [Array<String>, nil]
      optional :networks_deleted, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :NetworksDeleted

      # @!method initialize(networks_deleted: nil)
      #   @param networks_deleted [Array<String>] Networks that were deleted
    end
  end
end
