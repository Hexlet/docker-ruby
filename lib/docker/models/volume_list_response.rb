# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Volumes#list
    class VolumeListResponse < Docker::Internal::Type::BaseModel
      # @!attribute volumes
      #   List of volumes
      #
      #   @return [Array<Docker::Models::Volume>, nil]
      optional :volumes, -> { Docker::Internal::Type::ArrayOf[Docker::Volume] }, api_name: :Volumes

      # @!attribute warnings
      #   Warnings that occurred when fetching the list of volumes.
      #
      #   @return [Array<String>, nil]
      optional :warnings, Docker::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(volumes: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::VolumeListResponse} for more details.
      #
      #   Volume list response
      #
      #   @param volumes [Array<Docker::Models::Volume>] List of volumes
      #
      #   @param warnings [Array<String>] Warnings that occurred when fetching the list of volumes.
    end
  end
end
