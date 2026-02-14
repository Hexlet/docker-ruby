# typed: strong

module DockerEngine
  module Models
    class CreateRequest < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::CreateRequest, DockerEngine::Internal::AnyHash)
        end

      # Cluster-specific options used to create the volume.
      sig { returns(T.nilable(DockerEngine::CreateRequest::ClusterVolumeSpec)) }
      attr_reader :cluster_volume_spec

      sig do
        params(
          cluster_volume_spec:
            DockerEngine::CreateRequest::ClusterVolumeSpec::OrHash
        ).void
      end
      attr_writer :cluster_volume_spec

      # Name of the volume driver to use.
      sig { returns(T.nilable(String)) }
      attr_reader :driver

      sig { params(driver: String).void }
      attr_writer :driver

      # A mapping of driver options and values. These options are passed directly to the
      # driver and are driver specific.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :driver_opts

      sig { params(driver_opts: T::Hash[Symbol, String]).void }
      attr_writer :driver_opts

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # The new volume's name. If not specified, Docker generates a name.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Volume configuration
      sig do
        params(
          cluster_volume_spec:
            DockerEngine::CreateRequest::ClusterVolumeSpec::OrHash,
          driver: String,
          driver_opts: T::Hash[Symbol, String],
          labels: T::Hash[Symbol, String],
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Cluster-specific options used to create the volume.
        cluster_volume_spec: nil,
        # Name of the volume driver to use.
        driver: nil,
        # A mapping of driver options and values. These options are passed directly to the
        # driver and are driver specific.
        driver_opts: nil,
        # User-defined key/value metadata.
        labels: nil,
        # The new volume's name. If not specified, Docker generates a name.
        name: nil
      )
      end

      sig do
        override.returns(
          {
            cluster_volume_spec: DockerEngine::CreateRequest::ClusterVolumeSpec,
            driver: String,
            driver_opts: T::Hash[Symbol, String],
            labels: T::Hash[Symbol, String],
            name: String
          }
        )
      end
      def to_hash
      end

      class ClusterVolumeSpec < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::CreateRequest::ClusterVolumeSpec,
              DockerEngine::Internal::AnyHash
            )
          end

        # Defines how the volume is used by tasks.
        sig do
          returns(
            T.nilable(
              DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode
            )
          )
        end
        attr_reader :access_mode

        sig do
          params(
            access_mode:
              DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::OrHash
          ).void
        end
        attr_writer :access_mode

        # Group defines the volume group of this volume. Volumes belonging to the same
        # group can be referred to by group name when creating Services. Referring to a
        # volume by group instructs Swarm to treat volumes in that group interchangeably
        # for the purpose of scheduling. Volumes with an empty string for a group
        # technically all belong to the same, emptystring group.
        sig { returns(T.nilable(String)) }
        attr_reader :group

        sig { params(group: String).void }
        attr_writer :group

        # Cluster-specific options used to create the volume.
        sig do
          params(
            access_mode:
              DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::OrHash,
            group: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Defines how the volume is used by tasks.
          access_mode: nil,
          # Group defines the volume group of this volume. Volumes belonging to the same
          # group can be referred to by group name when creating Services. Referring to a
          # volume by group instructs Swarm to treat volumes in that group interchangeably
          # for the purpose of scheduling. Volumes with an empty string for a group
          # technically all belong to the same, emptystring group.
          group: nil
        )
        end

        sig do
          override.returns(
            {
              access_mode:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode,
              group: String
            }
          )
        end
        def to_hash
        end

        class AccessMode < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode,
                DockerEngine::Internal::AnyHash
              )
            end

          # Requirements for the accessible topology of the volume. These fields are
          # optional. For an in-depth description of what these fields mean, see the CSI
          # specification.
          sig do
            returns(
              T.nilable(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements
              )
            )
          end
          attr_reader :accessibility_requirements

          sig do
            params(
              accessibility_requirements:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements::OrHash
            ).void
          end
          attr_writer :accessibility_requirements

          # The availability of the volume for use in tasks.
          #
          # - `active` The volume is fully available for scheduling on the cluster
          # - `pause` No new workloads should use the volume, but existing workloads are not
          #   stopped.
          # - `drain` All workloads using this volume should be stopped and rescheduled, and
          #   no new ones should be started.
          sig do
            returns(
              T.nilable(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::OrSymbol
              )
            )
          end
          attr_reader :availability

          sig do
            params(
              availability:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::OrSymbol
            ).void
          end
          attr_writer :availability

          # The desired capacity that the volume should be created with. If empty, the
          # plugin will decide the capacity.
          sig do
            returns(
              T.nilable(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange
              )
            )
          end
          attr_reader :capacity_range

          sig do
            params(
              capacity_range:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange::OrHash
            ).void
          end
          attr_writer :capacity_range

          # Options for using this volume as a Mount-type volume.
          #
          #     Either MountVolume or BlockVolume, but not both, must be
          #     present.
          #
          # properties: FsType: type: "string" description: | Specifies the filesystem type
          # for the mount volume. Optional. MountFlags: type: "array" description: | Flags
          # to pass when mounting the volume. Optional. items: type: "string" BlockVolume:
          # type: "object" description: | Options for using this volume as a Block-type
          # volume. Intentionally empty.
          sig { returns(T.nilable(T.anything)) }
          attr_reader :mount_volume

          sig { params(mount_volume: T.anything).void }
          attr_writer :mount_volume

          # The set of nodes this volume can be used on at one time.
          #
          # - `single` The volume may only be scheduled to one node at a time.
          # - `multi` the volume may be scheduled to any supported number of nodes at a
          #   time.
          sig do
            returns(
              T.nilable(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::OrSymbol
              )
            )
          end
          attr_reader :scope

          sig do
            params(
              scope:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::OrSymbol
            ).void
          end
          attr_writer :scope

          # Swarm Secrets that are passed to the CSI storage plugin when operating on this
          # volume.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Secret
                ]
              )
            )
          end
          attr_reader :secrets

          sig do
            params(
              secrets:
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Secret::OrHash
                ]
            ).void
          end
          attr_writer :secrets

          # The number and way that different tasks can use this volume at one time.
          #
          # - `none` The volume may only be used by one task at a time.
          # - `readonly` The volume may be used by any number of tasks, but they all must
          #   mount the volume as readonly
          # - `onewriter` The volume may be used by any number of tasks, but only one may
          #   mount it as read/write.
          # - `all` The volume may have any number of readers and writers.
          sig do
            returns(
              T.nilable(
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::OrSymbol
              )
            )
          end
          attr_reader :sharing

          sig do
            params(
              sharing:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::OrSymbol
            ).void
          end
          attr_writer :sharing

          # Defines how the volume is used by tasks.
          sig do
            params(
              accessibility_requirements:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements::OrHash,
              availability:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::OrSymbol,
              capacity_range:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange::OrHash,
              mount_volume: T.anything,
              scope:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::OrSymbol,
              secrets:
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Secret::OrHash
                ],
              sharing:
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Requirements for the accessible topology of the volume. These fields are
            # optional. For an in-depth description of what these fields mean, see the CSI
            # specification.
            accessibility_requirements: nil,
            # The availability of the volume for use in tasks.
            #
            # - `active` The volume is fully available for scheduling on the cluster
            # - `pause` No new workloads should use the volume, but existing workloads are not
            #   stopped.
            # - `drain` All workloads using this volume should be stopped and rescheduled, and
            #   no new ones should be started.
            availability: nil,
            # The desired capacity that the volume should be created with. If empty, the
            # plugin will decide the capacity.
            capacity_range: nil,
            # Options for using this volume as a Mount-type volume.
            #
            #     Either MountVolume or BlockVolume, but not both, must be
            #     present.
            #
            # properties: FsType: type: "string" description: | Specifies the filesystem type
            # for the mount volume. Optional. MountFlags: type: "array" description: | Flags
            # to pass when mounting the volume. Optional. items: type: "string" BlockVolume:
            # type: "object" description: | Options for using this volume as a Block-type
            # volume. Intentionally empty.
            mount_volume: nil,
            # The set of nodes this volume can be used on at one time.
            #
            # - `single` The volume may only be scheduled to one node at a time.
            # - `multi` the volume may be scheduled to any supported number of nodes at a
            #   time.
            scope: nil,
            # Swarm Secrets that are passed to the CSI storage plugin when operating on this
            # volume.
            secrets: nil,
            # The number and way that different tasks can use this volume at one time.
            #
            # - `none` The volume may only be used by one task at a time.
            # - `readonly` The volume may be used by any number of tasks, but they all must
            #   mount the volume as readonly
            # - `onewriter` The volume may be used by any number of tasks, but only one may
            #   mount it as read/write.
            # - `all` The volume may have any number of readers and writers.
            sharing: nil
          )
          end

          sig do
            override.returns(
              {
                accessibility_requirements:
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements,
                availability:
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::OrSymbol,
                capacity_range:
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange,
                mount_volume: T.anything,
                scope:
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::OrSymbol,
                secrets:
                  T::Array[
                    DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Secret
                  ],
                sharing:
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::OrSymbol
              }
            )
          end
          def to_hash
          end

          class AccessibilityRequirements < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::AccessibilityRequirements,
                  DockerEngine::Internal::AnyHash
                )
              end

            # A list of topologies that the volume should attempt to be provisioned in.
            sig { returns(T.nilable(T::Array[T::Hash[Symbol, String]])) }
            attr_reader :preferred

            sig { params(preferred: T::Array[T::Hash[Symbol, String]]).void }
            attr_writer :preferred

            # A list of required topologies, at least one of which the volume must be
            # accessible from.
            sig { returns(T.nilable(T::Array[T::Hash[Symbol, String]])) }
            attr_reader :requisite

            sig { params(requisite: T::Array[T::Hash[Symbol, String]]).void }
            attr_writer :requisite

            # Requirements for the accessible topology of the volume. These fields are
            # optional. For an in-depth description of what these fields mean, see the CSI
            # specification.
            sig do
              params(
                preferred: T::Array[T::Hash[Symbol, String]],
                requisite: T::Array[T::Hash[Symbol, String]]
              ).returns(T.attached_class)
            end
            def self.new(
              # A list of topologies that the volume should attempt to be provisioned in.
              preferred: nil,
              # A list of required topologies, at least one of which the volume must be
              # accessible from.
              requisite: nil
            )
            end

            sig do
              override.returns(
                {
                  preferred: T::Array[T::Hash[Symbol, String]],
                  requisite: T::Array[T::Hash[Symbol, String]]
                }
              )
            end
            def to_hash
            end
          end

          # The availability of the volume for use in tasks.
          #
          # - `active` The volume is fully available for scheduling on the cluster
          # - `pause` No new workloads should use the volume, but existing workloads are not
          #   stopped.
          # - `drain` All workloads using this volume should be stopped and rescheduled, and
          #   no new ones should be started.
          module Availability
            extend DockerEngine::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::TaggedSymbol
              )
            PAUSE =
              T.let(
                :pause,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::TaggedSymbol
              )
            DRAIN =
              T.let(
                :drain,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Availability::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class CapacityRange < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::CapacityRange,
                  DockerEngine::Internal::AnyHash
                )
              end

            # The volume must not be bigger than this. The value of 0 indicates an unspecified
            # maximum.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit_bytes

            sig { params(limit_bytes: Integer).void }
            attr_writer :limit_bytes

            # The volume must be at least this big. The value of 0 indicates an unspecified
            # minimum
            sig { returns(T.nilable(Integer)) }
            attr_reader :required_bytes

            sig { params(required_bytes: Integer).void }
            attr_writer :required_bytes

            # The desired capacity that the volume should be created with. If empty, the
            # plugin will decide the capacity.
            sig do
              params(limit_bytes: Integer, required_bytes: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # The volume must not be bigger than this. The value of 0 indicates an unspecified
              # maximum.
              limit_bytes: nil,
              # The volume must be at least this big. The value of 0 indicates an unspecified
              # minimum
              required_bytes: nil
            )
            end

            sig do
              override.returns(
                { limit_bytes: Integer, required_bytes: Integer }
              )
            end
            def to_hash
            end
          end

          # The set of nodes this volume can be used on at one time.
          #
          # - `single` The volume may only be scheduled to one node at a time.
          # - `multi` the volume may be scheduled to any supported number of nodes at a
          #   time.
          module Scope
            extend DockerEngine::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SINGLE =
              T.let(
                :single,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::TaggedSymbol
              )
            MULTI =
              T.let(
                :multi,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Scope::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Secret < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Secret,
                  DockerEngine::Internal::AnyHash
                )
              end

            # Key is the name of the key of the key-value pair passed to the plugin.
            sig { returns(T.nilable(String)) }
            attr_reader :key

            sig { params(key: String).void }
            attr_writer :key

            # Secret is the swarm Secret object from which to read data. This can be a Secret
            # name or ID. The Secret data is retrieved by swarm and used as the value of the
            # key-value pair passed to the plugin.
            sig { returns(T.nilable(String)) }
            attr_reader :secret

            sig { params(secret: String).void }
            attr_writer :secret

            # One cluster volume secret entry. Defines a key-value pair that is passed to the
            # plugin.
            sig do
              params(key: String, secret: String).returns(T.attached_class)
            end
            def self.new(
              # Key is the name of the key of the key-value pair passed to the plugin.
              key: nil,
              # Secret is the swarm Secret object from which to read data. This can be a Secret
              # name or ID. The Secret data is retrieved by swarm and used as the value of the
              # key-value pair passed to the plugin.
              secret: nil
            )
            end

            sig { override.returns({ key: String, secret: String }) }
            def to_hash
            end
          end

          # The number and way that different tasks can use this volume at one time.
          #
          # - `none` The volume may only be used by one task at a time.
          # - `readonly` The volume may be used by any number of tasks, but they all must
          #   mount the volume as readonly
          # - `onewriter` The volume may be used by any number of tasks, but only one may
          #   mount it as read/write.
          # - `all` The volume may have any number of readers and writers.
          module Sharing
            extend DockerEngine::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NONE =
              T.let(
                :none,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::TaggedSymbol
              )
            READONLY =
              T.let(
                :readonly,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::TaggedSymbol
              )
            ONEWRITER =
              T.let(
                :onewriter,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::TaggedSymbol
              )
            ALL =
              T.let(
                :all,
                DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngine::CreateRequest::ClusterVolumeSpec::AccessMode::Sharing::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
