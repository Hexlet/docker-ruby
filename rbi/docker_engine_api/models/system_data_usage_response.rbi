# typed: strong

module DockerEngineAPI
  module Models
    class SystemDataUsageResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::Models::SystemDataUsageResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # represents system data usage for build cache resources.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage
          )
        )
      end
      attr_reader :build_cache_disk_usage

      sig do
        params(
          build_cache_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage::OrHash
        ).void
      end
      attr_writer :build_cache_disk_usage

      # represents system data usage information for container resources.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage
          )
        )
      end
      attr_reader :containers_disk_usage

      sig do
        params(
          containers_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage::OrHash
        ).void
      end
      attr_writer :containers_disk_usage

      # represents system data usage for image resources.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage
          )
        )
      end
      attr_reader :images_disk_usage

      sig do
        params(
          images_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage::OrHash
        ).void
      end
      attr_writer :images_disk_usage

      # represents system data usage for volume resources.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage
          )
        )
      end
      attr_reader :volumes_disk_usage

      sig do
        params(
          volumes_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage::OrHash
        ).void
      end
      attr_writer :volumes_disk_usage

      sig do
        params(
          build_cache_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage::OrHash,
          containers_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage::OrHash,
          images_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage::OrHash,
          volumes_disk_usage:
            DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # represents system data usage for build cache resources.
        build_cache_disk_usage: nil,
        # represents system data usage information for container resources.
        containers_disk_usage: nil,
        # represents system data usage for image resources.
        images_disk_usage: nil,
        # represents system data usage for volume resources.
        volumes_disk_usage: nil
      )
      end

      sig do
        override.returns(
          {
            build_cache_disk_usage:
              DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage,
            containers_disk_usage:
              DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage,
            images_disk_usage:
              DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage,
            volumes_disk_usage:
              DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage
          }
        )
      end
      def to_hash
      end

      class BuildCacheDiskUsage < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::SystemDataUsageResponse::BuildCacheDiskUsage,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Count of active build cache records.
        sig { returns(T.nilable(Integer)) }
        attr_reader :active_count

        sig { params(active_count: Integer).void }
        attr_writer :active_count

        # List of build cache records.
        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :items

        sig { params(items: T::Array[T.anything]).void }
        attr_writer :items

        # Disk space that can be reclaimed by removing inactive build cache records.
        sig { returns(T.nilable(Integer)) }
        attr_reader :reclaimable

        sig { params(reclaimable: Integer).void }
        attr_writer :reclaimable

        # Count of all build cache records.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_count

        sig { params(total_count: Integer).void }
        attr_writer :total_count

        # Disk space in use by build cache records.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_size

        sig { params(total_size: Integer).void }
        attr_writer :total_size

        # represents system data usage for build cache resources.
        sig do
          params(
            active_count: Integer,
            items: T::Array[T.anything],
            reclaimable: Integer,
            total_count: Integer,
            total_size: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Count of active build cache records.
          active_count: nil,
          # List of build cache records.
          items: nil,
          # Disk space that can be reclaimed by removing inactive build cache records.
          reclaimable: nil,
          # Count of all build cache records.
          total_count: nil,
          # Disk space in use by build cache records.
          total_size: nil
        )
        end

        sig do
          override.returns(
            {
              active_count: Integer,
              items: T::Array[T.anything],
              reclaimable: Integer,
              total_count: Integer,
              total_size: Integer
            }
          )
        end
        def to_hash
        end
      end

      class ContainersDiskUsage < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::SystemDataUsageResponse::ContainersDiskUsage,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Count of active containers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :active_count

        sig { params(active_count: Integer).void }
        attr_writer :active_count

        # List of container summaries.
        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :items

        sig { params(items: T::Array[T.anything]).void }
        attr_writer :items

        # Disk space that can be reclaimed by removing inactive containers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :reclaimable

        sig { params(reclaimable: Integer).void }
        attr_writer :reclaimable

        # Count of all containers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_count

        sig { params(total_count: Integer).void }
        attr_writer :total_count

        # Disk space in use by containers.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_size

        sig { params(total_size: Integer).void }
        attr_writer :total_size

        # represents system data usage information for container resources.
        sig do
          params(
            active_count: Integer,
            items: T::Array[T.anything],
            reclaimable: Integer,
            total_count: Integer,
            total_size: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Count of active containers.
          active_count: nil,
          # List of container summaries.
          items: nil,
          # Disk space that can be reclaimed by removing inactive containers.
          reclaimable: nil,
          # Count of all containers.
          total_count: nil,
          # Disk space in use by containers.
          total_size: nil
        )
        end

        sig do
          override.returns(
            {
              active_count: Integer,
              items: T::Array[T.anything],
              reclaimable: Integer,
              total_count: Integer,
              total_size: Integer
            }
          )
        end
        def to_hash
        end
      end

      class ImagesDiskUsage < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::SystemDataUsageResponse::ImagesDiskUsage,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Count of active images.
        sig { returns(T.nilable(Integer)) }
        attr_reader :active_count

        sig { params(active_count: Integer).void }
        attr_writer :active_count

        # List of image summaries.
        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :items

        sig { params(items: T::Array[T.anything]).void }
        attr_writer :items

        # Disk space that can be reclaimed by removing unused images.
        sig { returns(T.nilable(Integer)) }
        attr_reader :reclaimable

        sig { params(reclaimable: Integer).void }
        attr_writer :reclaimable

        # Count of all images.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_count

        sig { params(total_count: Integer).void }
        attr_writer :total_count

        # Disk space in use by images.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_size

        sig { params(total_size: Integer).void }
        attr_writer :total_size

        # represents system data usage for image resources.
        sig do
          params(
            active_count: Integer,
            items: T::Array[T.anything],
            reclaimable: Integer,
            total_count: Integer,
            total_size: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Count of active images.
          active_count: nil,
          # List of image summaries.
          items: nil,
          # Disk space that can be reclaimed by removing unused images.
          reclaimable: nil,
          # Count of all images.
          total_count: nil,
          # Disk space in use by images.
          total_size: nil
        )
        end

        sig do
          override.returns(
            {
              active_count: Integer,
              items: T::Array[T.anything],
              reclaimable: Integer,
              total_count: Integer,
              total_size: Integer
            }
          )
        end
        def to_hash
        end
      end

      class VolumesDiskUsage < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::SystemDataUsageResponse::VolumesDiskUsage,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Count of active volumes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :active_count

        sig { params(active_count: Integer).void }
        attr_writer :active_count

        # List of volumes.
        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :items

        sig { params(items: T::Array[T.anything]).void }
        attr_writer :items

        # Disk space that can be reclaimed by removing inactive volumes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :reclaimable

        sig { params(reclaimable: Integer).void }
        attr_writer :reclaimable

        # Count of all volumes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_count

        sig { params(total_count: Integer).void }
        attr_writer :total_count

        # Disk space in use by volumes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_size

        sig { params(total_size: Integer).void }
        attr_writer :total_size

        # represents system data usage for volume resources.
        sig do
          params(
            active_count: Integer,
            items: T::Array[T.anything],
            reclaimable: Integer,
            total_count: Integer,
            total_size: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Count of active volumes.
          active_count: nil,
          # List of volumes.
          items: nil,
          # Disk space that can be reclaimed by removing inactive volumes.
          reclaimable: nil,
          # Count of all volumes.
          total_count: nil,
          # Disk space in use by volumes.
          total_size: nil
        )
        end

        sig do
          override.returns(
            {
              active_count: Integer,
              items: T::Array[T.anything],
              reclaimable: Integer,
              total_count: Integer,
              total_size: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
