# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#enable
    class PluginEnableParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute timeout
      #   Set the HTTP client timeout (in seconds)
      #
      #   @return [Integer, nil]
      optional :timeout, Integer

      # @!method initialize(timeout: nil, request_options: {})
      #   @param timeout [Integer] Set the HTTP client timeout (in seconds)
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
