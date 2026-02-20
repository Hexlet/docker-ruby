# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class CreateRequest < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute cluster_volume_spec
      #   Cluster-specific options used to create the volume.
      #
      #   @return [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec, nil]
      optional :cluster_volume_spec,
               -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec },
               api_name: :ClusterVolumeSpec

      # @!attribute driver
      #   Name of the volume driver to use.
      #
      #   @return [String, nil]
      optional :driver, String, api_name: :Driver

      # @!attribute driver_opts
      #   A mapping of driver options and values. These options are passed directly to the
      #   driver and are driver specific.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :driver_opts, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :DriverOpts

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute name
      #   The new volume's name. If not specified, Docker generates a name.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!method initialize(cluster_volume_spec: nil, driver: nil, driver_opts: nil, labels: nil, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::CreateRequest} for more details.
      #
      #   Volume configuration
      #
      #   @param cluster_volume_spec [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec] Cluster-specific options used to create the volume.
      #
      #   @param driver [String] Name of the volume driver to use.
      #
      #   @param driver_opts [Hash{Symbol=>String}] A mapping of driver options and values. These options are
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param name [String] The new volume's name. If not specified, Docker generates a name.

      # @see DockerEngineRuby::Models::CreateRequest#cluster_volume_spec
      class ClusterVolumeSpec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute access_mode
        #   Defines how the volume is used by tasks.
        #
        #   @return [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode, nil]
        optional :access_mode,
                 -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode },
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
        #   {DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec} for more details.
        #
        #   Cluster-specific options used to create the volume.
        #
        #   @param access_mode [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode] Defines how the volume is used by tasks.
        #
        #   @param group [String] Group defines the volume group of this volume. Volumes belonging to

        # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec#access_mode
        class AccessMode < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute accessibility_requirements
          #
          #   @return [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements, nil]
          optional :accessibility_requirements,
                   -> {
                     DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements
                   },
                   api_name: :AccessibilityRequirements

          # @!attribute availability
          #
          #   @return [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Availability, nil]
          optional :availability,
                   enum: -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::Availability },
                   api_name: :Availability

          # @!attribute capacity_range
          #
          #   @return [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange, nil]
          optional :capacity_range,
                   -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange },
                   api_name: :CapacityRange

          # @!attribute mount_volume
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :mount_volume,
                   DockerEngineRuby::Internal::Type::HashOf[DockerEngineRuby::Internal::Type::Unknown],
                   api_name: :MountVolume

          # @!attribute scope
          #
          #   @return [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Scope, nil]
          optional :scope,
                   enum: -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::Scope },
                   api_name: :Scope

          # @!attribute secrets
          #
          #   @return [Array<DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Secret>, nil]
          optional :secrets,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::Secret]
                   },
                   api_name: :Secrets

          # @!attribute sharing
          #
          #   @return [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing, nil]
          optional :sharing,
                   enum: -> { DockerEngineRuby::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing },
                   api_name: :Sharing

          # @!method initialize(accessibility_requirements: nil, availability: nil, capacity_range: nil, mount_volume: nil, scope: nil, secrets: nil, sharing: nil)
          #   Defines how the volume is used by tasks.
          #
          #   @param accessibility_requirements [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements]
          #   @param availability [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Availability]
          #   @param capacity_range [DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange]
          #   @param mount_volume [Hash{Symbol=>Object}]
          #   @param scope [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Scope]
          #   @param secrets [Array<DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Secret>]
          #   @param sharing [Symbol, DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing]

          # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode#accessibility_requirements
          class AccessibilityRequirements < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute preferred
            #
            #   @return [Array<Hash{Symbol=>String}>, nil]
            optional :preferred,
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::HashOf[String]],
                     api_name: :Preferred

            # @!attribute requisite
            #
            #   @return [Array<Hash{Symbol=>String}>, nil]
            optional :requisite,
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::HashOf[String]],
                     api_name: :Requisite

            # @!method initialize(preferred: nil, requisite: nil)
            #   @param preferred [Array<Hash{Symbol=>String}>]
            #   @param requisite [Array<Hash{Symbol=>String}>]
          end

          # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode#availability
          module Availability
            extend DockerEngineRuby::Internal::Type::Enum

            ACTIVE = :active
            PAUSE = :pause
            DRAIN = :drain

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode#capacity_range
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

          # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode#scope
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

          # @see DockerEngineRuby::Models::CreateRequest::ClusterVolumeSpec::AccessMode#sharing
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
