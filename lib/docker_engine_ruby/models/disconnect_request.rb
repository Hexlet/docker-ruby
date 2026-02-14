# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class DisconnectRequest < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute container
      #   The ID or name of the container to disconnect from the network.
      #
      #   @return [String]
      required :container, String, api_name: :Container

      # @!attribute force
      #   Force the container to disconnect from the network.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean, api_name: :Force

      # @!method initialize(container:, force: nil)
      #   NetworkDisconnectRequest represents the data to be used to disconnect a
      #   container from a network.
      #
      #   @param container [String] The ID or name of the container to disconnect from the network.
      #
      #   @param force [Boolean] Force the container to disconnect from the network.
    end
  end
end
