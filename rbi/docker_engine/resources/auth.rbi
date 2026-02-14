# typed: strong

module DockerEngine
  module Resources
    class Auth
      # Validate credentials for a registry and, if available, get an identity token for
      # accessing the registry without password.
      sig do
        params(
          password: String,
          serveraddress: String,
          username: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::AuthResponse)
      end
      def login(
        password: nil,
        serveraddress: nil,
        username: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
