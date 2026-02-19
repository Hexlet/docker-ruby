# typed: strong

module DockerEngineRuby
  module Models
    class Volume < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Volume, DockerEngineRuby::Internal::AnyHash)
        end

      # Name of the volume driver used by the volume.
      sig { returns(String) }
      attr_accessor :driver

      # User-defined key/value metadata.
      sig { returns(T.anything) }
      attr_accessor :labels

      # Mount path of the volume on the host.
      sig { returns(String) }
      attr_accessor :mountpoint

      # Name of the volume.
      sig { returns(String) }
      attr_accessor :name

      # The driver specific options used when creating the volume.
      sig { returns(T.anything) }
      attr_accessor :options

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      sig { returns(DockerEngineRuby::Volume::Scope::TaggedSymbol) }
      attr_accessor :scope

      # Options and information specific to, and only present on, Swarm CSI cluster
      # volumes.
      sig { returns(T.nilable(DockerEngineRuby::Volume::ClusterVolume)) }
      attr_reader :cluster_volume

      sig do
        params(
          cluster_volume: DockerEngineRuby::Volume::ClusterVolume::OrHash
        ).void
      end
      attr_writer :cluster_volume

      # Date/Time the volume was created.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Low-level details about the volume, provided by the volume driver. Details are
      # returned as a map with key/value pairs: `{"key":"value","key2":"value2"}`.
      #
      # The `Status` field is optional, and is omitted if the volume driver does not
      # support this feature.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :status

      sig { params(status: T.anything).void }
      attr_writer :status

      # Usage details about the volume. This information is used by the `GET /system/df`
      # endpoint, and omitted in other endpoints.
      sig { returns(T.nilable(DockerEngineRuby::Volume::UsageData)) }
      attr_reader :usage_data

      sig do
        params(
          usage_data: T.nilable(DockerEngineRuby::Volume::UsageData::OrHash)
        ).void
      end
      attr_writer :usage_data

      sig do
        params(
          driver: String,
          labels: T.anything,
          mountpoint: String,
          name: String,
          options: T.anything,
          scope: DockerEngineRuby::Volume::Scope::OrSymbol,
          cluster_volume: DockerEngineRuby::Volume::ClusterVolume::OrHash,
          created_at: Time,
          status: T.anything,
          usage_data: T.nilable(DockerEngineRuby::Volume::UsageData::OrHash)
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
            labels: T.anything,
            mountpoint: String,
            name: String,
            options: T.anything,
            scope: DockerEngineRuby::Volume::Scope::TaggedSymbol,
            cluster_volume: DockerEngineRuby::Volume::ClusterVolume,
            created_at: Time,
            status: T.anything,
            usage_data: T.nilable(DockerEngineRuby::Volume::UsageData)
          }
        )
      end
      def to_hash
      end

      # The level at which the volume exists. Either `global` for cluster-wide, or
      # `local` for machine level.
      module Scope
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DockerEngineRuby::Volume::Scope) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL = T.let(:local, DockerEngineRuby::Volume::Scope::TaggedSymbol)
        GLOBAL = T.let(:global, DockerEngineRuby::Volume::Scope::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::Volume::Scope::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class ClusterVolume < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Volume::ClusterVolume,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        # The Swarm ID of this volume. Because cluster volumes are Swarm objects, they
        # have an ID, unlike non-cluster volumes. This ID can be used to refer to the
        # Volume instead of the name.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Information about the global status of the volume.
        sig do
          returns(T.nilable(DockerEngineRuby::Volume::ClusterVolume::Info))
        end
        attr_reader :info

        sig do
          params(
            info: DockerEngineRuby::Volume::ClusterVolume::Info::OrHash
          ).void
        end
        attr_writer :info

        # The status of the volume as it pertains to its publishing and use on specific
        # nodes
        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineRuby::Volume::ClusterVolume::PublishStatus]
            )
          )
        end
        attr_reader :publish_status

        sig do
          params(
            publish_status:
              T::Array[
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::OrHash
              ]
          ).void
        end
        attr_writer :publish_status

        # Cluster-specific options used to create the volume.
        sig do
          returns(T.nilable(DockerEngineRuby::Volume::ClusterVolume::Spec))
        end
        attr_reader :spec

        sig do
          params(
            spec: DockerEngineRuby::Volume::ClusterVolume::Spec::OrHash
          ).void
        end
        attr_writer :spec

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
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
        sig do
          returns(T.nilable(DockerEngineRuby::Volume::ClusterVolume::Version))
        end
        attr_reader :version

        sig do
          params(
            version: DockerEngineRuby::Volume::ClusterVolume::Version::OrHash
          ).void
        end
        attr_writer :version

        # Options and information specific to, and only present on, Swarm CSI cluster
        # volumes.
        sig do
          params(
            created_at: Time,
            id: String,
            info: DockerEngineRuby::Volume::ClusterVolume::Info::OrHash,
            publish_status:
              T::Array[
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::OrHash
              ],
            spec: DockerEngineRuby::Volume::ClusterVolume::Spec::OrHash,
            updated_at: Time,
            version: DockerEngineRuby::Volume::ClusterVolume::Version::OrHash
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
              created_at: Time,
              id: String,
              info: DockerEngineRuby::Volume::ClusterVolume::Info,
              publish_status:
                T::Array[
                  DockerEngineRuby::Volume::ClusterVolume::PublishStatus
                ],
              spec: DockerEngineRuby::Volume::ClusterVolume::Spec,
              updated_at: Time,
              version: DockerEngineRuby::Volume::ClusterVolume::Version
            }
          )
        end
        def to_hash
        end

        class Info < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Volume::ClusterVolume::Info,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Array[T.anything])) }
          attr_reader :accessible_topology

          sig { params(accessible_topology: T::Array[T.anything]).void }
          attr_writer :accessible_topology

          sig { returns(T.nilable(Integer)) }
          attr_reader :capacity_bytes

          sig { params(capacity_bytes: Integer).void }
          attr_writer :capacity_bytes

          sig { returns(T.nilable(T.anything)) }
          attr_reader :volume_context

          sig { params(volume_context: T.anything).void }
          attr_writer :volume_context

          sig { returns(T.nilable(String)) }
          attr_reader :volume_id

          sig { params(volume_id: String).void }
          attr_writer :volume_id

          # Information about the global status of the volume.
          sig do
            params(
              accessible_topology: T::Array[T.anything],
              capacity_bytes: Integer,
              volume_context: T.anything,
              volume_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            accessible_topology: nil,
            capacity_bytes: nil,
            volume_context: nil,
            volume_id: nil
          )
          end

          sig do
            override.returns(
              {
                accessible_topology: T::Array[T.anything],
                capacity_bytes: Integer,
                volume_context: T.anything,
                volume_id: String
              }
            )
          end
          def to_hash
          end
        end

        class PublishStatus < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :node_id

          sig { params(node_id: String).void }
          attr_writer :node_id

          sig { returns(T.nilable(T.anything)) }
          attr_reader :publish_context

          sig { params(publish_context: T.anything).void }
          attr_writer :publish_context

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            )
          end
          attr_reader :state

          sig do
            params(
              state:
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::OrSymbol
            ).void
          end
          attr_writer :state

          sig do
            params(
              node_id: String,
              publish_context: T.anything,
              state:
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(node_id: nil, publish_context: nil, state: nil)
          end

          sig do
            override.returns(
              {
                node_id: String,
                publish_context: T.anything,
                state:
                  DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module State
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING_PUBLISH =
              T.let(
                :"pending-publish",
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PUBLISHED =
              T.let(
                :published,
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PENDING_NODE_UNPUBLISH =
              T.let(
                :"pending-node-unpublish",
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )
            PENDING_CONTROLLER_UNPUBLISH =
              T.let(
                :"pending-controller-unpublish",
                DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::Volume::ClusterVolume::PublishStatus::State::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Spec < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Volume::ClusterVolume::Spec,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          # Defines how the volume is used by tasks.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode
              )
            )
          end
          attr_reader :access_mode

          sig do
            params(
              access_mode:
                DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::OrHash
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
                DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::OrHash,
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
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode,
                group: String
              }
            )
          end
          def to_hash
          end

          class AccessMode < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements
                )
              )
            end
            attr_reader :accessibility_requirements

            sig do
              params(
                accessibility_requirements:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements::OrHash
              ).void
            end
            attr_writer :accessibility_requirements

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              )
            end
            attr_reader :availability

            sig do
              params(
                availability:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::OrSymbol
              ).void
            end
            attr_writer :availability

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange
                )
              )
            end
            attr_reader :capacity_range

            sig do
              params(
                capacity_range:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange::OrHash
              ).void
            end
            attr_writer :capacity_range

            sig { returns(T.nilable(T.anything)) }
            attr_reader :mount_volume

            sig { params(mount_volume: T.anything).void }
            attr_writer :mount_volume

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )
              )
            end
            attr_reader :scope

            sig do
              params(
                scope:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::OrSymbol
              ).void
            end
            attr_writer :scope

            sig do
              returns(
                T.nilable(
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret
                  ]
                )
              )
            end
            attr_reader :secrets

            sig do
              params(
                secrets:
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret::OrHash
                  ]
              ).void
            end
            attr_writer :secrets

            sig do
              returns(
                T.nilable(
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              )
            end
            attr_reader :sharing

            sig do
              params(
                sharing:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::OrSymbol
              ).void
            end
            attr_writer :sharing

            # Defines how the volume is used by tasks.
            sig do
              params(
                accessibility_requirements:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements::OrHash,
                availability:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::OrSymbol,
                capacity_range:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange::OrHash,
                mount_volume: T.anything,
                scope:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::OrSymbol,
                secrets:
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret::OrHash
                  ],
                sharing:
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              accessibility_requirements: nil,
              availability: nil,
              capacity_range: nil,
              mount_volume: nil,
              scope: nil,
              secrets: nil,
              sharing: nil
            )
            end

            sig do
              override.returns(
                {
                  accessibility_requirements:
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements,
                  availability:
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol,
                  capacity_range:
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange,
                  mount_volume: T.anything,
                  scope:
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol,
                  secrets:
                    T::Array[
                      DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret
                    ],
                  sharing:
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            class AccessibilityRequirements < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::AccessibilityRequirements,
                    DockerEngineRuby::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Array[T.anything])) }
              attr_reader :preferred

              sig { params(preferred: T::Array[T.anything]).void }
              attr_writer :preferred

              sig { returns(T.nilable(T::Array[T.anything])) }
              attr_reader :requisite

              sig { params(requisite: T::Array[T.anything]).void }
              attr_writer :requisite

              sig do
                params(
                  preferred: T::Array[T.anything],
                  requisite: T::Array[T.anything]
                ).returns(T.attached_class)
              end
              def self.new(preferred: nil, requisite: nil)
              end

              sig do
                override.returns(
                  {
                    preferred: T::Array[T.anything],
                    requisite: T::Array[T.anything]
                  }
                )
              end
              def to_hash
              end
            end

            module Availability
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTIVE =
                T.let(
                  :active,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              PAUSE =
                T.let(
                  :pause,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )
              DRAIN =
                T.let(
                  :drain,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Availability::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class CapacityRange < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::CapacityRange,
                    DockerEngineRuby::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(Integer)) }
              attr_reader :limit_bytes

              sig { params(limit_bytes: Integer).void }
              attr_writer :limit_bytes

              sig { returns(T.nilable(Integer)) }
              attr_reader :required_bytes

              sig { params(required_bytes: Integer).void }
              attr_writer :required_bytes

              sig do
                params(limit_bytes: Integer, required_bytes: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(limit_bytes: nil, required_bytes: nil)
              end

              sig do
                override.returns(
                  { limit_bytes: Integer, required_bytes: Integer }
                )
              end
              def to_hash
              end
            end

            module Scope
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SINGLE =
                T.let(
                  :single,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )
              MULTI =
                T.let(
                  :multi,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Scope::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Secret < DockerEngineRuby::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Secret,
                    DockerEngineRuby::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :key

              sig { params(key: String).void }
              attr_writer :key

              sig { returns(T.nilable(String)) }
              attr_reader :secret

              sig { params(secret: String).void }
              attr_writer :secret

              sig do
                params(key: String, secret: String).returns(T.attached_class)
              end
              def self.new(key: nil, secret: nil)
              end

              sig { override.returns({ key: String, secret: String }) }
              def to_hash
              end
            end

            module Sharing
              extend DockerEngineRuby::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NONE =
                T.let(
                  :none,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              READONLY =
                T.let(
                  :readonly,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              ONEWRITER =
                T.let(
                  :onewriter,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )
              ALL =
                T.let(
                  :all,
                  DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineRuby::Volume::ClusterVolume::Spec::AccessMode::Sharing::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class Version < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Volume::ClusterVolume::Version,
                DockerEngineRuby::Internal::AnyHash
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

      class UsageData < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Volume::UsageData,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :ref_count

        sig { returns(Integer) }
        attr_accessor :size

        # Usage details about the volume. This information is used by the `GET /system/df`
        # endpoint, and omitted in other endpoints.
        sig do
          params(ref_count: Integer, size: Integer).returns(T.attached_class)
        end
        def self.new(ref_count:, size:)
        end

        sig { override.returns({ ref_count: Integer, size: Integer }) }
        def to_hash
        end
      end
    end
  end
end
