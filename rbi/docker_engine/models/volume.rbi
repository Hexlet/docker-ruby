# typed: strong

module DockerEngine
  module Models
    class Volume < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::Volume, DockerEngine::Internal::AnyHash)
        end

      # Name of the volume driver used by the volume.
      sig { returns(String) }
      attr_accessor :driver

      # User-defined key/value metadata.
      sig { returns(T::Hash[Symbol, String]) }
      attr_accessor :labels

      # Mount path of the volume on the host.
      sig { returns(String) }
      attr_accessor :mountpoint

      # Name of the volume.
      sig { returns(String) }
      attr_accessor :name

      # The driver specific options used when creating the volume.
      sig { returns(T::Hash[Symbol, String]) }
      attr_accessor :options

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      sig { returns(DockerEngine::Volume::Scope::TaggedSymbol) }
      attr_accessor :scope

      # Options and information specific to, and only present on, Swarm CSI cluster
      # volumes.
      sig { returns(T.nilable(DockerEngine::Volume::ClusterVolume)) }
      attr_reader :cluster_volume

      sig do
        params(cluster_volume: DockerEngine::Volume::ClusterVolume::OrHash).void
      end
      attr_writer :cluster_volume

      # Date/Time the volume was created.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # Low-level details about the volume, provided by the volume driver. Details are
      # returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
      #
      # The `Status` field is optional, and is omitted if the volume driver does not
      # support this feature.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :status

      sig { params(status: T::Hash[Symbol, T.anything]).void }
      attr_writer :status

      # Usage details about the volume. This information is used by the `GET /system/df`
      # endpoint, and omitted in other endpoints.
      sig { returns(T.nilable(DockerEngine::Volume::UsageData)) }
      attr_reader :usage_data

      sig do
        params(
          usage_data: T.nilable(DockerEngine::Volume::UsageData::OrHash)
        ).void
      end
      attr_writer :usage_data

      sig do
        params(
          driver: String,
          labels: T::Hash[Symbol, String],
          mountpoint: String,
          name: String,
          options: T::Hash[Symbol, String],
          scope: DockerEngine::Volume::Scope::OrSymbol,
          cluster_volume: DockerEngine::Volume::ClusterVolume::OrHash,
          created_at: String,
          status: T::Hash[Symbol, T.anything],
          usage_data: T.nilable(DockerEngine::Volume::UsageData::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the volume driver used by the volume.
        driver:,
        # User-defined key/value metadata.
        labels:,
        # Mount path of the volume on the host.
        mountpoint:,
        # Name of the volume.
        name:,
        # The driver specific options used when creating the volume.
        options:,
        # The level at which the volume exists. Either `global` for cluster-wide, or
        # `local` for machine level.
        scope:,
        # Options and information specific to, and only present on, Swarm CSI cluster
        # volumes.
        cluster_volume: nil,
        # Date/Time the volume was created.
        created_at: nil,
        # Low-level details about the volume, provided by the volume driver. Details are
        # returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
        #
        # The `Status` field is optional, and is omitted if the volume driver does not
        # support this feature.
        status: nil,
        # Usage details about the volume. This information is used by the `GET /system/df`
        # endpoint, and omitted in other endpoints.
        usage_data: nil
      )
      end

      sig do
        override.returns(
          {
            driver: String,
            labels: T::Hash[Symbol, String],
            mountpoint: String,
            name: String,
            options: T::Hash[Symbol, String],
            scope: DockerEngine::Volume::Scope::TaggedSymbol,
            cluster_volume: DockerEngine::Volume::ClusterVolume,
            created_at: String,
            status: T::Hash[Symbol, T.anything],
            usage_data: T.nilable(DockerEngine::Volume::UsageData)
          }
        )
      end
      def to_hash
      end

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      module Scope
        extend DockerEngine::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DockerEngine::Volume::Scope) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL = T.let(:local, DockerEngine::Volume::Scope::TaggedSymbol)
        GLOBAL = T.let(:global, DockerEngine::Volume::Scope::TaggedSymbol)

        sig do
          override.returns(T::Array[DockerEngine::Volume::Scope::TaggedSymbol])
        end
        def self.values
        end
      end

      class ClusterVolume < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::Volume::ClusterVolume,
              DockerEngine::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        # The Swarm ID of this volume. Because cluster volumes are Swarm objects, they
        # have an ID, unlike non-cluster volumes. This ID can be used to refer to the
        # Volume instead of the name.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Information about the global status of the volume.
        sig { returns(T.nilable(DockerEngine::Volume::ClusterVolume::Info)) }
        attr_reader :info

        sig do
          params(info: DockerEngine::Volume::ClusterVolume::Info::OrHash).void
        end
        attr_writer :info

        # The status of the volume as it pertains to its publishing and use on specific
        # nodes
        sig do
          returns(
            T.nilable(
              T::Array[DockerEngine::Volume::ClusterVolume::PublishStatus]
            )
          )
        end
        attr_reader :publish_status

        sig do
          params(
            publish_status:
              T::Array[
                DockerEngine::Volume::ClusterVolume::PublishStatus::OrHash
              ]
          ).void
        end
        attr_writer :publish_status

        # Cluster-specific options used to create the volume.
        sig { returns(T.nilable(DockerEngine::Volume::ClusterVolume::Spec)) }
        attr_reader :spec

        sig do
          params(spec: DockerEngine::Volume::ClusterVolume::Spec::OrHash).void
        end
        attr_writer :spec

        sig { returns(T.nilable(String)) }
        attr_reader :updated_at

        sig { params(updated_at: String).void }
        attr_writer :updated_at

        # The version number of the object such as node, service, etc. This is needed to
        # avoid conflicting writes. The client must send the version number along with the
        # modified specification when updating these objects.
        #
        # This approach ensures safe concurrency and determinism in that the change on the
        # object may not be applied if the version number has changed from the last read.
        # In other words, if two update requests specify the same base version, only one
        # of the requests can succeed. As a result, two separate update requests that
        # happen at the same time will not unintentionally overwrite each other.
        sig { returns(T.nilable(DockerEngine::Volume::ClusterVolume::Version)) }
        attr_reader :version

        sig do
          params(
            version: DockerEngine::Volume::ClusterVolume::Version::OrHash
          ).void
        end
        attr_writer :version

        # Options and information specific to, and only present on, Swarm CSI cluster
        # volumes.
        sig do
          params(
            created_at: String,
            id: String,
            info: DockerEngine::Volume::ClusterVolume::Info::OrHash,
            publish_status:
              T::Array[
                DockerEngine::Volume::ClusterVolume::PublishStatus::OrHash
              ],
            spec: DockerEngine::Volume::ClusterVolume::Spec::OrHash,
            updated_at: String,
            version: DockerEngine::Volume::ClusterVolume::Version::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          created_at: nil,
          # The Swarm ID of this volume. Because cluster volumes are Swarm objects, they
          # have an ID, unlike non-cluster volumes. This ID can be used to refer to the
          # Volume instead of the name.
          id: nil,
          # Information about the global status of the volume.
          info: nil,
          # The status of the volume as it pertains to its publishing and use on specific
          # nodes
          publish_status: nil,
          # Cluster-specific options used to create the volume.
          spec: nil,
          updated_at: nil,
          # The version number of the object such as node, service, etc. This is needed to
          # avoid conflicting writes. The client must send the version number along with the
          # modified specification when updating these objects.
          #
          # This approach ensures safe concurrency and determinism in that the change on the
          # object may not be applied if the version number has changed from the last read.
          # In other words, if two update requests specify the same base version, only one
          # of the requests can succeed. As a result, two separate update requests that
          # happen at the same time will not unintentionally overwrite each other.
          version: nil
        )
        end

        sig do
          override.returns(
            {
              created_at: String,
              id: String,
              info: DockerEngine::Volume::ClusterVolume::Info,
              publish_status:
                T::Array[DockerEngine::Volume::ClusterVolume::PublishStatus],
              spec: DockerEngine::Volume::ClusterVolume::Spec,
              updated_at: String,
              version: DockerEngine::Volume::ClusterVolume::Version
            }
          )
        end
        def to_hash
        end

        class Info < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Volume::ClusterVolume::Info,
                DockerEngine::Internal::AnyHash
              )
            end

          # The topology this volume is actually accessible from.
          sig { returns(T.nilable(T::Array[T::Hash[Symbol, String]])) }
          attr_reader :accessible_topology

          sig do
            params(accessible_topology: T::Array[T::Hash[Symbol, String]]).void
          end
          attr_writer :accessible_topology

          # The capacity of the volume in bytes. A value of 0 indicates that the capacity is
          # unknown.
          sig { returns(T.nilable(Integer)) }
          attr_reader :capacity_bytes

          sig { params(capacity_bytes: Integer).void }
          attr_writer :capacity_bytes

          # A map of strings to strings returned from the storage plugin when the volume is
          # created.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :volume_context

          sig { params(volume_context: T::Hash[Symbol, String]).void }
          attr_writer :volume_context

          # The ID of the volume as returned by the CSI storage plugin. This is distinct
          # from the volume's ID as provided by Docker. This ID is never used by the user
          # when communicating with Docker to refer to this volume. If the ID is blank, then
          # the Volume has not been successfully created in the plugin yet.
          sig { returns(T.nilable(String)) }
          attr_reader :volume_id

          sig { params(volume_id: String).void }
          attr_writer :volume_id

          # Information about the global status of the volume.
          sig do
            params(
              accessible_topology: T::Array[T::Hash[Symbol, String]],
              capacity_bytes: Integer,
              volume_context: T::Hash[Symbol, String],
              volume_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The topology this volume is actually accessible from.
            accessible_topology: nil,
            # The capacity of the volume in bytes. A value of 0 indicates that the capacity is
            # unknown.
            capacity_bytes: nil,
            # A map of strings to strings returned from the storage plugin when the volume is
            # created.
            volume_context: nil,
            # The ID of the volume as returned by the CSI storage plugin. This is distinct
            # from the volume's ID as provided by Docker. This ID is never used by the user
            # when communicating with Docker to refer to this volume. If the ID is blank, then
            # the Volume has not been successfully created in the plugin yet.
            volume_id: nil
          )
          end

          sig do
            override.returns(
              {
                accessible_topology: T::Array[T::Hash[Symbol, String]],
                capacity_bytes: Integer,
                volume_context: T::Hash[Symbol, String],
                volume_id: String
              }
            )
          end
          def to_hash
          end
        end

        class PublishStatus < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Volume::ClusterVolume::PublishStatus,
                DockerEngine::Internal::AnyHash
              )
            end

          # The ID of the Swarm node the volume is published on.
          sig { returns(T.nilable(String)) }
          attr_reader :node_id

          sig { params(node_id: String).void }
          attr_writer :node_id

          # A map of strings to strings returned by the CSI controller plugin when a volume
          # is published.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :publish_context

          sig { params(publish_context: T::Hash[Symbol, String]).void }
          attr_writer :publish_context

          # The published state of the volume.
          #
          # - `pending-publish` The volume should be published to this node, but the call to
          #   the controller plugin to do so has not yet been successfully completed.
          # - `published` The volume is published successfully to the node.
          # - `pending-node-unpublish` The volume should be unpublished from the node, and
          #   the manager is awaiting confirmation from the worker that it has done so.
          # - `pending-controller-unpublish` The volume is successfully unpublished from the
          #   node, but has not yet been successfully unpublished on the controller.
          sig do
            returns(
              T.nilable(
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            )
          end
          attr_reader :state

          sig do
            params(
              state:
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::OrSymbol
            ).void
          end
          attr_writer :state

          sig do
            params(
              node_id: String,
              publish_context: T::Hash[Symbol, String],
              state:
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the Swarm node the volume is published on.
            node_id: nil,
            # A map of strings to strings returned by the CSI controller plugin when a volume
            # is published.
            publish_context: nil,
            # The published state of the volume.
            #
            # - `pending-publish` The volume should be published to this node, but the call to
            #   the controller plugin to do so has not yet been successfully completed.
            # - `published` The volume is published successfully to the node.
            # - `pending-node-unpublish` The volume should be unpublished from the node, and
            #   the manager is awaiting confirmation from the worker that it has done so.
            # - `pending-controller-unpublish` The volume is successfully unpublished from the
            #   node, but has not yet been successfully unpublished on the controller.
            state: nil
          )
          end

          sig do
            override.returns(
              {
                node_id: String,
                publish_context: T::Hash[Symbol, String],
                state:
                  DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The published state of the volume.
          #
          # - `pending-publish` The volume should be published to this node, but the call to
          #   the controller plugin to do so has not yet been successfully completed.
          # - `published` The volume is published successfully to the node.
          # - `pending-node-unpublish` The volume should be unpublished from the node, and
          #   the manager is awaiting confirmation from the worker that it has done so.
          # - `pending-controller-unpublish` The volume is successfully unpublished from the
          #   node, but has not yet been successfully unpublished on the controller.
          module State
            extend DockerEngine::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngine::Volume::ClusterVolume::PublishStatus::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING_PUBLISH =
              T.let(
                :"pending-publish",
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PUBLISHED =
              T.let(
                :published,
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PENDING_NODE_UNPUBLISH =
              T.let(
                :"pending-node-unpublish",
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PENDING_CONTROLLER_UNPUBLISH =
              T.let(
                :"pending-controller-unpublish",
                DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngine::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Spec < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Volume::ClusterVolume::Spec,
                DockerEngine::Internal::AnyHash
              )
            end

          # Defines how the volume is used by tasks.
          sig do
            returns(
              T.nilable(DockerEngine::Volume::ClusterVolume::Spec::AccessMode)
            )
          end
          attr_reader :access_mode

          sig do
            params(
              access_mode:
                DockerEngine::Volume::ClusterVolume::Spec::AccessMode::OrHash
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
                DockerEngine::Volume::ClusterVolume::Spec::AccessMode::OrHash,
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
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode,
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
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode,
                  DockerEngine::Internal::AnyHash
                )
              end

            # Requirements for the accessible topology of the volume. These fields are
            # optional. For an in-depth description of what these fields mean, see the CSI
            # specification.
            sig do
              returns(
                T.nilable(
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements
                )
              )
            end
            attr_reader :accessibility_requirements

            sig do
              params(
                accessibility_requirements:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements::OrHash
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
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              )
            end
            attr_reader :availability

            sig do
              params(
                availability:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::OrSymbol
              ).void
            end
            attr_writer :availability

            # The desired capacity that the volume should be created with. If empty, the
            # plugin will decide the capacity.
            sig do
              returns(
                T.nilable(
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange
                )
              )
            end
            attr_reader :capacity_range

            sig do
              params(
                capacity_range:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange::OrHash
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
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )
              )
            end
            attr_reader :scope

            sig do
              params(
                scope:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::OrSymbol
              ).void
            end
            attr_writer :scope

            # Swarm Secrets that are passed to the CSI storage plugin when operating on this
            # volume.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret
                  ]
                )
              )
            end
            attr_reader :secrets

            sig do
              params(
                secrets:
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret::OrHash
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
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              )
            end
            attr_reader :sharing

            sig do
              params(
                sharing:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::OrSymbol
              ).void
            end
            attr_writer :sharing

            # Defines how the volume is used by tasks.
            sig do
              params(
                accessibility_requirements:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements::OrHash,
                availability:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::OrSymbol,
                capacity_range:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange::OrHash,
                mount_volume: T.anything,
                scope:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::OrSymbol,
                secrets:
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret::OrHash
                  ],
                sharing:
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::OrSymbol
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements,
                  availability:
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol,
                  capacity_range:
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange,
                  mount_volume: T.anything,
                  scope:
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol,
                  secrets:
                    T::Array[
                      DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret
                    ],
                  sharing:
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            class AccessibilityRequirements < DockerEngine::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements,
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTIVE =
                T.let(
                  :active,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              PAUSE =
                T.let(
                  :pause,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              DRAIN =
                T.let(
                  :drain,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::CapacityRange,
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SINGLE =
                T.let(
                  :single,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )
              MULTI =
                T.let(
                  :multi,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Secret,
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
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NONE =
                T.let(
                  :none,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              READONLY =
                T.let(
                  :readonly,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              ONEWRITER =
                T.let(
                  :onewriter,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              ALL =
                T.let(
                  :all,
                  DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngine::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class Version < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Volume::ClusterVolume::Version,
                DockerEngine::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :index

          sig { params(index: Integer).void }
          attr_writer :index

          # The version number of the object such as node, service, etc. This is needed to
          # avoid conflicting writes. The client must send the version number along with the
          # modified specification when updating these objects.
          #
          # This approach ensures safe concurrency and determinism in that the change on the
          # object may not be applied if the version number has changed from the last read.
          # In other words, if two update requests specify the same base version, only one
          # of the requests can succeed. As a result, two separate update requests that
          # happen at the same time will not unintentionally overwrite each other.
          sig { params(index: Integer).returns(T.attached_class) }
          def self.new(index: nil)
          end

          sig { override.returns({ index: Integer }) }
          def to_hash
          end
        end
      end

      class UsageData < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::Volume::UsageData,
              DockerEngine::Internal::AnyHash
            )
          end

        # The number of containers referencing this volume. This field is set to `-1` if
        # the reference-count is not available.
        sig { returns(Integer) }
        attr_accessor :ref_count

        # Amount of disk space used by the volume (in bytes). This information is only
        # available for volumes created with the `"local"` volume driver. For volumes
        # created with other volume drivers, this field is set to `-1` ("not available")
        sig { returns(Integer) }
        attr_accessor :size

        # Usage details about the volume. This information is used by the `GET /system/df`
        # endpoint, and omitted in other endpoints.
        sig do
          params(ref_count: Integer, size: Integer).returns(T.attached_class)
        end
        def self.new(
          # The number of containers referencing this volume. This field is set to `-1` if
          # the reference-count is not available.
          ref_count:,
          # Amount of disk space used by the volume (in bytes). This information is only
          # available for volumes created with the `"local"` volume driver. For volumes
          # created with other volume drivers, this field is set to `-1` ("not available")
          size:
        )
        end

        sig { override.returns({ ref_count: Integer, size: Integer }) }
        def to_hash
        end
      end
    end
  end
end
