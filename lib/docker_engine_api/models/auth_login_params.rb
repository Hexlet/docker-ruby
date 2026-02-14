# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Auth#login
    class AuthLoginParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute password
      #
      #   @return [String, nil]
      optional :password, String

      # @!attribute serveraddress
      #
      #   @return [String, nil]
      optional :serveraddress, String

      # @!attribute username
      #
      #   @return [String, nil]
      optional :username, String

      # @!method initialize(password: nil, serveraddress: nil, username: nil, request_options: {})
      #   @param password [String]
      #   @param serveraddress [String]
      #   @param username [String]
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
