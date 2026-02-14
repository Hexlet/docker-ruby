# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Swarm#unlock_key
    class SwarmUnlockKeyResponse < DockerEngineAPI::Internal::Type::BaseModel
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
