# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Volumes#update
    class VolumeUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute version
      #
      #   @return [Integer]
      required :version, Integer

      # @!attribute spec
      #   Cluster-specific options used to create the volume.
      #
      #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec, nil]
      optional :spec, -> { DockerEngineRuby::VolumeUpdateParams::Spec }, api_name: :Spec

      # @!method initialize(version:, spec: nil, request_options: {})
      #   @param version [Integer]
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
          #
          #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements, nil]
          optional :accessibility_requirements,
                   -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements },
                   api_name: :AccessibilityRequirements

          # @!attribute availability
          #
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Availability, nil]
          optional :availability,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability },
                   api_name: :Availability

          # @!attribute capacity_range
          #
          #   @return [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::CapacityRange, nil]
          optional :capacity_range,
                   -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange },
                   api_name: :CapacityRange

          # @!attribute mount_volume
          #
          #   @return [Object, nil]
          optional :mount_volume, DockerEngineRuby::Internal::Type::Unknown, api_name: :MountVolume

          # @!attribute scope
          #
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Scope, nil]
          optional :scope,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope },
                   api_name: :Scope

          # @!attribute secrets
          #
          #   @return [Array<DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Secret>, nil]
          optional :secrets,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret]
                   },
                   api_name: :Secrets

          # @!attribute sharing
          #
          #   @return [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Sharing, nil]
          optional :sharing,
                   enum: -> { DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing },
                   api_name: :Sharing

          # @!method initialize(accessibility_requirements: nil, availability: nil, capacity_range: nil, mount_volume: nil, scope: nil, secrets: nil, sharing: nil)
          #   Defines how the volume is used by tasks.
          #
          #   @param accessibility_requirements [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements]
          #   @param availability [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Availability]
          #   @param capacity_range [DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::CapacityRange]
          #   @param mount_volume [Object]
          #   @param scope [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Scope]
          #   @param secrets [Array<DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Secret>]
          #   @param sharing [Symbol, DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode::Sharing]

          # @see DockerEngineRuby::Models::VolumeUpdateParams::Spec::AccessMode#accessibility_requirements
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
