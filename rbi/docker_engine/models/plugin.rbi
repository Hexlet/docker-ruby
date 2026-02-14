# typed: strong

module DockerEngine
  module Models
    class Plugin < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::Plugin, DockerEngine::Internal::AnyHash)
        end

      # The config of a plugin.
      sig { returns(DockerEngine::Plugin::Config) }
      attr_reader :config

      sig { params(config: DockerEngine::Plugin::Config::OrHash).void }
      attr_writer :config

      # True if the plugin is running. False if the plugin is not running, only
      # installed.
      sig { returns(T::Boolean) }
      attr_accessor :enabled

      sig { returns(String) }
      attr_accessor :name

      # user-configurable settings for the plugin.
      sig { returns(DockerEngine::Plugin::Settings) }
      attr_reader :settings

      sig { params(settings: DockerEngine::Plugin::Settings::OrHash).void }
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
          config: DockerEngine::Plugin::Config::OrHash,
          enabled: T::Boolean,
          name: String,
          settings: DockerEngine::Plugin::Settings::OrHash,
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
            config: DockerEngine::Plugin::Config,
            enabled: T::Boolean,
            name: String,
            settings: DockerEngine::Plugin::Settings,
            id: String,
            plugin_reference: String
          }
        )
      end
      def to_hash
      end

      class Config < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(DockerEngine::Plugin::Config, DockerEngine::Internal::AnyHash)
          end

        sig { returns(DockerEngine::Plugin::Config::Args) }
        attr_reader :args

        sig { params(args: DockerEngine::Plugin::Config::Args::OrHash).void }
        attr_writer :args

        sig { returns(String) }
        attr_accessor :description

        sig { returns(String) }
        attr_accessor :documentation

        sig { returns(T::Array[String]) }
        attr_accessor :entrypoint

        sig { returns(T::Array[DockerEngine::Plugin::Config::Env]) }
        attr_accessor :env

        # The interface between Docker and the plugin
        sig { returns(DockerEngine::Plugin::Config::Interface) }
        attr_reader :interface

        sig do
          params(
            interface: DockerEngine::Plugin::Config::Interface::OrHash
          ).void
        end
        attr_writer :interface

        sig { returns(T::Boolean) }
        attr_accessor :ipc_host

        sig { returns(DockerEngine::Plugin::Config::Linux) }
        attr_reader :linux

        sig { params(linux: DockerEngine::Plugin::Config::Linux::OrHash).void }
        attr_writer :linux

        sig { returns(T::Array[DockerEngine::Plugin::Config::Mount]) }
        attr_accessor :mounts

        sig { returns(DockerEngine::Plugin::Config::Network) }
        attr_reader :network

        sig do
          params(network: DockerEngine::Plugin::Config::Network::OrHash).void
        end
        attr_writer :network

        sig { returns(T::Boolean) }
        attr_accessor :pid_host

        sig { returns(String) }
        attr_accessor :propagated_mount

        sig { returns(String) }
        attr_accessor :work_dir

        sig { returns(T.nilable(DockerEngine::Plugin::Config::Rootfs)) }
        attr_reader :rootfs

        sig do
          params(rootfs: DockerEngine::Plugin::Config::Rootfs::OrHash).void
        end
        attr_writer :rootfs

        sig { returns(T.nilable(DockerEngine::Plugin::Config::User)) }
        attr_reader :user

        sig { params(user: DockerEngine::Plugin::Config::User::OrHash).void }
        attr_writer :user

        # The config of a plugin.
        sig do
          params(
            args: DockerEngine::Plugin::Config::Args::OrHash,
            description: String,
            documentation: String,
            entrypoint: T::Array[String],
            env: T::Array[DockerEngine::Plugin::Config::Env::OrHash],
            interface: DockerEngine::Plugin::Config::Interface::OrHash,
            ipc_host: T::Boolean,
            linux: DockerEngine::Plugin::Config::Linux::OrHash,
            mounts: T::Array[DockerEngine::Plugin::Config::Mount::OrHash],
            network: DockerEngine::Plugin::Config::Network::OrHash,
            pid_host: T::Boolean,
            propagated_mount: String,
            work_dir: String,
            rootfs: DockerEngine::Plugin::Config::Rootfs::OrHash,
            user: DockerEngine::Plugin::Config::User::OrHash
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
              args: DockerEngine::Plugin::Config::Args,
              description: String,
              documentation: String,
              entrypoint: T::Array[String],
              env: T::Array[DockerEngine::Plugin::Config::Env],
              interface: DockerEngine::Plugin::Config::Interface,
              ipc_host: T::Boolean,
              linux: DockerEngine::Plugin::Config::Linux,
              mounts: T::Array[DockerEngine::Plugin::Config::Mount],
              network: DockerEngine::Plugin::Config::Network,
              pid_host: T::Boolean,
              propagated_mount: String,
              work_dir: String,
              rootfs: DockerEngine::Plugin::Config::Rootfs,
              user: DockerEngine::Plugin::Config::User
            }
          )
        end
        def to_hash
        end

        class Args < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Args,
                DockerEngine::Internal::AnyHash
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

        class Env < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Env,
                DockerEngine::Internal::AnyHash
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

        class Interface < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Interface,
                DockerEngine::Internal::AnyHash
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
                DockerEngine::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )
            )
          end
          attr_reader :protocol_scheme

          sig do
            params(
              protocol_scheme:
                DockerEngine::Plugin::Config::Interface::ProtocolScheme::OrSymbol
            ).void
          end
          attr_writer :protocol_scheme

          # The interface between Docker and the plugin
          sig do
            params(
              socket: String,
              types: T::Array[String],
              protocol_scheme:
                DockerEngine::Plugin::Config::Interface::ProtocolScheme::OrSymbol
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
                  DockerEngine::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Protocol to use for clients connecting to the plugin.
          module ProtocolScheme
            extend DockerEngine::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngine::Plugin::Config::Interface::ProtocolScheme
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMPTY =
              T.let(
                :"",
                DockerEngine::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )
            MOBY_PLUGINS_HTTP_V1 =
              T.let(
                :"moby.plugins.http/v1",
                DockerEngine::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngine::Plugin::Config::Interface::ProtocolScheme::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Linux < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Linux,
                DockerEngine::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :allow_all_devices

          sig { returns(T::Array[String]) }
          attr_accessor :capabilities

          sig { returns(T::Array[DockerEngine::Plugin::Config::Linux::Device]) }
          attr_accessor :devices

          sig do
            params(
              allow_all_devices: T::Boolean,
              capabilities: T::Array[String],
              devices:
                T::Array[DockerEngine::Plugin::Config::Linux::Device::OrHash]
            ).returns(T.attached_class)
          end
          def self.new(allow_all_devices:, capabilities:, devices:)
          end

          sig do
            override.returns(
              {
                allow_all_devices: T::Boolean,
                capabilities: T::Array[String],
                devices: T::Array[DockerEngine::Plugin::Config::Linux::Device]
              }
            )
          end
          def to_hash
          end

          class Device < DockerEngine::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngine::Plugin::Config::Linux::Device,
                  DockerEngine::Internal::AnyHash
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

        class Mount < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Mount,
                DockerEngine::Internal::AnyHash
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

        class Network < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Network,
                DockerEngine::Internal::AnyHash
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

        class Rootfs < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::Rootfs,
                DockerEngine::Internal::AnyHash
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

        class User < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Config::User,
                DockerEngine::Internal::AnyHash
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

      class Settings < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::Plugin::Settings,
              DockerEngine::Internal::AnyHash
            )
          end

        sig { returns(T::Array[String]) }
        attr_accessor :args

        sig { returns(T::Array[DockerEngine::Plugin::Settings::Device]) }
        attr_accessor :devices

        sig { returns(T::Array[String]) }
        attr_accessor :env

        sig { returns(T::Array[DockerEngine::Plugin::Settings::Mount]) }
        attr_accessor :mounts

        # user-configurable settings for the plugin.
        sig do
          params(
            args: T::Array[String],
            devices: T::Array[DockerEngine::Plugin::Settings::Device::OrHash],
            env: T::Array[String],
            mounts: T::Array[DockerEngine::Plugin::Settings::Mount::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(args:, devices:, env:, mounts:)
        end

        sig do
          override.returns(
            {
              args: T::Array[String],
              devices: T::Array[DockerEngine::Plugin::Settings::Device],
              env: T::Array[String],
              mounts: T::Array[DockerEngine::Plugin::Settings::Mount]
            }
          )
        end
        def to_hash
        end

        class Device < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Settings::Device,
                DockerEngine::Internal::AnyHash
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

        class Mount < DockerEngine::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngine::Plugin::Settings::Mount,
                DockerEngine::Internal::AnyHash
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
