# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Networks#connect
    class NetworkConnectParams < DockerEngine::Models::ConnectRequest
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
