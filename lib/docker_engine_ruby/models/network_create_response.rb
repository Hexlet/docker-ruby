# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#create
    class NetworkCreateResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the created network.
      #
      #   @return [String]
      required :id, String, api_name: :Id

      # @!attribute warning
      #   Warnings encountered when creating the container
      #
      #   @return [String]
      required :warning, String, api_name: :Warning

      # @!method initialize(id:, warning:)
      #   OK response to NetworkCreate operation
      #
      #   @param id [String] The ID of the created network.
      #
      #   @param warning [String] Warnings encountered when creating the container
    end
  end
end
