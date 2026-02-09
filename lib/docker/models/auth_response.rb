# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Auth#login
    class AuthResponse < Docker::Internal::Type::BaseModel
      # @!attribute status
      #   The status of the authentication
      #
      #   @return [String]
      required :status, String, api_name: :Status

      # @!attribute identity_token
      #   An opaque token used to authenticate a user after a successful login
      #
      #   @return [String, nil]
      optional :identity_token, String, api_name: :IdentityToken

      # @!method initialize(status:, identity_token: nil)
      #   An identity token was generated successfully.
      #
      #   @param status [String] The status of the authentication
      #
      #   @param identity_token [String] An opaque token used to authenticate a user after a successful login
    end
  end
end
