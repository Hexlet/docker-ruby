# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Auth#login
    class AuthLoginParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

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
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
