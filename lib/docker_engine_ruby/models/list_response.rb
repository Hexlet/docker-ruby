# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#list
    class ListResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute volumes
      #   List of volumes
      #
      #   @return [Array<DockerEngineRuby::Models::Volume>, nil]
      optional :volumes,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Volume] },
               api_name: :Volumes

      # @!attribute warnings
      #   Warnings that occurred when fetching the list of volumes.
      #
      #   @return [Array<String>, nil]
      optional :warnings, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(volumes: nil, warnings: nil)
      #   Volume list response
      #
      #   @param volumes [Array<DockerEngineRuby::Models::Volume>] List of volumes
      #
      #   @param warnings [Array<String>] Warnings that occurred when fetching the list of volumes.
    end
  end
end
