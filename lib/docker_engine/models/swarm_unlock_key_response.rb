# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Swarm#unlock_key
    class SwarmUnlockKeyResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute unlock_key
      #   The swarm's unlock key.
      #
      #   @return [String, nil]
      optional :unlock_key, String, api_name: :UnlockKey

      # @!method initialize(unlock_key: nil)
      #   @param unlock_key [String] The swarm's unlock key.
    end
  end
end
