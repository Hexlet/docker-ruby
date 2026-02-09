# frozen_string_literal: true

module Docker
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
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::AuthResponse]
      #
      # @see Docker::Models::AuthLoginParams
      def login(params = {})
        parsed, options = Docker::AuthLoginParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth",
          body: parsed,
          model: Docker::AuthResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Docker::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
