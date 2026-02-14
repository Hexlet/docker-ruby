# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#update
    class VolumeUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the volume being updated. This is required to avoid
      #   conflicting writes. Found in the volume's `ClusterVolume` field.
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute spec
      #   Cluster-specific options used to create the volume.
      #
      #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec, nil]
      optional :spec, -> { DockerEngineRuby::VolumeUpdateParams::Spec }, api_name: :Spec

      # @!method initialize(version:, spec: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::VolumeUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the volume being updated. This is required to
      #
      #   @param spec [DockerEngineRuby::Models::VolumeUpdateParams::Spec] Cluster-specific options used to create the volume.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute access_mode
        #   Defines how the volume is used by tasks.
        #
        #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode, nil]
        optional :access_mode,
                 -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode },
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
        #   {DockerEngineRuby::Models::VolumeUpdateParams::Spec} for more details.
        #
        #   Cluster-specific options used to create the volume.
        #
        #   @param access_mode [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode] Defines how the volume is used by tasks.
        #
        #   @param group [String] Group defines the volume group of this volume. Volumes belonging to

        # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec#access_mode
        class AccessMode < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute accessibility_requirements
          #   Requirements for the accessible topology of the volume. These fields are
          #   optional. For an in-depth description of what these fields mean, see the CSI
          #   specification.
          #
          #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements, nil]
          optional :accessibility_requirements,
                   -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements },
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
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Availability, nil]
          optional :availability,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability },
                   api_name: :Availability

          # @!attribute capacity_range
          #   The desired capacity that the volume should be created with. If empty, the
          #   plugin will decide the capacity.
          #
          #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::CapacityRange, nil]
          optional :capacity_range,
                   -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange },
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
          optional :mount_volume, DockerEngineRuby::Internal::Type::Unknown, api_name: :MountVolume

          # @!attribute scope
          #   The set of nodes this volume can be used on at one time.
          #
          #   - `single` The volume may only be scheduled to one node at a time.
          #   - `multi` the volume may be scheduled to any supported number of nodes at a
          #     time.
          #
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Scope, nil]
          optional :scope,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope },
                   api_name: :Scope

          # @!attribute secrets
          #   Swarm Secrets that are passed to the CSI storage plugin when operating on this
          #   volume.
          #
          #   @return [Array<DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Secret>, nil]
          optional :secrets,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret]
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
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Sharing, nil]
          optional :sharing,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing },
                   api_name: :Sharing

          # @!method initialize(accessibility_requirements: nil, availability: nil, capacity_range: nil, mount_volume: nil, scope: nil, secrets: nil, sharing: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode} for more
          #   details.
          #
          #   Defines how the volume is used by tasks.
          #
          #   @param accessibility_requirements [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements] Requirements for the accessible topology of the volume. These
          #
          #   @param availability [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Availability] The availability of the volume for use in tasks.
          #
          #   @param capacity_range [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::CapacityRange] The desired capacity that the volume should be created with. If
          #
          #   @param mount_volume [Object] Options for using this volume as a Mount-type volume.
          #
          #   @param scope [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Scope] The set of nodes this volume can be used on at one time.
          #
          #   @param secrets [Array<DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Secret>] Swarm Secrets that are passed to the CSI storage plugin when
          #
          #   @param sharing [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Sharing] The number and way that different tasks can use this volume

          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#accessibility_requirements
          class AccessibilityRequirements < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute preferred
            #   A list of topologies that the volume should attempt to be provisioned in.
            #
            #   @return [Array<Hash{Symbol=>String}>, nil]
            optional :preferred,
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::HashOf[String]],
                     api_name: :Preferred

            # @!attribute requisite
            #   A list of required topologies, at least one of which the volume must be
            #   accessible from.
            #
            #   @return [Array<Hash{Symbol=>String}>, nil]
            optional :requisite,
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::HashOf[String]],
                     api_name: :Requisite

            # @!method initialize(preferred: nil, requisite: nil)
            #   Some parameter documentations has been truncated, see
            #   {DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements}
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
          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#availability
          module Availability
            extend DockerEngineRuby::Internal::Type::Enum

            ACTIVE = :active
            PAUSE = :pause
            DRAIN = :drain

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#capacity_range
          class CapacityRange < DockerEngineRuby::Internal::Type::BaseModel
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
            #   {DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::CapacityRange}
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
          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#scope
          module Scope
            extend DockerEngineRuby::Internal::Type::Enum

            SINGLE = :single
            MULTI = :multi

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Secret < DockerEngineRuby::Internal::Type::BaseModel
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
            #   {DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Secret} for
            #   more details.
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
          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#sharing
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
    end
  end
end
