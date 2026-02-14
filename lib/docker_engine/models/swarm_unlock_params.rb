# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Swarm#unlock
    class SwarmUnlockParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute unlock_key
      #   The swarm's unlock key.
      #
      #   @return [String, nil]
      optional :unlock_key, String, api_name: :UnlockKey

      # @!method initialize(unlock_key: nil, request_options: {})
      #   @param unlock_key [String] The swarm's unlock key.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
