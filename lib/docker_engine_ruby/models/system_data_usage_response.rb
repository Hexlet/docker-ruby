# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#data_usage
    class SystemDataUsageResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute build_cache_disk_usage
      #   represents system data usage for build cache resources.
      #
      #   @return [DockerEngineRuby::Models::SystemDataUsageResponse::BuildCacheDiskUsage, nil]
      optional :build_cache_disk_usage,
               -> { DockerEngineRuby::Models::SystemDataUsageResponse::BuildCacheDiskUsage },
               api_name: :BuildCacheDiskUsage

      # @!attribute containers_disk_usage
      #   represents system data usage information for container resources.
      #
      #   @return [DockerEngineRuby::Models::SystemDataUsageResponse::ContainersDiskUsage, nil]
      optional :containers_disk_usage,
               -> { DockerEngineRuby::Models::SystemDataUsageResponse::ContainersDiskUsage },
               api_name: :ContainersDiskUsage

      # @!attribute images_disk_usage
      #   represents system data usage for image resources.
      #
      #   @return [DockerEngineRuby::Models::SystemDataUsageResponse::ImagesDiskUsage, nil]
      optional :images_disk_usage,
               -> { DockerEngineRuby::Models::SystemDataUsageResponse::ImagesDiskUsage },
               api_name: :ImagesDiskUsage

      # @!attribute volumes_disk_usage
      #   represents system data usage for volume resources.
      #
      #   @return [DockerEngineRuby::Models::SystemDataUsageResponse::VolumesDiskUsage, nil]
      optional :volumes_disk_usage,
               -> { DockerEngineRuby::Models::SystemDataUsageResponse::VolumesDiskUsage },
               api_name: :VolumesDiskUsage

      # @!method initialize(build_cache_disk_usage: nil, containers_disk_usage: nil, images_disk_usage: nil, volumes_disk_usage: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SystemDataUsageResponse} for more details.
      #
      #   @param build_cache_disk_usage [DockerEngineRuby::Models::SystemDataUsageResponse::BuildCacheDiskUsage] represents system data usage for build cache resources.
      #
      #   @param containers_disk_usage [DockerEngineRuby::Models::SystemDataUsageResponse::ContainersDiskUsage] represents system data usage information for container resources.
      #
      #   @param images_disk_usage [DockerEngineRuby::Models::SystemDataUsageResponse::ImagesDiskUsage] represents system data usage for image resources.
      #
      #   @param volumes_disk_usage [DockerEngineRuby::Models::SystemDataUsageResponse::VolumesDiskUsage] represents system data usage for volume resources.

      # @see DockerEngineRuby::Models::SystemDataUsageResponse#build_cache_disk_usage
      class BuildCacheDiskUsage < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute active_count
        #   Count of active build cache records.
        #
        #   @return [Integer, nil]
        optional :active_count, Integer, api_name: :ActiveCount

        # @!attribute items
        #   List of build cache records.
        #
        #   @return [Array<Object>, nil]
        optional :items,
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :Items

        # @!attribute reclaimable
        #   Disk space that can be reclaimed by removing inactive build cache records.
        #
        #   @return [Integer, nil]
        optional :reclaimable, Integer, api_name: :Reclaimable

        # @!attribute total_count
        #   Count of all build cache records.
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :TotalCount

        # @!attribute total_size
        #   Disk space in use by build cache records.
        #
        #   @return [Integer, nil]
        optional :total_size, Integer, api_name: :TotalSize

        # @!method initialize(active_count: nil, items: nil, reclaimable: nil, total_count: nil, total_size: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::SystemDataUsageResponse::BuildCacheDiskUsage} for
        #   more details.
        #
        #   represents system data usage for build cache resources.
        #
        #   @param active_count [Integer] Count of active build cache records.
        #
        #   @param items [Array<Object>] List of build cache records.
        #
        #   @param reclaimable [Integer] Disk space that can be reclaimed by removing inactive build cache records.
        #
        #   @param total_count [Integer] Count of all build cache records.
        #
        #   @param total_size [Integer] Disk space in use by build cache records.
      end

      # @see DockerEngineRuby::Models::SystemDataUsageResponse#containers_disk_usage
      class ContainersDiskUsage < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute active_count
        #   Count of active containers.
        #
        #   @return [Integer, nil]
        optional :active_count, Integer, api_name: :ActiveCount

        # @!attribute items
        #   List of container summaries.
        #
        #   @return [Array<Object>, nil]
        optional :items,
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :Items

        # @!attribute reclaimable
        #   Disk space that can be reclaimed by removing inactive containers.
        #
        #   @return [Integer, nil]
        optional :reclaimable, Integer, api_name: :Reclaimable

        # @!attribute total_count
        #   Count of all containers.
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :TotalCount

        # @!attribute total_size
        #   Disk space in use by containers.
        #
        #   @return [Integer, nil]
        optional :total_size, Integer, api_name: :TotalSize

        # @!method initialize(active_count: nil, items: nil, reclaimable: nil, total_count: nil, total_size: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::SystemDataUsageResponse::ContainersDiskUsage} for
        #   more details.
        #
        #   represents system data usage information for container resources.
        #
        #   @param active_count [Integer] Count of active containers.
        #
        #   @param items [Array<Object>] List of container summaries.
        #
        #   @param reclaimable [Integer] Disk space that can be reclaimed by removing inactive containers.
        #
        #   @param total_count [Integer] Count of all containers.
        #
        #   @param total_size [Integer] Disk space in use by containers.
      end

      # @see DockerEngineRuby::Models::SystemDataUsageResponse#images_disk_usage
      class ImagesDiskUsage < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute active_count
        #   Count of active images.
        #
        #   @return [Integer, nil]
        optional :active_count, Integer, api_name: :ActiveCount

        # @!attribute items
        #   List of image summaries.
        #
        #   @return [Array<Object>, nil]
        optional :items,
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :Items

        # @!attribute reclaimable
        #   Disk space that can be reclaimed by removing unused images.
        #
        #   @return [Integer, nil]
        optional :reclaimable, Integer, api_name: :Reclaimable

        # @!attribute total_count
        #   Count of all images.
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :TotalCount

        # @!attribute total_size
        #   Disk space in use by images.
        #
        #   @return [Integer, nil]
        optional :total_size, Integer, api_name: :TotalSize

        # @!method initialize(active_count: nil, items: nil, reclaimable: nil, total_count: nil, total_size: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::SystemDataUsageResponse::ImagesDiskUsage} for more
        #   details.
        #
        #   represents system data usage for image resources.
        #
        #   @param active_count [Integer] Count of active images.
        #
        #   @param items [Array<Object>] List of image summaries.
        #
        #   @param reclaimable [Integer] Disk space that can be reclaimed by removing unused images.
        #
        #   @param total_count [Integer] Count of all images.
        #
        #   @param total_size [Integer] Disk space in use by images.
      end

      # @see DockerEngineRuby::Models::SystemDataUsageResponse#volumes_disk_usage
      class VolumesDiskUsage < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute active_count
        #   Count of active volumes.
        #
        #   @return [Integer, nil]
        optional :active_count, Integer, api_name: :ActiveCount

        # @!attribute items
        #   List of volumes.
        #
        #   @return [Array<Object>, nil]
        optional :items,
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                 api_name: :Items

        # @!attribute reclaimable
        #   Disk space that can be reclaimed by removing inactive volumes.
        #
        #   @return [Integer, nil]
        optional :reclaimable, Integer, api_name: :Reclaimable

        # @!attribute total_count
        #   Count of all volumes.
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :TotalCount

        # @!attribute total_size
        #   Disk space in use by volumes.
        #
        #   @return [Integer, nil]
        optional :total_size, Integer, api_name: :TotalSize

        # @!method initialize(active_count: nil, items: nil, reclaimable: nil, total_count: nil, total_size: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::SystemDataUsageResponse::VolumesDiskUsage} for more
        #   details.
        #
        #   represents system data usage for volume resources.
        #
        #   @param active_count [Integer] Count of active volumes.
        #
        #   @param items [Array<Object>] List of volumes.
        #
        #   @param reclaimable [Integer] Disk space that can be reclaimed by removing inactive volumes.
        #
        #   @param total_count [Integer] Count of all volumes.
        #
        #   @param total_size [Integer] Disk space in use by volumes.
      end
    end
  end
end
