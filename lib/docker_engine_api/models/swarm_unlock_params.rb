# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Swarm#unlock
    class SwarmUnlockParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute unlock_key
      #   The swarm's unlock key.
      #
      #   @return [String, nil]
      optional :unlock_key, String, api_name: :UnlockKey

      # @!method initialize(unlock_key: nil, request_options: {})
      #   @param unlock_key [String] The swarm's unlock key.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
