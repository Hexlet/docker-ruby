# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#unlock_key
    class SwarmUnlockKeyResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute unlock_key
      #
      #   @return [String, nil]
      optional :unlock_key, String, api_name: :UnlockKey

      # @!method initialize(unlock_key: nil)
      #   @param unlock_key [String]
    end
  end
end
