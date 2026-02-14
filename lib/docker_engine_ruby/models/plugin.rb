# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#delete
    class Plugin < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute config
      #   The config of a plugin.
      #
      #   @return [DockerEngineRuby::Models::Plugin::Config]
      required :config, -> { DockerEngineRuby::Plugin::Config }, api_name: :Config

      # @!attribute enabled
      #   True if the plugin is running. False if the plugin is not running, only
      #   installed.
      #
      #   @return [Boolean]
      required :enabled, DockerEngineRuby::Internal::Type::Boolean, api_name: :Enabled

      # @!attribute name
      #
      #   @return [String]
      required :name, String, api_name: :Name

      # @!attribute settings
      #   user-configurable settings for the plugin.
      #
      #   @return [DockerEngineRuby::Models::Plugin::Settings]
      required :settings, -> { DockerEngineRuby::Plugin::Settings }, api_name: :Settings

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String, api_name: :Id

      # @!attribute plugin_reference
      #   plugin remote reference used to push/pull the plugin
      #
      #   @return [String, nil]
      optional :plugin_reference, String, api_name: :PluginReference

      # @!method initialize(config:, enabled:, name:, settings:, id: nil, plugin_reference: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::Plugin} for more details.
      #
      #   A plugin for the Engine API
      #
      #   @param config [DockerEngineRuby::Models::Plugin::Config] The config of a plugin.
      #
      #   @param enabled [Boolean] True if the plugin is running. False if the plugin is not running, only installe
      #
      #   @param name [String]
      #
      #   @param settings [DockerEngineRuby::Models::Plugin::Settings] user-configurable settings for the plugin.
      #
      #   @param id [String]
      #
      #   @param plugin_reference [String] plugin remote reference used to push/pull the plugin

      # @see DockerEngineRuby::Models::Plugin#config
      class Config < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute args
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::Args]
        required :args, -> { DockerEngineRuby::Plugin::Config::Args }, api_name: :Args

        # @!attribute description
        #
        #   @return [String]
        required :description, String, api_name: :Description

        # @!attribute documentation
        #
        #   @return [String]
        required :documentation, String, api_name: :Documentation

        # @!attribute entrypoint
        #
        #   @return [Array<String>]
        required :entrypoint, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Entrypoint

        # @!attribute env
        #
        #   @return [Array<DockerEngineRuby::Models::Plugin::Config::Env>]
        required :env,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin::Config::Env] },
                 api_name: :Env

        # @!attribute interface
        #   The interface between Docker and the plugin
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::Interface]
        required :interface, -> { DockerEngineRuby::Plugin::Config::Interface }, api_name: :Interface

        # @!attribute ipc_host
        #
        #   @return [Boolean]
        required :ipc_host, DockerEngineRuby::Internal::Type::Boolean, api_name: :IpcHost

        # @!attribute linux
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::Linux]
        required :linux, -> { DockerEngineRuby::Plugin::Config::Linux }, api_name: :Linux

        # @!attribute mounts
        #
        #   @return [Array<DockerEngineRuby::Models::Plugin::Config::Mount>]
        required :mounts,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin::Config::Mount] },
                 api_name: :Mounts

        # @!attribute network
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::Network]
        required :network, -> { DockerEngineRuby::Plugin::Config::Network }, api_name: :Network

        # @!attribute pid_host
        #
        #   @return [Boolean]
        required :pid_host, DockerEngineRuby::Internal::Type::Boolean, api_name: :PidHost

        # @!attribute propagated_mount
        #
        #   @return [String]
        required :propagated_mount, String, api_name: :PropagatedMount

        # @!attribute work_dir
        #
        #   @return [String]
        required :work_dir, String, api_name: :WorkDir

        # @!attribute rootfs
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::Rootfs, nil]
        optional :rootfs, -> { DockerEngineRuby::Plugin::Config::Rootfs }

        # @!attribute user
        #
        #   @return [DockerEngineRuby::Models::Plugin::Config::User, nil]
        optional :user, -> { DockerEngineRuby::Plugin::Config::User }, api_name: :User

        # @!method initialize(args:, description:, documentation:, entrypoint:, env:, interface:, ipc_host:, linux:, mounts:, network:, pid_host:, propagated_mount:, work_dir:, rootfs: nil, user: nil)
        #   The config of a plugin.
        #
        #   @param args [DockerEngineRuby::Models::Plugin::Config::Args]
        #
        #   @param description [String]
        #
        #   @param documentation [String]
        #
        #   @param entrypoint [Array<String>]
        #
        #   @param env [Array<DockerEngineRuby::Models::Plugin::Config::Env>]
        #
        #   @param interface [DockerEngineRuby::Models::Plugin::Config::Interface] The interface between Docker and the plugin
        #
        #   @param ipc_host [Boolean]
        #
        #   @param linux [DockerEngineRuby::Models::Plugin::Config::Linux]
        #
        #   @param mounts [Array<DockerEngineRuby::Models::Plugin::Config::Mount>]
        #
        #   @param network [DockerEngineRuby::Models::Plugin::Config::Network]
        #
        #   @param pid_host [Boolean]
        #
        #   @param propagated_mount [String]
        #
        #   @param work_dir [String]
        #
        #   @param rootfs [DockerEngineRuby::Models::Plugin::Config::Rootfs]
        #
        #   @param user [DockerEngineRuby::Models::Plugin::Config::User]

        # @see DockerEngineRuby::Models::Plugin::Config#args
        class Args < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String, api_name: :Description

          # @!attribute name
          #
          #   @return [String]
          required :name, String, api_name: :Name

          # @!attribute settable
          #
          #   @return [Array<String>]
          required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

          # @!attribute value
          #
          #   @return [Array<String>]
          required :value, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Value

          # @!method initialize(description:, name:, settable:, value:)
          #   @param description [String]
          #   @param name [String]
          #   @param settable [Array<String>]
          #   @param value [Array<String>]
        end

        class Env < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String, api_name: :Description

          # @!attribute name
          #
          #   @return [String]
          required :name, String, api_name: :Name

          # @!attribute settable
          #
          #   @return [Array<String>]
          required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

          # @!attribute value
          #
          #   @return [String]
          required :value, String, api_name: :Value

          # @!method initialize(description:, name:, settable:, value:)
          #   @param description [String]
          #   @param name [String]
          #   @param settable [Array<String>]
          #   @param value [String]
        end

        # @see DockerEngineRuby::Models::Plugin::Config#interface
        class Interface < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute socket
          #
          #   @return [String]
          required :socket, String, api_name: :Socket

          # @!attribute types
          #
          #   @return [Array<String>]
          required :types, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Types

          # @!attribute protocol_scheme
          #   Protocol to use for clients connecting to the plugin.
          #
          #   @return [Symbol, DockerEngineRuby::Models::Plugin::Config::Interface::ProtocolScheme, nil]
          optional :protocol_scheme,
                   enum: -> { DockerEngineRuby::Plugin::Config::Interface::ProtocolScheme },
                   api_name: :ProtocolScheme

          # @!method initialize(socket:, types:, protocol_scheme: nil)
          #   The interface between Docker and the plugin
          #
          #   @param socket [String]
          #
          #   @param types [Array<String>]
          #
          #   @param protocol_scheme [Symbol, DockerEngineRuby::Models::Plugin::Config::Interface::ProtocolScheme] Protocol to use for clients connecting to the plugin.

          # Protocol to use for clients connecting to the plugin.
          #
          # @see DockerEngineRuby::Models::Plugin::Config::Interface#protocol_scheme
          module ProtocolScheme
            extend DockerEngineRuby::Internal::Type::Enum

            EMPTY = :""
            MOBY_PLUGINS_HTTP_V1 = :"moby.plugins.http/v1"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see DockerEngineRuby::Models::Plugin::Config#linux
        class Linux < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute allow_all_devices
          #
          #   @return [Boolean]
          required :allow_all_devices, DockerEngineRuby::Internal::Type::Boolean, api_name: :AllowAllDevices

          # @!attribute capabilities
          #
          #   @return [Array<String>]
          required :capabilities, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Capabilities

          # @!attribute devices
          #
          #   @return [Array<DockerEngineRuby::Models::Plugin::Config::Linux::Device>]
          required :devices,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin::Config::Linux::Device]
                   },
                   api_name: :Devices

          # @!method initialize(allow_all_devices:, capabilities:, devices:)
          #   @param allow_all_devices [Boolean]
          #   @param capabilities [Array<String>]
          #   @param devices [Array<DockerEngineRuby::Models::Plugin::Config::Linux::Device>]

          class Device < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute description
            #
            #   @return [String]
            required :description, String, api_name: :Description

            # @!attribute name
            #
            #   @return [String]
            required :name, String, api_name: :Name

            # @!attribute path
            #
            #   @return [String]
            required :path, String, api_name: :Path

            # @!attribute settable
            #
            #   @return [Array<String>]
            required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

            # @!method initialize(description:, name:, path:, settable:)
            #   @param description [String]
            #   @param name [String]
            #   @param path [String]
            #   @param settable [Array<String>]
          end
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String, api_name: :Description

          # @!attribute destination
          #
          #   @return [String]
          required :destination, String, api_name: :Destination

          # @!attribute name
          #
          #   @return [String]
          required :name, String, api_name: :Name

          # @!attribute options
          #
          #   @return [Array<String>]
          required :options, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Options

          # @!attribute settable
          #
          #   @return [Array<String>]
          required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

          # @!attribute source
          #
          #   @return [String]
          required :source, String, api_name: :Source

          # @!attribute type
          #
          #   @return [String]
          required :type, String, api_name: :Type

          # @!method initialize(description:, destination:, name:, options:, settable:, source:, type:)
          #   @param description [String]
          #   @param destination [String]
          #   @param name [String]
          #   @param options [Array<String>]
          #   @param settable [Array<String>]
          #   @param source [String]
          #   @param type [String]
        end

        # @see DockerEngineRuby::Models::Plugin::Config#network
        class Network < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [String]
          required :type, String, api_name: :Type

          # @!method initialize(type:)
          #   @param type [String]
        end

        # @see DockerEngineRuby::Models::Plugin::Config#rootfs
        class Rootfs < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute diff_ids
          #
          #   @return [Array<String>, nil]
          optional :diff_ids, DockerEngineRuby::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [String, nil]
          optional :type, String

          # @!method initialize(diff_ids: nil, type: nil)
          #   @param diff_ids [Array<String>]
          #   @param type [String]
        end

        # @see DockerEngineRuby::Models::Plugin::Config#user
        class User < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute gid
          #
          #   @return [Integer, nil]
          optional :gid, Integer, api_name: :GID

          # @!attribute uid
          #
          #   @return [Integer, nil]
          optional :uid, Integer, api_name: :UID

          # @!method initialize(gid: nil, uid: nil)
          #   @param gid [Integer]
          #   @param uid [Integer]
        end
      end

      # @see DockerEngineRuby::Models::Plugin#settings
      class Settings < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute args
        #
        #   @return [Array<String>]
        required :args, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Args

        # @!attribute devices
        #
        #   @return [Array<DockerEngineRuby::Models::Plugin::Settings::Device>]
        required :devices,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin::Settings::Device] },
                 api_name: :Devices

        # @!attribute env
        #
        #   @return [Array<String>]
        required :env, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Env

        # @!attribute mounts
        #
        #   @return [Array<DockerEngineRuby::Models::Plugin::Settings::Mount>]
        required :mounts,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin::Settings::Mount] },
                 api_name: :Mounts

        # @!method initialize(args:, devices:, env:, mounts:)
        #   user-configurable settings for the plugin.
        #
        #   @param args [Array<String>]
        #   @param devices [Array<DockerEngineRuby::Models::Plugin::Settings::Device>]
        #   @param env [Array<String>]
        #   @param mounts [Array<DockerEngineRuby::Models::Plugin::Settings::Mount>]

        class Device < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String, api_name: :Description

          # @!attribute name
          #
          #   @return [String]
          required :name, String, api_name: :Name

          # @!attribute path
          #
          #   @return [String]
          required :path, String, api_name: :Path

          # @!attribute settable
          #
          #   @return [Array<String>]
          required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

          # @!method initialize(description:, name:, path:, settable:)
          #   @param description [String]
          #   @param name [String]
          #   @param path [String]
          #   @param settable [Array<String>]
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String]
          required :description, String, api_name: :Description

          # @!attribute destination
          #
          #   @return [String]
          required :destination, String, api_name: :Destination

          # @!attribute name
          #
          #   @return [String]
          required :name, String, api_name: :Name

          # @!attribute options
          #
          #   @return [Array<String>]
          required :options, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Options

          # @!attribute settable
          #
          #   @return [Array<String>]
          required :settable, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Settable

          # @!attribute source
          #
          #   @return [String]
          required :source, String, api_name: :Source

          # @!attribute type
          #
          #   @return [String]
          required :type, String, api_name: :Type

          # @!method initialize(description:, destination:, name:, options:, settable:, source:, type:)
          #   @param description [String]
          #   @param destination [String]
          #   @param name [String]
          #   @param options [Array<String>]
          #   @param settable [Array<String>]
          #   @param source [String]
          #   @param type [String]
        end
      end
    end
  end
end
