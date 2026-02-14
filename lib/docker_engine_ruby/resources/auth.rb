# frozen_string_literal: true

module DockerEngineRuby
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
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::AuthResponse]
      #
      # @see DockerEngineRuby::Models::AuthLoginParams
      def login(params = {})
        parsed, options = DockerEngineRuby::AuthLoginParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth",
          body: parsed,
          model: DockerEngineRuby::AuthResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
