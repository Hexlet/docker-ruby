# typed: strong

module DockerEngineAPI
  module Models
    class AuthLoginParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::AuthLoginParams,
            DockerEngineAPI::Internal::AnyHash
          )
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
