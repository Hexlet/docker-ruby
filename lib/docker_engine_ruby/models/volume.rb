# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#create
    class Volume < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute driver
      #   Name of the volume driver used by the volume.
      #
      #   @return [String]
      required :driver, String, api_name: :Driver

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Object]
      required :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

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
      #   @return [Object]
      required :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

      # @!attribute scope
      #   The level at which the volume exists. Either `global` for cluster-wide, or
      #   `local` for machine level.
      #
      #   @return [Symbol, DockerEngineRuby::Models::Volume::Scope]
      required :scope, enum: -> { DockerEngineRuby::Volume::Scope }, api_name: :Scope

      # @!attribute cluster_volume
      #   Options and information specific to, and only present on, Swarm CSI cluster
      #   volumes.
      #
      #   @return [DockerEngineRuby::Models::Volume::ClusterVolume, nil]
      optional :cluster_volume, -> { DockerEngineRuby::Volume::ClusterVolume }, api_name: :ClusterVolume

      # @!attribute created_at
      #   Date/Time the volume was created.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :CreatedAt

      # @!attribute status
      #   Low-level details about the volume, provided by the volume driver. Details are
      #   returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
      #
      #   The `Status` field is optional, and is omitted if the volume driver does not
      #   support this feature.
      #
      #   @return [Object, nil]
      optional :status, DockerEngineRuby::Internal::Type::Unknown, api_name: :Status

      # @!attribute usage_data
      #   Usage details about the volume. This information is used by the `GET /system/df`
      #   endpoint, and omitted in other endpoints.
      #
      #   @return [DockerEngineRuby::Models::Volume::UsageData, nil]
      optional :usage_data, -> { DockerEngineRuby::Volume::UsageData }, api_name: :UsageData, nil?: true

      # @!method initialize(driver:, labels:, mountpoint:, name:, options:, scope:, cluster_volume: nil, created_at: nil, status: nil, usage_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Volume} for more details.
      #
      #   @param driver [String] Name of the volume driver used by the volume.
      #
      #   @param labels [Object] User-defined key/value metadata.
      #
      #   @param mountpoint [String] Mount path of the volume on the host.
      #
      #   @param name [String] Name of the volume.
      #
      #   @param options [Object] The driver specific options used when creating the volume.
      #
      #   @param scope [Symbol, DockerEngineRuby::Models::Volume::Scope] The level at which the volume exists. Either `global` for cluster-wide,
      #
      #   @param cluster_volume [DockerEngineRuby::Models::Volume::ClusterVolume] Options and information specific to, and only present on, Swarm CSI
      #
      #   @param created_at [Time] Date/Time the volume was created.
      #
      #   @param status [Object] Low-level details about the volume, provided by the volume driver.
      #
      #   @param usage_data [DockerEngineRuby::Models::Volume::UsageData, nil] Usage details about the volume. This information is used by the

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      #
      # @see DockerEngineRuby::Models::Volume#scope
      module Scope
        extend DockerEngineRuby::Internal::Type::Enum

        LOCAL = :local
        GLOBAL = :global

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DockerEngineRuby::Models::Volume#cluster_volume
      class ClusterVolume < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :CreatedAt

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
        #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Info, nil]
        optional :info, -> { DockerEngineRuby::Volume::ClusterVolume::Info }, api_name: :Info

        # @!attribute publish_status
        #   The status of the volume as it pertains to its publishing and use on specific
        #   nodes
        #
        #   @return [Array<DockerEngineRuby::Models::Volume::ClusterVolume::PublishStatus>, nil]
        optional :publish_status,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Volume::ClusterVolume::PublishStatus]
                 },
                 api_name: :PublishStatus

        # @!attribute spec
        #   Cluster-specific options used to create the volume.
        #
        #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Spec, nil]
        optional :spec, -> { DockerEngineRuby::Volume::ClusterVolume::Spec }, api_name: :Spec

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :UpdatedAt

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
        #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Version, nil]
        optional :version, -> { DockerEngineRuby::Volume::ClusterVolume::Version }, api_name: :Version

        # @!method initialize(created_at: nil, id: nil, info: nil, publish_status: nil, spec: nil, updated_at: nil, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::Volume::ClusterVolume} for more details.
        #
        #   Options and information specific to, and only present on, Swarm CSI cluster
        #   volumes.
        #
        #   @param created_at [Time]
        #
        #   @param id [String] The Swarm ID of this volume. Because cluster volumes are Swarm
        #
        #   @param info [DockerEngineRuby::Models::Volume::ClusterVolume::Info] Information about the global status of the volume.
        #
        #   @param publish_status [Array<DockerEngineRuby::Models::Volume::ClusterVolume::PublishStatus>] The status of the volume as it pertains to its publishing and use on
        #
        #   @param spec [DockerEngineRuby::Models::Volume::ClusterVolume::Spec] Cluster-specific options used to create the volume.
        #
        #   @param updated_at [Time]
        #
        #   @param version [DockerEngineRuby::Models::Volume::ClusterVolume::Version] The version number of the object such as node, service, etc. This is needed

        # @see DockerEngineRuby::Models::Volume::ClusterVolume#info
        class Info < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute accessible_topology
          #
          #   @return [Array<Object>, nil]
          optional :accessible_topology,
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                   api_name: :AccessibleTopology

          # @!attribute capacity_bytes
          #
          #   @return [Integer, nil]
          optional :capacity_bytes, Integer, api_name: :CapacityBytes

          # @!attribute volume_context
          #
          #   @return [Object, nil]
          optional :volume_context, DockerEngineRuby::Internal::Type::Unknown, api_name: :VolumeContext

          # @!attribute volume_id
          #
          #   @return [String, nil]
          optional :volume_id, String, api_name: :VolumeID

          # @!method initialize(accessible_topology: nil, capacity_bytes: nil, volume_context: nil, volume_id: nil)
          #   Information about the global status of the volume.
          #
          #   @param accessible_topology [Array<Object>]
          #   @param capacity_bytes [Integer]
          #   @param volume_context [Object]
          #   @param volume_id [String]
        end

        class PublishStatus < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute node_id
          #
          #   @return [String, nil]
          optional :node_id, String, api_name: :NodeID

          # @!attribute publish_context
          #
          #   @return [Object, nil]
          optional :publish_context, DockerEngineRuby::Internal::Type::Unknown, api_name: :PublishContext

          # @!attribute state
          #
          #   @return [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::PublishStatus::State, nil]
          optional :state,
                   enum: -> { DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State },
                   api_name: :State

          # @!method initialize(node_id: nil, publish_context: nil, state: nil)
          #   @param node_id [String]
          #   @param publish_context [Object]
          #   @param state [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::PublishStatus::State]

          # @see DockerEngineRuby::Models::Volume::ClusterVolume::PublishStatus#state
          module State
            extend DockerEngineRuby::Internal::Type::Enum

            PENDING_PUBLISH = :"pending-publish"
            PUBLISHED = :published
            PENDING_NODE_UNPUBLISH = :"pending-node-unpublish"
            PENDING_CONTROLLER_UNPUBLISH = :"pending-controller-unpublish"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see DockerEngineRuby::Models::Volume::ClusterVolume#spec
        class Spec < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute access_mode
          #   Defines how the volume is used by tasks.
          #
          #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode, nil]
          optional :access_mode,
                   -> { DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode },
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
          #   {DockerEngineRuby::Models::Volume::ClusterVolume::Spec} for more details.
          #
          #   Cluster-specific options used to create the volume.
          #
          #   @param access_mode [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode] Defines how the volume is used by tasks.
          #
          #   @param group [String] Group defines the volume group of this volume. Volumes belonging to

          # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec#access_mode
          class AccessMode < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute accessibility_requirements
            #
            #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements, nil]
            optional :accessibility_requirements,
                     -> {
                       DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements
                     },
                     api_name: :AccessibilityRequirements

            # @!attribute availability
            #
            #   @return [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Availability, nil]
            optional :availability,
                     enum: -> { DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability },
                     api_name: :Availability

            # @!attribute capacity_range
            #
            #   @return [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::CapacityRange, nil]
            optional :capacity_range,
                     -> { DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange },
                     api_name: :CapacityRange

            # @!attribute mount_volume
            #
            #   @return [Object, nil]
            optional :mount_volume, DockerEngineRuby::Internal::Type::Unknown, api_name: :MountVolume

            # @!attribute scope
            #
            #   @return [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Scope, nil]
            optional :scope,
                     enum: -> { DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope },
                     api_name: :Scope

            # @!attribute secrets
            #
            #   @return [Array<DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Secret>, nil]
            optional :secrets,
                     -> {
                       DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret]
                     },
                     api_name: :Secrets

            # @!attribute sharing
            #
            #   @return [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Sharing, nil]
            optional :sharing,
                     enum: -> { DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing },
                     api_name: :Sharing

            # @!method initialize(accessibility_requirements: nil, availability: nil, capacity_range: nil, mount_volume: nil, scope: nil, secrets: nil, sharing: nil)
            #   Defines how the volume is used by tasks.
            #
            #   @param accessibility_requirements [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements]
            #   @param availability [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Availability]
            #   @param capacity_range [DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::CapacityRange]
            #   @param mount_volume [Object]
            #   @param scope [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Scope]
            #   @param secrets [Array<DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Secret>]
            #   @param sharing [Symbol, DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode::Sharing]

            # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode#accessibility_requirements
            class AccessibilityRequirements < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute preferred
              #
              #   @return [Array<Object>, nil]
              optional :preferred,
                       DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                       api_name: :Preferred

              # @!attribute requisite
              #
              #   @return [Array<Object>, nil]
              optional :requisite,
                       DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::Unknown],
                       api_name: :Requisite

              # @!method initialize(preferred: nil, requisite: nil)
              #   @param preferred [Array<Object>]
              #   @param requisite [Array<Object>]
            end

            # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode#availability
            module Availability
              extend DockerEngineRuby::Internal::Type::Enum

              ACTIVE = :active
              PAUSE = :pause
              DRAIN = :drain

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode#capacity_range
            class CapacityRange < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute limit_bytes
              #
              #   @return [Integer, nil]
              optional :limit_bytes, Integer, api_name: :LimitBytes

              # @!attribute required_bytes
              #
              #   @return [Integer, nil]
              optional :required_bytes, Integer, api_name: :RequiredBytes

              # @!method initialize(limit_bytes: nil, required_bytes: nil)
              #   @param limit_bytes [Integer]
              #   @param required_bytes [Integer]
            end

            # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode#scope
            module Scope
              extend DockerEngineRuby::Internal::Type::Enum

              SINGLE = :single
              MULTI = :multi

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Secret < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute key
              #
              #   @return [String, nil]
              optional :key, String, api_name: :Key

              # @!attribute secret
              #
              #   @return [String, nil]
              optional :secret, String, api_name: :Secret

              # @!method initialize(key: nil, secret: nil)
              #   @param key [String]
              #   @param secret [String]
            end

            # @see DockerEngineRuby::Models::Volume::ClusterVolume::Spec::AccessMode#sharing
            module Sharing
              extend DockerEngineRuby::Internal::Type::Enum

              NONE = :none
              READONLY = :readonly
              ONEWRITER = :onewriter
              ALL = :all

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see DockerEngineRuby::Models::Volume::ClusterVolume#version
        class Version < DockerEngineRuby::Internal::Type::BaseModel
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

      # @see DockerEngineRuby::Models::Volume#usage_data
      class UsageData < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute ref_count
        #
        #   @return [Integer]
        required :ref_count, Integer, api_name: :RefCount

        # @!attribute size
        #
        #   @return [Integer]
        required :size, Integer, api_name: :Size

        # @!method initialize(ref_count:, size:)
        #   Usage details about the volume. This information is used by the `GET /system/df`
        #   endpoint, and omitted in other endpoints.
        #
        #   @param ref_count [Integer]
        #   @param size [Integer]
      end
    end
  end
end
