# typed: strong

module DockerEngineAPI
  module Models
    class AuthResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::AuthResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The status of the authentication
      sig { returns(String) }
      attr_accessor :status

      # An opaque token used to authenticate a user after a successful login
      sig { returns(T.nilable(String)) }
      attr_reader :identity_token

      sig { params(identity_token: String).void }
      attr_writer :identity_token

      # An identity token was generated successfully.
      sig do
        params(status: String, identity_token: String).returns(T.attached_class)
      end
      def self.new(
        # The status of the authentication
        status:,
        # An opaque token used to authenticate a user after a successful login
        identity_token: nil
      )
      end

      sig { override.returns({ status: String, identity_token: String }) }
      def to_hash
      end
    end
  end
end
