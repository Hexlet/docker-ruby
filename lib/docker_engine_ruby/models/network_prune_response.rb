# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#prune
    class NetworkPruneResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute networks_deleted
      #   Networks that were deleted
      #
      #   @return [Array<String>, nil]
      optional :networks_deleted,
               DockerEngineRuby::Internal::Type::ArrayOf[String],
               api_name: :NetworksDeleted

      # @!method initialize(networks_deleted: nil)
      #   @param networks_deleted [Array<String>] Networks that were deleted
    end
  end
end
