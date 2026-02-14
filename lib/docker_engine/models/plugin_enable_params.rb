# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#enable
    class PluginEnableParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute timeout
      #   Set the HTTP client timeout (in seconds)
      #
      #   @return [Integer, nil]
      optional :timeout, Integer

      # @!method initialize(timeout: nil, request_options: {})
      #   @param timeout [Integer] Set the HTTP client timeout (in seconds)
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
