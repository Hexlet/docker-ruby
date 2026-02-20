# typed: strong

module DockerEngineRuby
  module Models
    class VolumeUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::VolumeUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :version

      # Cluster-specific options used to create the volume.
      sig { returns(T.nilable(DockerEngineRuby::VolumeUpdateParams::Spec)) }
      attr_reader :spec

      sig do
        params(spec: DockerEngineRuby::VolumeUpdateParams::Spec::OrHash).void
      end
      attr_writer :spec

      sig do
        params(
          version: Integer,
          spec: DockerEngineRuby::VolumeUpdateParams::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        version:,
        # Cluster-specific options used to create the volume.
        spec: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            version: Integer,
            spec: DockerEngineRuby::VolumeUpdateParams::Spec,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Spec < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::VolumeUpdateParams::Spec,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        # Defines how the volume is used by tasks.
        sig do
          returns(
            T.nilable(DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode)
          )
        end
        attr_reader :access_mode

        sig do
          params(
            access_mode:
              DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::OrHash
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
              DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::OrHash,
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
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode,
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
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements
              )
            )
          end
          attr_reader :accessibility_requirements

          sig do
            params(
              accessibility_requirements:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements::OrHash
            ).void
          end
          attr_writer :accessibility_requirements

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::OrSymbol
              )
            )
          end
          attr_reader :availability

          sig do
            params(
              availability:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::OrSymbol
            ).void
          end
          attr_writer :availability

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange
              )
            )
          end
          attr_reader :capacity_range

          sig do
            params(
              capacity_range:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange::OrHash
            ).void
          end
          attr_writer :capacity_range

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :mount_volume

          sig { params(mount_volume: T::Hash[Symbol, T.anything]).void }
          attr_writer :mount_volume

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::OrSymbol
              )
            )
          end
          attr_reader :scope

          sig do
            params(
              scope:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::OrSymbol
            ).void
          end
          attr_writer :scope

          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret
                ]
              )
            )
          end
          attr_reader :secrets

          sig do
            params(
              secrets:
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret::OrHash
                ]
            ).void
          end
          attr_writer :secrets

          sig do
            returns(
              T.nilable(
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::OrSymbol
              )
            )
          end
          attr_reader :sharing

          sig do
            params(
              sharing:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::OrSymbol
            ).void
          end
          attr_writer :sharing

          # Defines how the volume is used by tasks.
          sig do
            params(
              accessibility_requirements:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements::OrHash,
              availability:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::OrSymbol,
              capacity_range:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange::OrHash,
              mount_volume: T::Hash[Symbol, T.anything],
              scope:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::OrSymbol,
              secrets:
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret::OrHash
                ],
              sharing:
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::OrSymbol
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
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements,
                availability:
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::OrSymbol,
                capacity_range:
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange,
                mount_volume: T::Hash[Symbol, T.anything],
                scope:
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::OrSymbol,
                secrets:
                  T::Array[
                    DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret
                  ],
                sharing:
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::OrSymbol
              }
            )
          end
          def to_hash
          end

          class AccessibilityRequirements < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::AccessibilityRequirements,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Array[T::Hash[Symbol, String]])) }
            attr_reader :preferred

            sig { params(preferred: T::Array[T::Hash[Symbol, String]]).void }
            attr_writer :preferred

            sig { returns(T.nilable(T::Array[T::Hash[Symbol, String]])) }
            attr_reader :requisite

            sig { params(requisite: T::Array[T::Hash[Symbol, String]]).void }
            attr_writer :requisite

            sig do
              params(
                preferred: T::Array[T::Hash[Symbol, String]],
                requisite: T::Array[T::Hash[Symbol, String]]
              ).returns(T.attached_class)
            end
            def self.new(preferred: nil, requisite: nil)
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

          module Availability
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::TaggedSymbol
              )
            PAUSE =
              T.let(
                :pause,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::TaggedSymbol
              )
            DRAIN =
              T.let(
                :drain,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Availability::TaggedSymbol
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
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::CapacityRange,
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
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SINGLE =
              T.let(
                :single,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::TaggedSymbol
              )
            MULTI =
              T.let(
                :multi,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Scope::TaggedSymbol
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
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Secret,
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
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NONE =
              T.let(
                :none,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::TaggedSymbol
              )
            READONLY =
              T.let(
                :readonly,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::TaggedSymbol
              )
            ONEWRITER =
              T.let(
                :onewriter,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::TaggedSymbol
              )
            ALL =
              T.let(
                :all,
                DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::VolumeUpdateParams::Spec::AccessMode::Sharing::TaggedSymbol
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
