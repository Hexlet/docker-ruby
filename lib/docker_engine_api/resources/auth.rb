# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Auth
      # Validate credentials for a registry and, if available, get an identity token for
      # accessing the registry without password.
      #
      # @overload login(password: nil, serveraddress: nil, username: nil, request_options: {})
      #
      # @param password [String]
      # @param serveraddress [String]
      # @param username [String]
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::AuthResponse]
      #
      # @see DockerEngineAPI::Models::AuthLoginParams
      def login(params = {})
        parsed, options = DockerEngineAPI::AuthLoginParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth",
          body: parsed,
          model: DockerEngineAPI::AuthResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngineAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
