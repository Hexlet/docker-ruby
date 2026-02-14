# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Swarm#unlock_key
    class SwarmUnlockKeyParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
