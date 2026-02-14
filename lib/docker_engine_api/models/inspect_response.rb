# frozen_string_literal: true

module DockerEngineAPI
  module Models
    class InspectResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute arguments
      #
      #   @return [Array<String>, nil]
      optional :arguments, DockerEngineAPI::Internal::Type::ArrayOf[String]

      # @!attribute entrypoint
      #
      #   @return [String, nil]
      optional :entrypoint, String

      # @!attribute privileged
      #
      #   @return [Boolean, nil]
      optional :privileged, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute tty
      #
      #   @return [Boolean, nil]
      optional :tty, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute user
      #
      #   @return [String, nil]
      optional :user, String

      # @!method initialize(arguments: nil, entrypoint: nil, privileged: nil, tty: nil, user: nil)
      #   @param arguments [Array<String>]
      #   @param entrypoint [String]
      #   @param privileged [Boolean]
      #   @param tty [Boolean]
      #   @param user [String]
    end
  end
end
