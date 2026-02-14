# frozen_string_literal: true

module DockerEngine
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
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::AuthResponse]
      #
      # @see DockerEngine::Models::AuthLoginParams
      def login(params = {})
        parsed, options = DockerEngine::AuthLoginParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth",
          body: parsed,
          model: DockerEngine::AuthResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngine::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
