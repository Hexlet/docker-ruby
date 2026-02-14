# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Volumes#list
    class ListResponse < DockerEngineAPI::Internal::Type::BaseModel
      # @!attribute volumes
      #   List of volumes
      #
      #   @return [Array<DockerEngineAPI::Models::Volume>, nil]
      optional :volumes,
               -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Volume] },
               api_name: :Volumes

      # @!attribute warnings
      #   Warnings that occurred when fetching the list of volumes.
      #
      #   @return [Array<String>, nil]
      optional :warnings, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(volumes: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ListResponse} for more details.
      #
      #   Volume list response
      #
      #   @param volumes [Array<DockerEngineAPI::Models::Volume>] List of volumes
      #
      #   @param warnings [Array<String>] Warnings that occurred when fetching the list of volumes.
    end
  end
end
