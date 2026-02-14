# typed: strong

module DockerEngineRuby
  module Models
    class Plugin < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::Plugin, DockerEngineRuby::Internal::AnyHash)
        end

      # The config of a plugin.
      sig { returns(DockerEngineRuby::Plugin::Config) }
      attr_reader :config

      sig { params(config: DockerEngineRuby::Plugin::Config::OrHash).void }
      attr_writer :config

      # True if the plugin is running. False if the plugin is not running, only
      # installed.
      sig { returns(T::Boolean) }
      attr_accessor :enabled

      sig { returns(String) }
      attr_accessor :name

      # user-configurable settings for the plugin.
      sig { returns(DockerEngineRuby::Plugin::Settings) }
      attr_reader :settings

      sig { params(settings: DockerEngineRuby::Plugin::Settings::OrHash).void }
      attr_writer :settings

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # plugin remote reference used to push/pull the plugin
      sig { returns(T.nilable(String)) }
      attr_reader :plugin_reference

      sig { params(plugin_reference: String).void }
      attr_writer :plugin_reference

      # A plugin for the Engine API
      sig do
        params(
          config: DockerEngineRuby::Plugin::Config::OrHash,
          enabled: T::Boolean,
          name: String,
          settings: DockerEngineRuby::Plugin::Settings::OrHash,
          id: String,
          plugin_reference: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The config of a plugin.
        config:,
        # True if the plugin is running. False if the plugin is not running, only
        # installed.
        enabled:,
        name:,
        # user-configurable settings for the plugin.
        settings:,
        id: nil,
        # plugin remote reference used to push/pull the plugin
        plugin_reference: nil
      )
      end

      sig do
        override.returns(
          {
            config: DockerEngineRuby::Plugin::Config,
            enabled: T::Boolean,
            name: String,
            settings: DockerEngineRuby::Plugin::Settings,
            id: String,
            plugin_reference: String
          }
        )
      end
      def to_hash
      end

      class Config < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Plugin::Config,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(DockerEngineRuby::Plugin::Config::Args) }
        attr_reader :args

        sig do
          params(args: DockerEngineRuby::Plugin::Config::Args::OrHash).void
        end
        attr_writer :args

        sig { returns(String) }
        attr_accessor :description

        sig { returns(String) }
        attr_accessor :documentation

        sig { returns(T::Array[String]) }
        attr_accessor :entrypoint

        sig { returns(T::Array[DockerEngineRuby::Plugin::Config::Env]) }
        attr_accessor :env

        # The interface between Docker and the plugin
        sig { returns(DockerEngineRuby::Plugin::Config::Interface) }
        attr_reader :interface

        sig do
          params(
            interface: DockerEngineRuby::Plugin::Config::Interface::OrHash
          ).void
        end
        attr_writer :interface

        sig { returns(T::Boolean) }
        attr_accessor :ipc_host

        sig { returns(DockerEngineRuby::Plugin::Config::Linux) }
        attr_reader :linux

        sig do
          params(linux: DockerEngineRuby::Plugin::Config::Linux::OrHash).void
        end
        attr_writer :linux

        sig { returns(T::Array[DockerEngineRuby::Plugin::Config::Mount]) }
        attr_accessor :mounts

        sig { returns(DockerEngineRuby::Plugin::Config::Network) }
        attr_reader :network

        sig do
          params(
            network: DockerEngineRuby::Plugin::Config::Network::OrHash
          ).void
        end
        attr_writer :network

        sig { returns(T::Boolean) }
        attr_accessor :pid_host

        sig { returns(String) }
        attr_accessor :propagated_mount

        sig { returns(String) }
        attr_accessor :work_dir

        sig { returns(T.nilable(DockerEngineRuby::Plugin::Config::Rootfs)) }
        attr_reader :rootfs

        sig do
          params(rootfs: DockerEngineRuby::Plugin::Config::Rootfs::OrHash).void
        end
        attr_writer :rootfs

        sig { returns(T.nilable(DockerEngineRuby::Plugin::Config::User)) }
        attr_reader :user

        sig do
          params(user: DockerEngineRuby::Plugin::Config::User::OrHash).void
        end
        attr_writer :user

        # The config of a plugin.
        sig do
          params(
            args: DockerEngineRuby::Plugin::Config::Args::OrHash,
            description: String,
            documentation: String,
            entrypoint: T::Array[String],
            env: T::Array[DockerEngineRuby::Plugin::Config::Env::OrHash],
            interface: DockerEngineRuby::Plugin::Config::Interface::OrHash,
            ipc_host: T::Boolean,
            linux: DockerEngineRuby::Plugin::Config::Linux::OrHash,
            mounts: T::Array[DockerEngineRuby::Plugin::Config::Mount::OrHash],
            network: DockerEngineRuby::Plugin::Config::Network::OrHash,
            pid_host: T::Boolean,
            propagated_mount: String,
            work_dir: String,
            rootfs: DockerEngineRuby::Plugin::Config::Rootfs::OrHash,
            user: DockerEngineRuby::Plugin::Config::User::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          args:,
          description:,
          documentation:,
          entrypoint:,
          env:,
          # The interface between Docker and the plugin
          interface:,
          ipc_host:,
          linux:,
          mounts:,
          network:,
          pid_host:,
          propagated_mount:,
          work_dir:,
          rootfs: nil,
          user: nil
        )
        end

        sig do
          override.returns(
            {
              args: DockerEngineRuby::Plugin::Config::Args,
              description: String,
              documentation: String,
              entrypoint: T::Array[String],
              env: T::Array[DockerEngineRuby::Plugin::Config::Env],
              interface: DockerEngineRuby::Plugin::Config::Interface,
              ipc_host: T::Boolean,
              linux: DockerEngineRuby::Plugin::Config::Linux,
              mounts: T::Array[DockerEngineRuby::Plugin::Config::Mount],
              network: DockerEngineRuby::Plugin::Config::Network,
              pid_host: T::Boolean,
              propagated_mount: String,
              work_dir: String,
              rootfs: DockerEngineRuby::Plugin::Config::Rootfs,
              user: DockerEngineRuby::Plugin::Config::User
            }
          )
        end
        def to_hash
        end

        class Args < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Args,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T::Array[String]) }
          attr_accessor :settable

          sig { returns(T::Array[String]) }
          attr_accessor :value

          sig do
            params(
              description: String,
              name: String,
              settable: T::Array[String],
              value: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(description:, name:, settable:, value:)
          end

          sig do
            override.returns(
              {
                description: String,
                name: String,
                settable: T::Array[String],
                value: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end

        class Env < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Env,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T::Array[String]) }
          attr_accessor :settable

          sig { returns(String) }
          attr_accessor :value

          sig do
            params(
              description: String,
              name: String,
              settable: T::Array[String],
              value: String
            ).returns(T.attached_class)
          end
          def self.new(description:, name:, settable:, value:)
          end

          sig do
            override.returns(
              {
                description: String,
                name: String,
                settable: T::Array[String],
                value: String
              }
            )
          end
          def to_hash
          end
        end

        class Interface < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Interface,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :socket

          sig { returns(T::Array[String]) }
          attr_accessor :types

          # Protocol to use for clients connecting to the plugin.
          sig do
            returns(
              T.nilable(
                DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )
            )
          end
          attr_reader :protocol_scheme

          sig do
            params(
              protocol_scheme:
                DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::OrSymbol
            ).void
          end
          attr_writer :protocol_scheme

          # The interface between Docker and the plugin
          sig do
            params(
              socket: String,
              types: T::Array[String],
              protocol_scheme:
                DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            socket:,
            types:,
            # Protocol to use for clients connecting to the plugin.
            protocol_scheme: nil
          )
          end

          sig do
            override.returns(
              {
                socket: String,
                types: T::Array[String],
                protocol_scheme:
                  DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Protocol to use for clients connecting to the plugin.
          module ProtocolScheme
            extend DockerEngineRuby::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMPTY =
              T.let(
                :"",
                DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )
            MOBY_PLUGINS_HTTP_V1 =
              T.let(
                :"moby.plugins.http/v1",
                DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Linux < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Linux,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :allow_all_devices

          sig { returns(T::Array[String]) }
          attr_accessor :capabilities

          sig do
            returns(T::Array[DockerEngineRuby::Plugin::Config::Linux::Device])
          end
          attr_accessor :devices

          sig do
            params(
              allow_all_devices: T::Boolean,
              capabilities: T::Array[String],
              devices:
                T::Array[
                  DockerEngineRuby::Plugin::Config::Linux::Device::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(allow_all_devices:, capabilities:, devices:)
          end

          sig do
            override.returns(
              {
                allow_all_devices: T::Boolean,
                capabilities: T::Array[String],
                devices:
                  T::Array[DockerEngineRuby::Plugin::Config::Linux::Device]
              }
            )
          end
          def to_hash
          end

          class Device < DockerEngineRuby::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineRuby::Plugin::Config::Linux::Device,
                  DockerEngineRuby::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :description

            sig { returns(String) }
            attr_accessor :name

            sig { returns(String) }
            attr_accessor :path

            sig { returns(T::Array[String]) }
            attr_accessor :settable

            sig do
              params(
                description: String,
                name: String,
                path: String,
                settable: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(description:, name:, path:, settable:)
            end

            sig do
              override.returns(
                {
                  description: String,
                  name: String,
                  path: String,
                  settable: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Mount,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :destination

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T::Array[String]) }
          attr_accessor :options

          sig { returns(T::Array[String]) }
          attr_accessor :settable

          sig { returns(String) }
          attr_accessor :source

          sig { returns(String) }
          attr_accessor :type

          sig do
            params(
              description: String,
              destination: String,
              name: String,
              options: T::Array[String],
              settable: T::Array[String],
              source: String,
              type: String
            ).returns(T.attached_class)
          end
          def self.new(
            description:,
            destination:,
            name:,
            options:,
            settable:,
            source:,
            type:
          )
          end

          sig do
            override.returns(
              {
                description: String,
                destination: String,
                name: String,
                options: T::Array[String],
                settable: T::Array[String],
                source: String,
                type: String
              }
            )
          end
          def to_hash
          end
        end

        class Network < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Network,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :type

          sig { params(type: String).returns(T.attached_class) }
          def self.new(type:)
          end

          sig { override.returns({ type: String }) }
          def to_hash
          end
        end

        class Rootfs < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::Rootfs,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :diff_ids

          sig { params(diff_ids: T::Array[String]).void }
          attr_writer :diff_ids

          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig do
            params(diff_ids: T::Array[String], type: String).returns(
              T.attached_class
            )
          end
          def self.new(diff_ids: nil, type: nil)
          end

          sig { override.returns({ diff_ids: T::Array[String], type: String }) }
          def to_hash
          end
        end

        class User < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Config::User,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :gid

          sig { params(gid: Integer).void }
          attr_writer :gid

          sig { returns(T.nilable(Integer)) }
          attr_reader :uid

          sig { params(uid: Integer).void }
          attr_writer :uid

          sig { params(gid: Integer, uid: Integer).returns(T.attached_class) }
          def self.new(gid: nil, uid: nil)
          end

          sig { override.returns({ gid: Integer, uid: Integer }) }
          def to_hash
          end
        end
      end

      class Settings < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::Plugin::Settings,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T::Array[String]) }
        attr_accessor :args

        sig { returns(T::Array[DockerEngineRuby::Plugin::Settings::Device]) }
        attr_accessor :devices

        sig { returns(T::Array[String]) }
        attr_accessor :env

        sig { returns(T::Array[DockerEngineRuby::Plugin::Settings::Mount]) }
        attr_accessor :mounts

        # user-configurable settings for the plugin.
        sig do
          params(
            args: T::Array[String],
            devices:
              T::Array[DockerEngineRuby::Plugin::Settings::Device::OrHash],
            env: T::Array[String],
            mounts: T::Array[DockerEngineRuby::Plugin::Settings::Mount::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(args:, devices:, env:, mounts:)
        end

        sig do
          override.returns(
            {
              args: T::Array[String],
              devices: T::Array[DockerEngineRuby::Plugin::Settings::Device],
              env: T::Array[String],
              mounts: T::Array[DockerEngineRuby::Plugin::Settings::Mount]
            }
          )
        end
        def to_hash
        end

        class Device < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Settings::Device,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :name

          sig { returns(String) }
          attr_accessor :path

          sig { returns(T::Array[String]) }
          attr_accessor :settable

          sig do
            params(
              description: String,
              name: String,
              path: String,
              settable: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(description:, name:, path:, settable:)
          end

          sig do
            override.returns(
              {
                description: String,
                name: String,
                path: String,
                settable: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::Plugin::Settings::Mount,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :destination

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T::Array[String]) }
          attr_accessor :options

          sig { returns(T::Array[String]) }
          attr_accessor :settable

          sig { returns(String) }
          attr_accessor :source

          sig { returns(String) }
          attr_accessor :type

          sig do
            params(
              description: String,
              destination: String,
              name: String,
              options: T::Array[String],
              settable: T::Array[String],
              source: String,
              type: String
            ).returns(T.attached_class)
          end
          def self.new(
            description:,
            destination:,
            name:,
            options:,
            settable:,
            source:,
            type:
          )
          end

          sig do
            override.returns(
              {
                description: String,
                destination: String,
                name: String,
                options: T::Array[String],
                settable: T::Array[String],
                source: String,
                type: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
