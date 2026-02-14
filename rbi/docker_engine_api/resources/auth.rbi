# typed: strong

module DockerEngineAPI
  module Resources
    class Auth
      # Validate credentials for a registry and, if available, get an identity token for
      # accessing the registry without password.
      sig do
        params(
          password: String,
          serveraddress: String,
          username: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::AuthResponse)
      end
      def login(
        password: nil,
        serveraddress: nil,
        username: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
