# typed: strong

module DockerEngineRuby
  module Resources
    class Auth
      # Check auth configuration
      sig do
        params(
          password: String,
          serveraddress: String,
          username: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::AuthResponse)
      end
      def login(
        password: nil,
        serveraddress: nil,
        username: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
