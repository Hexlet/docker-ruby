# typed: strong

module DockerEngine
  module Models
    class AuthLoginParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::AuthLoginParams, DockerEngine::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :password

      sig { params(password: String).void }
      attr_writer :password

      sig { returns(T.nilable(String)) }
      attr_reader :serveraddress

      sig { params(serveraddress: String).void }
      attr_writer :serveraddress

      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      sig do
        params(
          password: String,
          serveraddress: String,
          username: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        password: nil,
        serveraddress: nil,
        username: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            password: String,
            serveraddress: String,
            username: String,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
