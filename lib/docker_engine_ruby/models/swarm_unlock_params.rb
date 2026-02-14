# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#unlock
    class SwarmUnlockParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute unlock_key
      #
      #   @return [String, nil]
      optional :unlock_key, String, api_name: :UnlockKey

      # @!method initialize(unlock_key: nil, request_options: {})
      #   @param unlock_key [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
