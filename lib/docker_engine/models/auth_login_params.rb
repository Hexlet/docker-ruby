# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Auth#login
    class AuthLoginParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

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
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
