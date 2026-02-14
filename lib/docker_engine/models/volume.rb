# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Volumes#create
    class Volume < DockerEngine::Internal::Type::BaseModel
      # @!attribute driver
      #   Name of the volume driver used by the volume.
      #
      #   @return [String]
      required :driver, String, api_name: :Driver

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}]
      required :labels, DockerEngine::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute mountpoint
      #   Mount path of the volume on the host.
      #
      #   @return [String]
      required :mountpoint, String, api_name: :Mountpoint

      # @!attribute name
      #   Name of the volume.
      #
      #   @return [String]
      required :name, String, api_name: :Name

      # @!attribute options
      #   The driver specific options used when creating the volume.
      #
      #   @return [Hash{Symbol=>String}]
      required :options, DockerEngine::Internal::Type::HashOf[String], api_name: :Options

      # @!attribute scope
      #   The level at which the volume exists. Either `global` for cluster-wide, or
      #   `local` for machine level.
      #
      #   @return [Symbol, DockerEngine::Models::Volume::Scope]
      required :scope, enum: -> { DockerEngine::Volume::Scope }, api_name: :Scope

      # @!attribute cluster_volume
      #   Options and information specific to, and only present on, Swarm CSI cluster
      #   volumes.
      #
      #   @return [DockerEngine::Models::Volume::ClusterVolume, nil]
      optional :cluster_volume, -> { DockerEngine::Volume::ClusterVolume }, api_name: :ClusterVolume

      # @!attribute created_at
      #   Date/Time the volume was created.
      #
      #   @return [String, nil]
      optional :created_at, String, api_name: :CreatedAt

      # @!attribute status
      #   Low-level details about the volume, provided by the volume driver. Details are
      #   returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
      #
      #   The `Status` field is optional, and is omitted if the volume driver does not
      #   support this feature.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :status,
               DockerEngine::Internal::Type::HashOf[DockerEngine::Internal::Type::Unknown],
               api_name: :Status

      # @!attribute usage_data
      #   Usage details about the volume. This information is used by the `GET /system/df`
      #   endpoint, and omitted in other endpoints.
      #
      #   @return [DockerEngine::Models::Volume::UsageData, nil]
      optional :usage_data, -> { DockerEngine::Volume::UsageData }, api_name: :UsageData, nil?: true

      # @!method initialize(driver:, labels:, mountpoint:, name:, options:, scope:, cluster_volume: nil, created_at: nil, status: nil, usage_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::Volume} for more details.
      #
      #   @param driver [String] Name of the volume driver used by the volume.
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param mountpoint [String] Mount path of the volume on the host.
      #
      #   @param name [String] Name of the volume.
      #
      #   @param options [Hash{Symbol=>String}] The driver specific options used when creating the volume.
      #
      #   @param scope [Symbol, DockerEngine::Models::Volume::Scope] The level at which the volume exists. Either `global` for cluster-wide,
      #
      #   @param cluster_volume [DockerEngine::Models::Volume::ClusterVolume] Options and information specific to, and only present on, Swarm CSI
      #
      #   @param created_at [String] Date/Time the volume was created.
      #
      #   @param status [Hash{Symbol=>Object}] Low-level details about the volume, provided by the volume driver.
      #
      #   @param usage_data [DockerEngine::Models::Volume::UsageData, nil] Usage details about the volume. This information is used by the

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      #
      # @see DockerEngine::Models::Volume#scope
      module Scope
        extend DockerEngine::Internal::Type::Enum

        LOCAL = :local
        GLOBAL = :global

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DockerEngine::Models::Volume#cluster_volume
      class ClusterVolume < DockerEngine::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :CreatedAt

        # @!attribute id
        #   The Swarm ID of this volume. Because cluster volumes are Swarm objects, they
        #   have an ID, unlike non-cluster volumes. This ID can be used to refer to the
        #   Volume instead of the name.
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!attribute info
        #   Information about the global status of the volume.
        #
        #   @return [DockerEngine::Models::Volume::ClusterVolume::Info, nil]
        optional :info, -> { DockerEngine::Volume::ClusterVolume::Info }, api_name: :Info

        # @!attribute publish_status
        #   The status of the volume as it pertains to its publishing and use on specific
        #   nodes
        #
        #   @return [Array<DockerEngine::Models::Volume::ClusterVolume::PublishStatus>, nil]
        optional :publish_status,
                 -> {
                   DockerEngine::Internal::Type::ArrayOf[DockerEngine::Volume::ClusterVolume::PublishStatus]
                 },
                 api_name: :PublishStatus

        # @!attribute spec
        #   Cluster-specific options used to create the volume.
        #
        #   @return [DockerEngine::Models::Volume::ClusterVolume::Spec, nil]
        optional :spec, -> { DockerEngine::Volume::ClusterVolume::Spec }, api_name: :Spec

        # @!attribute updated_at
        #
        #   @return [String, nil]
        optional :updated_at, String, api_name: :UpdatedAt

        # @!attribute version
        #   The version number of the object such as node, service, etc. This is needed to
        #   avoid conflicting writes. The client must send the version number along with the
        #   modified specification when updating these objects.
        #
        #   This approach ensures safe concurrency and determinism in that the change on the
        #   object may not be applied if the version number has changed from the last read.
        #   In other words, if two update requests specify the same base version, only one
        #   of the requests can succeed. As a result, two separate update requests that
        #   happen at the same time will not unintentionally overwrite each other.
        #
        #   @return [DockerEngine::Models::Volume::ClusterVolume::Version, nil]
        optional :version, -> { DockerEngine::Volume::ClusterVolume::Version }, api_name: :Version

        # @!method initialize(created_at: nil, id: nil, info: nil, publish_status: nil, spec: nil, updated_at: nil, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Volume::ClusterVolume} for more details.
        #
        #   Options and information specific to, and only present on, Swarm CSI cluster
        #   volumes.
        #
        #   @param created_at [String]
        #
        #   @param id [String] The Swarm ID of this volume. Because cluster volumes are Swarm
        #
        #   @param info [DockerEngine::Models::Volume::ClusterVolume::Info] Information about the global status of the volume.
        #
        #   @param publish_status [Array<DockerEngine::Models::Volume::ClusterVolume::PublishStatus>] The status of the volume as it pertains to its publishing and use on
        #
        #   @param spec [DockerEngine::Models::Volume::ClusterVolume::Spec] Cluster-specific options used to create the volume.
        #
        #   @param updated_at [String]
        #
        #   @param version [DockerEngine::Models::Volume::ClusterVolume::Version] The version number of the object such as node, service, etc. This is needed

        # @see DockerEngine::Models::Volume::ClusterVolume#info
        class Info < DockerEngine::Internal::Type::BaseModel
          # @!attribute accessible_topology
          #   The topology this volume is actually accessible from.
          #
          #   @return [Array<Hash{Symbol=>String}>, nil]
          optional :accessible_topology,
                   DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::HashOf[String]],
                   api_name: :AccessibleTopology

          # @!attribute capacity_bytes
          #   The capacity of the volume in bytes. A value of 0 indicates that the capacity is
          #   unknown.
          #
          #   @return [Integer, nil]
          optional :capacity_bytes, Integer, api_name: :CapacityBytes

          # @!attribute volume_context
          #   A map of strings to strings returned from the storage plugin when the volume is
          #   created.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :volume_context, DockerEngine::Internal::Type::HashOf[String], api_name: :VolumeContext

          # @!attribute volume_id
          #   The ID of the volume as returned by the CSI storage plugin. This is distinct
          #   from the volume's ID as provided by Docker. This ID is never used by the user
          #   when communicating with Docker to refer to this volume. If the ID is blank, then
          #   the Volume has not been successfully created in the plugin yet.
          #
          #   @return [String, nil]
          optional :volume_id, String, api_name: :VolumeID

          # @!method initialize(accessible_topology: nil, capacity_bytes: nil, volume_context: nil, volume_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngine::Models::Volume::ClusterVolume::Info} for more details.
          #
          #   Information about the global status of the volume.
          #
          #   @param accessible_topology [Array<Hash{Symbol=>String}>] The topology this volume is actually accessible from.
          #
          #   @param capacity_bytes [Integer] The capacity of the volume in bytes. A value of 0 indicates that
          #
          #   @param volume_context [Hash{Symbol=>String}] A map of strings to strings returned from the storage plugin when
          #
          #   @param volume_id [String] The ID of the volume as returned by the CSI storage plugin. This
        end

        class PublishStatus < DockerEngine::Internal::Type::BaseModel
          # @!attribute node_id
          #   The ID of the Swarm node the volume is published on.
          #
          #   @return [String, nil]
          optional :node_id, String, api_name: :NodeID

          # @!attribute publish_context
          #   A map of strings to strings returned by the CSI controller plugin when a volume
          #   is published.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :publish_context, DockerEngine::Internal::Type::HashOf[String], api_name: :PublishContext

          # @!attribute state
          #   The published state of the volume.
          #
          #   - `pending-publish` The volume should be published to this node, but the call to
          #     the controller plugin to do so has not yet been successfully completed.
          #   - `published` The volume is published successfully to the node.
          #   - `pending-node-unpublish` The volume should be unpublished from the node, and
          #     the manager is awaiting confirmation from the worker that it has done so.
          #   - `pending-controller-unpublish` The volume is successfully unpublished from the
          #     node, but has not yet been successfully unpublished on the controller.
          #
          #   @return [Symbol, DockerEngine::Models::Volume::ClusterVolume::PublishStatus::State, nil]
          optional :state,
                   enum: -> {
                     DockerEngine::Volume::ClusterVolume::PublishStatus::State
                   },
                   api_name: :State

          # @!method initialize(node_id: nil, publish_context: nil, state: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngine::Models::Volume::ClusterVolume::PublishStatus} for more details.
          #
          #   @param node_id [String] The ID of the Swarm node the volume is published on.
          #
          #   @param publish_context [Hash{Symbol=>String}] A map of strings to strings returned by the CSI controller
          #
          #   @param state [Symbol, DockerEngine::Models::Volume::ClusterVolume::PublishStatus::State] The published state of the volume.

          # The published state of the volume.
          #
          # - `pending-publish` The volume should be published to this node, but the call to
          #   the controller plugin to do so has not yet been successfully completed.
          # - `published` The volume is published successfully to the node.
          # - `pending-node-unpublish` The volume should be unpublished from the node, and
          #   the manager is awaiting confirmation from the worker that it has done so.
          # - `pending-controller-unpublish` The volume is successfully unpublished from the
          #   node, but has not yet been successfully unpublished on the controller.
          #
          # @see DockerEngine::Models::Volume::ClusterVolume::PublishStatus#state
          module State
            extend DockerEngine::Internal::Type::Enum

            PENDING_PUBLISH = :"pending-publish"
            PUBLISHED = :published
            PENDING_NODE_UNPUBLISH = :"pending-node-unpublish"
            PENDING_CONTROLLER_UNPUBLISH = :"pending-controller-unpublish"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see DockerEngine::Models::Volume::ClusterVolume#spec
        class Spec < DockerEngine::Internal::Type::BaseModel
          # @!attribute access_mode
          #   Defines how the volume is used by tasks.
          #
          #   @return [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode, nil]
          optional :access_mode,
                   -> {
                     DockerEngine::Volume::ClusterVolume::Spec::AccessMode
                   },
                   api_name: :AccessMode

          # @!attribute group
          #   Group defines the volume group of this volume. Volumes belonging to the same
          #   group can be referred to by group name when creating Services. Referring to a
          #   volume by group instructs Swarm to treat volumes in that group interchangeably
          #   for the purpose of scheduling. Volumes with an empty string for a group
          #   technically all belong to the same, emptystring group.
          #
          #   @return [String, nil]
          optional :group, String, api_name: :Group

          # @!method initialize(access_mode: nil, group: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngine::Models::Volume::ClusterVolume::Spec} for more details.
          #
          #   Cluster-specific options used to create the volume.
          #
          #   @param access_mode [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode] Defines how the volume is used by tasks.
          #
          #   @param group [String] Group defines the volume group of this volume. Volumes belonging to

          # @see DockerEngine::Models::Volume::ClusterVolume::Spec#access_mode
          class AccessMode < DockerEngine::Internal::Type::BaseModel
            # @!attribute accessibility_requirements
            #   Requirements for the accessible topology of the volume. These fields are
            #   optional. For an in-depth description of what these fields mean, see the CSI
            #   specification.
            #
            #   @return [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements, nil]
            optional :accessibility_requirements,
                     -> { DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements },
                     api_name: :AccessibilityRequirements

            # @!attribute availability
            #   The availability of the volume for use in tasks.
            #
            #   - `active` The volume is fully available for scheduling on the cluster
            #   - `pause` No new workloads should use the volume, but existing workloads are not
            #     stopped.
            #   - `drain` All workloads using this volume should be stopped and rescheduled, and
            #     no new ones should be started.
            #
            #   @return [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Availability, nil]
            optional :availability,
                     enum: -> { DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability },
                     api_name: :Availability

            # @!attribute capacity_range
            #   The desired capacity that the volume should be created with. If empty, the
            #   plugin will decide the capacity.
            #
            #   @return [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::CapacityRange, nil]
            optional :capacity_range,
                     -> { DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange },
                     api_name: :CapacityRange

            # @!attribute mount_volume
            #   Options for using this volume as a Mount-type volume.
            #
            #       Either MountVolume or BlockVolume, but not both, must be
            #       present.
            #
            #   properties: FsType: type: "string" description: | Specifies the filesystem type
            #   for the mount volume. Optional. MountFlags: type: "array" description: | Flags
            #   to pass when mounting the volume. Optional. items: type: "string" BlockVolume:
            #   type: "object" description: | Options for using this volume as a Block-type
            #   volume. Intentionally empty.
            #
            #   @return [Object, nil]
            optional :mount_volume, DockerEngine::Internal::Type::Unknown, api_name: :MountVolume

            # @!attribute scope
            #   The set of nodes this volume can be used on at one time.
            #
            #   - `single` The volume may only be scheduled to one node at a time.
            #   - `multi` the volume may be scheduled to any supported number of nodes at a
            #     time.
            #
            #   @return [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Scope, nil]
            optional :scope,
                     enum: -> { DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope },
                     api_name: :Scope

            # @!attribute secrets
            #   Swarm Secrets that are passed to the CSI storage plugin when operating on this
            #   volume.
            #
            #   @return [Array<DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Secret>, nil]
            optional :secrets,
                     -> {
                       DockerEngine::Internal::Type::ArrayOf[DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret]
                     },
                     api_name: :Secrets

            # @!attribute sharing
            #   The number and way that different tasks can use this volume at one time.
            #
            #   - `none` The volume may only be used by one task at a time.
            #   - `readonly` The volume may be used by any number of tasks, but they all must
            #     mount the volume as readonly
            #   - `onewriter` The volume may be used by any number of tasks, but only one may
            #     mount it as read/write.
            #   - `all` The volume may have any number of readers and writers.
            #
            #   @return [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Sharing, nil]
            optional :sharing,
                     enum: -> { DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing },
                     api_name: :Sharing

            # @!method initialize(accessibility_requirements: nil, availability: nil, capacity_range: nil, mount_volume: nil, scope: nil, secrets: nil, sharing: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode} for more
            #   details.
            #
            #   Defines how the volume is used by tasks.
            #
            #   @param accessibility_requirements [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements] Requirements for the accessible topology of the volume. These
            #
            #   @param availability [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Availability] The availability of the volume for use in tasks.
            #
            #   @param capacity_range [DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::CapacityRange] The desired capacity that the volume should be created with. If
            #
            #   @param mount_volume [Object] Options for using this volume as a Mount-type volume.
            #
            #   @param scope [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Scope] The set of nodes this volume can be used on at one time.
            #
            #   @param secrets [Array<DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Secret>] Swarm Secrets that are passed to the CSI storage plugin when
            #
            #   @param sharing [Symbol, DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Sharing] The number and way that different tasks can use this volume

            # @see DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode#accessibility_requirements
            class AccessibilityRequirements < DockerEngine::Internal::Type::BaseModel
              # @!attribute preferred
              #   A list of topologies that the volume should attempt to be provisioned in.
              #
              #   @return [Array<Hash{Symbol=>String}>, nil]
              optional :preferred,
                       DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::HashOf[String]],
                       api_name: :Preferred

              # @!attribute requisite
              #   A list of required topologies, at least one of which the volume must be
              #   accessible from.
              #
              #   @return [Array<Hash{Symbol=>String}>, nil]
              optional :requisite,
                       DockerEngine::Internal::Type::ArrayOf[DockerEngine::Internal::Type::HashOf[String]],
                       api_name: :Requisite

              # @!method initialize(preferred: nil, requisite: nil)
              #   Some parameter documentations has been truncated, see
              #   {DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements}
              #   for more details.
              #
              #   Requirements for the accessible topology of the volume. These fields are
              #   optional. For an in-depth description of what these fields mean, see the CSI
              #   specification.
              #
              #   @param preferred [Array<Hash{Symbol=>String}>] A list of topologies that the volume should attempt to be
              #
              #   @param requisite [Array<Hash{Symbol=>String}>] A list of required topologies, at least one of which the
            end

            # The availability of the volume for use in tasks.
            #
            # - `active` The volume is fully available for scheduling on the cluster
            # - `pause` No new workloads should use the volume, but existing workloads are not
            #   stopped.
            # - `drain` All workloads using this volume should be stopped and rescheduled, and
            #   no new ones should be started.
            #
            # @see DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode#availability
            module Availability
              extend DockerEngine::Internal::Type::Enum

              ACTIVE = :active
              PAUSE = :pause
              DRAIN = :drain

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode#capacity_range
            class CapacityRange < DockerEngine::Internal::Type::BaseModel
              # @!attribute limit_bytes
              #   The volume must not be bigger than this. The value of 0 indicates an unspecified
              #   maximum.
              #
              #   @return [Integer, nil]
              optional :limit_bytes, Integer, api_name: :LimitBytes

              # @!attribute required_bytes
              #   The volume must be at least this big. The value of 0 indicates an unspecified
              #   minimum
              #
              #   @return [Integer, nil]
              optional :required_bytes, Integer, api_name: :RequiredBytes

              # @!method initialize(limit_bytes: nil, required_bytes: nil)
              #   Some parameter documentations has been truncated, see
              #   {DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::CapacityRange}
              #   for more details.
              #
              #   The desired capacity that the volume should be created with. If empty, the
              #   plugin will decide the capacity.
              #
              #   @param limit_bytes [Integer] The volume must not be bigger than this. The value of 0
              #
              #   @param required_bytes [Integer] The volume must be at least this big. The value of 0
            end

            # The set of nodes this volume can be used on at one time.
            #
            # - `single` The volume may only be scheduled to one node at a time.
            # - `multi` the volume may be scheduled to any supported number of nodes at a
            #   time.
            #
            # @see DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode#scope
            module Scope
              extend DockerEngine::Internal::Type::Enum

              SINGLE = :single
              MULTI = :multi

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Secret < DockerEngine::Internal::Type::BaseModel
              # @!attribute key
              #   Key is the name of the key of the key-value pair passed to the plugin.
              #
              #   @return [String, nil]
              optional :key, String, api_name: :Key

              # @!attribute secret
              #   Secret is the swarm Secret object from which to read data. This can be a Secret
              #   name or ID. The Secret data is retrieved by swarm and used as the value of the
              #   key-value pair passed to the plugin.
              #
              #   @return [String, nil]
              optional :secret, String, api_name: :Secret

              # @!method initialize(key: nil, secret: nil)
              #   Some parameter documentations has been truncated, see
              #   {DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode::Secret} for more
              #   details.
              #
              #   One cluster volume secret entry. Defines a key-value pair that is passed to the
              #   plugin.
              #
              #   @param key [String] Key is the name of the key of the key-value pair passed to
              #
              #   @param secret [String] Secret is the swarm Secret object from which to read data.
            end

            # The number and way that different tasks can use this volume at one time.
            #
            # - `none` The volume may only be used by one task at a time.
            # - `readonly` The volume may be used by any number of tasks, but they all must
            #   mount the volume as readonly
            # - `onewriter` The volume may be used by any number of tasks, but only one may
            #   mount it as read/write.
            # - `all` The volume may have any number of readers and writers.
            #
            # @see DockerEngine::Models::Volume::ClusterVolume::Spec::AccessMode#sharing
            module Sharing
              extend DockerEngine::Internal::Type::Enum

              NONE = :none
              READONLY = :readonly
              ONEWRITER = :onewriter
              ALL = :all

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see DockerEngine::Models::Volume::ClusterVolume#version
        class Version < DockerEngine::Internal::Type::BaseModel
          # @!attribute index
          #
          #   @return [Integer, nil]
          optional :index, Integer, api_name: :Index

          # @!method initialize(index: nil)
          #   The version number of the object such as node, service, etc. This is needed to
          #   avoid conflicting writes. The client must send the version number along with the
          #   modified specification when updating these objects.
          #
          #   This approach ensures safe concurrency and determinism in that the change on the
          #   object may not be applied if the version number has changed from the last read.
          #   In other words, if two update requests specify the same base version, only one
          #   of the requests can succeed. As a result, two separate update requests that
          #   happen at the same time will not unintentionally overwrite each other.
          #
          #   @param index [Integer]
        end
      end

      # @see DockerEngine::Models::Volume#usage_data
      class UsageData < DockerEngine::Internal::Type::BaseModel
        # @!attribute ref_count
        #   The number of containers referencing this volume. This field is set to `-1` if
        #   the reference-count is not available.
        #
        #   @return [Integer]
        required :ref_count, Integer, api_name: :RefCount

        # @!attribute size
        #   Amount of disk space used by the volume (in bytes). This information is only
        #   available for volumes created with the `"local"` volume driver. For volumes
        #   created with other volume drivers, this field is set to `-1` ("not available")
        #
        #   @return [Integer]
        required :size, Integer, api_name: :Size

        # @!method initialize(ref_count:, size:)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngine::Models::Volume::UsageData} for more details.
        #
        #   Usage details about the volume. This information is used by the `GET /system/df`
        #   endpoint, and omitted in other endpoints.
        #
        #   @param ref_count [Integer] The number of containers referencing this volume. This field
        #
        #   @param size [Integer] Amount of disk space used by the volume (in bytes). This information
      end
    end
  end
end
