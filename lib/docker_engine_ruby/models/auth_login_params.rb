# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Auth#login
    class AuthLoginParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
