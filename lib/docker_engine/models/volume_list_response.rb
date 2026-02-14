# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Volumes#list
    class VolumeListResponse < DockerEngine::Internal::Type::BaseModel
      # @!attribute volumes
      #   List of volumes
      #
      #   @return [Array<DockerEngine::Models::Volume>, nil]
      optional :volumes,
               -> {
                 DockerEngine::Internal::Type::ArrayOf[DockerEngine::Volume]
               },
               api_name: :Volumes

      # @!attribute warnings
      #   Warnings that occurred when fetching the list of volumes.
      #
      #   @return [Array<String>, nil]
      optional :warnings, DockerEngine::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(volumes: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::VolumeListResponse} for more details.
      #
      #   Volume list response
      #
      #   @param volumes [Array<DockerEngine::Models::Volume>] List of volumes
      #
      #   @param warnings [Array<String>] Warnings that occurred when fetching the list of volumes.
    end
  end
end
