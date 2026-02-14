# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#create
    class CreateResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the created container
      #
      #   @return [String]
      required :id, String, api_name: :Id

      # @!attribute warnings
      #   Warnings encountered when creating the container
      #
      #   @return [Array<String>]
      required :warnings, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(id:, warnings:)
      #   OK response to ContainerCreate operation
      #
      #   @param id [String] The ID of the created container
      #
      #   @param warnings [Array<String>] Warnings encountered when creating the container
    end
  end
end
