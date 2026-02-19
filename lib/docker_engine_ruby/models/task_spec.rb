# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class TaskSpec < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute container_spec
      #   Container spec for the service.
      #
      #   <p><br /></p>
      #
      #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
      #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
      #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec, nil]
      optional :container_spec, -> { DockerEngineRuby::TaskSpec::ContainerSpec }, api_name: :ContainerSpec

      # @!attribute force_update
      #   A counter that triggers an update even if no relevant parameters have been
      #   changed.
      #
      #   @return [Integer, nil]
      optional :force_update, Integer, api_name: :ForceUpdate

      # @!attribute log_driver
      #   Specifies the log driver to use for tasks created from this spec. If not
      #   present, the default one for the swarm will be used, finally falling back to the
      #   engine default if not specified.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::LogDriver, nil]
      optional :log_driver, -> { DockerEngineRuby::TaskSpec::LogDriver }, api_name: :LogDriver

      # @!attribute network_attachment_spec
      #   Read-only spec type for non-swarm containers attached to swarm overlay networks.
      #
      #   <p><br /></p>
      #
      #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
      #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
      #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::NetworkAttachmentSpec, nil]
      optional :network_attachment_spec,
               -> { DockerEngineRuby::TaskSpec::NetworkAttachmentSpec },
               api_name: :NetworkAttachmentSpec

      # @!attribute networks
      #   Specifies which networks the service should attach to.
      #
      #   @return [Array<DockerEngineRuby::Models::TaskSpec::Network>, nil]
      optional :networks,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::Network] },
               api_name: :Networks

      # @!attribute placement
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::Placement, nil]
      optional :placement, -> { DockerEngineRuby::TaskSpec::Placement }, api_name: :Placement

      # @!attribute plugin_spec
      #   Plugin spec for the service. _(Experimental release only.)_
      #
      #   <p><br /></p>
      #
      #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
      #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
      #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::PluginSpec, nil]
      optional :plugin_spec, -> { DockerEngineRuby::TaskSpec::PluginSpec }, api_name: :PluginSpec

      # @!attribute resources
      #   Resource requirements which apply to each individual container created as part
      #   of the service.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::Resources, nil]
      optional :resources, -> { DockerEngineRuby::TaskSpec::Resources }, api_name: :Resources

      # @!attribute restart_policy
      #   Specification for the restart policy which applies to containers created as part
      #   of this service.
      #
      #   @return [DockerEngineRuby::Models::TaskSpec::RestartPolicy, nil]
      optional :restart_policy, -> { DockerEngineRuby::TaskSpec::RestartPolicy }, api_name: :RestartPolicy

      # @!attribute runtime
      #   Runtime is the type of runtime specified for the task executor.
      #
      #   @return [String, nil]
      optional :runtime, String, api_name: :Runtime

      # @!method initialize(container_spec: nil, force_update: nil, log_driver: nil, network_attachment_spec: nil, networks: nil, placement: nil, plugin_spec: nil, resources: nil, restart_policy: nil, runtime: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::TaskSpec} for more details.
      #
      #   User modifiable task configuration.
      #
      #   @param container_spec [DockerEngineRuby::Models::TaskSpec::ContainerSpec] Container spec for the service.
      #
      #   @param force_update [Integer] A counter that triggers an update even if no relevant parameters have
      #
      #   @param log_driver [DockerEngineRuby::Models::TaskSpec::LogDriver] Specifies the log driver to use for tasks created from this spec. If
      #
      #   @param network_attachment_spec [DockerEngineRuby::Models::TaskSpec::NetworkAttachmentSpec] Read-only spec type for non-swarm containers attached to swarm overlay
      #
      #   @param networks [Array<DockerEngineRuby::Models::TaskSpec::Network>] Specifies which networks the service should attach to.
      #
      #   @param placement [DockerEngineRuby::Models::TaskSpec::Placement]
      #
      #   @param plugin_spec [DockerEngineRuby::Models::TaskSpec::PluginSpec] Plugin spec for the service. _(Experimental release only.)_
      #
      #   @param resources [DockerEngineRuby::Models::TaskSpec::Resources] Resource requirements which apply to each individual container created
      #
      #   @param restart_policy [DockerEngineRuby::Models::TaskSpec::RestartPolicy] Specification for the restart policy which applies to containers
      #
      #   @param runtime [String] Runtime is the type of runtime specified for the task executor.

      # @see DockerEngineRuby::Models::TaskSpec#container_spec
      class ContainerSpec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute args
        #
        #   @return [Array<String>, nil]
        optional :args, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Args

        # @!attribute capability_add
        #
        #   @return [Array<String>, nil]
        optional :capability_add, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :CapabilityAdd

        # @!attribute capability_drop
        #
        #   @return [Array<String>, nil]
        optional :capability_drop,
                 DockerEngineRuby::Internal::Type::ArrayOf[String],
                 api_name: :CapabilityDrop

        # @!attribute command
        #
        #   @return [Array<String>, nil]
        optional :command, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Command

        # @!attribute configs
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Config>, nil]
        optional :configs,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::ContainerSpec::Config]
                 },
                 api_name: :Configs

        # @!attribute dir
        #
        #   @return [String, nil]
        optional :dir, String, api_name: :Dir

        # @!attribute dns_config
        #
        #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::DNSConfig, nil]
        optional :dns_config,
                 -> {
                   DockerEngineRuby::TaskSpec::ContainerSpec::DNSConfig
                 },
                 api_name: :DNSConfig

        # @!attribute env
        #
        #   @return [Array<String>, nil]
        optional :env, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Env

        # @!attribute groups
        #
        #   @return [Array<String>, nil]
        optional :groups, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Groups

        # @!attribute health_check
        #   A test to perform to check that the container is healthy. Healthcheck commands
        #   should be side-effect free.
        #
        #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::HealthCheck, nil]
        optional :health_check,
                 -> { DockerEngineRuby::TaskSpec::ContainerSpec::HealthCheck },
                 api_name: :HealthCheck

        # @!attribute hostname
        #
        #   @return [String, nil]
        optional :hostname, String, api_name: :Hostname

        # @!attribute hosts
        #
        #   @return [Array<String>, nil]
        optional :hosts, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Hosts

        # @!attribute image
        #
        #   @return [String, nil]
        optional :image, String, api_name: :Image

        # @!attribute init
        #
        #   @return [Boolean, nil]
        optional :init, DockerEngineRuby::Internal::Type::Boolean, api_name: :Init, nil?: true

        # @!attribute isolation
        #
        #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Isolation, nil]
        optional :isolation,
                 enum: -> { DockerEngineRuby::TaskSpec::ContainerSpec::Isolation },
                 api_name: :Isolation

        # @!attribute labels
        #
        #   @return [Object, nil]
        optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

        # @!attribute mounts
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount>, nil]
        optional :mounts,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::ContainerSpec::Mount]
                 },
                 api_name: :Mounts

        # @!attribute oom_score_adj
        #
        #   @return [Integer, nil]
        optional :oom_score_adj, Integer, api_name: :OomScoreAdj

        # @!attribute open_stdin
        #
        #   @return [Boolean, nil]
        optional :open_stdin, DockerEngineRuby::Internal::Type::Boolean, api_name: :OpenStdin

        # @!attribute privileges
        #
        #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges, nil]
        optional :privileges,
                 -> {
                   DockerEngineRuby::TaskSpec::ContainerSpec::Privileges
                 },
                 api_name: :Privileges

        # @!attribute read_only
        #
        #   @return [Boolean, nil]
        optional :read_only, DockerEngineRuby::Internal::Type::Boolean, api_name: :ReadOnly

        # @!attribute secrets
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Secret>, nil]
        optional :secrets,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::ContainerSpec::Secret]
                 },
                 api_name: :Secrets

        # @!attribute stop_grace_period
        #
        #   @return [Integer, nil]
        optional :stop_grace_period, Integer, api_name: :StopGracePeriod

        # @!attribute stop_signal
        #
        #   @return [String, nil]
        optional :stop_signal, String, api_name: :StopSignal

        # @!attribute sysctls
        #
        #   @return [Object, nil]
        optional :sysctls, DockerEngineRuby::Internal::Type::Unknown, api_name: :Sysctls

        # @!attribute tty
        #
        #   @return [Boolean, nil]
        optional :tty, DockerEngineRuby::Internal::Type::Boolean, api_name: :TTY

        # @!attribute ulimits
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Ulimit>, nil]
        optional :ulimits,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::ContainerSpec::Ulimit]
                 },
                 api_name: :Ulimits

        # @!attribute user
        #
        #   @return [String, nil]
        optional :user, String, api_name: :User

        # @!method initialize(args: nil, capability_add: nil, capability_drop: nil, command: nil, configs: nil, dir: nil, dns_config: nil, env: nil, groups: nil, health_check: nil, hostname: nil, hosts: nil, image: nil, init: nil, isolation: nil, labels: nil, mounts: nil, oom_score_adj: nil, open_stdin: nil, privileges: nil, read_only: nil, secrets: nil, stop_grace_period: nil, stop_signal: nil, sysctls: nil, tty: nil, ulimits: nil, user: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::TaskSpec::ContainerSpec} for more details.
        #
        #   Container spec for the service.
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @param args [Array<String>]
        #
        #   @param capability_add [Array<String>]
        #
        #   @param capability_drop [Array<String>]
        #
        #   @param command [Array<String>]
        #
        #   @param configs [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Config>]
        #
        #   @param dir [String]
        #
        #   @param dns_config [DockerEngineRuby::Models::TaskSpec::ContainerSpec::DNSConfig]
        #
        #   @param env [Array<String>]
        #
        #   @param groups [Array<String>]
        #
        #   @param health_check [DockerEngineRuby::Models::TaskSpec::ContainerSpec::HealthCheck] A test to perform to check that the container is healthy.
        #
        #   @param hostname [String]
        #
        #   @param hosts [Array<String>]
        #
        #   @param image [String]
        #
        #   @param init [Boolean, nil]
        #
        #   @param isolation [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Isolation]
        #
        #   @param labels [Object]
        #
        #   @param mounts [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount>]
        #
        #   @param oom_score_adj [Integer]
        #
        #   @param open_stdin [Boolean]
        #
        #   @param privileges [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges]
        #
        #   @param read_only [Boolean]
        #
        #   @param secrets [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Secret>]
        #
        #   @param stop_grace_period [Integer]
        #
        #   @param stop_signal [String]
        #
        #   @param sysctls [Object]
        #
        #   @param tty [Boolean]
        #
        #   @param ulimits [Array<DockerEngineRuby::Models::TaskSpec::ContainerSpec::Ulimit>]
        #
        #   @param user [String]

        class Config < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute config_id
          #
          #   @return [String, nil]
          optional :config_id, String, api_name: :ConfigID

          # @!attribute config_name
          #
          #   @return [String, nil]
          optional :config_name, String, api_name: :ConfigName

          # @!attribute file
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Config::File, nil]
          optional :file, -> { DockerEngineRuby::TaskSpec::ContainerSpec::Config::File }, api_name: :File

          # @!attribute runtime
          #
          #   @return [Object, nil]
          optional :runtime, DockerEngineRuby::Internal::Type::Unknown, api_name: :Runtime

          # @!method initialize(config_id: nil, config_name: nil, file: nil, runtime: nil)
          #   @param config_id [String]
          #   @param config_name [String]
          #   @param file [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Config::File]
          #   @param runtime [Object]

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Config#file
          class File < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute gid
            #
            #   @return [String, nil]
            optional :gid, String, api_name: :GID

            # @!attribute mode
            #
            #   @return [Integer, nil]
            optional :mode, Integer, api_name: :Mode

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute uid
            #
            #   @return [String, nil]
            optional :uid, String, api_name: :UID

            # @!method initialize(gid: nil, mode: nil, name: nil, uid: nil)
            #   @param gid [String]
            #   @param mode [Integer]
            #   @param name [String]
            #   @param uid [String]
          end
        end

        # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec#dns_config
        class DNSConfig < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute nameservers
          #
          #   @return [Array<String>, nil]
          optional :nameservers, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Nameservers

          # @!attribute options
          #
          #   @return [Array<String>, nil]
          optional :options, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Options

          # @!attribute search
          #
          #   @return [Array<String>, nil]
          optional :search, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Search

          # @!method initialize(nameservers: nil, options: nil, search: nil)
          #   @param nameservers [Array<String>]
          #   @param options [Array<String>]
          #   @param search [Array<String>]
        end

        # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec#health_check
        class HealthCheck < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute interval
          #   The time to wait between checks in nanoseconds. It should be 0 or at least
          #   1000000 (1 ms). 0 means inherit.
          #
          #   @return [Integer, nil]
          optional :interval, Integer, api_name: :Interval

          # @!attribute retries
          #   The number of consecutive failures needed to consider a container as unhealthy.
          #   0 means inherit.
          #
          #   @return [Integer, nil]
          optional :retries, Integer, api_name: :Retries

          # @!attribute start_interval
          #   The time to wait between checks in nanoseconds during the start period. It
          #   should be 0 or at least 1000000 (1 ms). 0 means inherit.
          #
          #   @return [Integer, nil]
          optional :start_interval, Integer, api_name: :StartInterval

          # @!attribute start_period
          #   Start period for the container to initialize before starting health-retries
          #   countdown in nanoseconds. It should be 0 or at least 1000000 (1 ms). 0 means
          #   inherit.
          #
          #   @return [Integer, nil]
          optional :start_period, Integer, api_name: :StartPeriod

          # @!attribute test_
          #   The test to perform. Possible values are:
          #
          #   - `[]` inherit healthcheck from image or parent image
          #   - `["NONE"]` disable healthcheck
          #   - `["CMD", args...]` exec arguments directly
          #   - `["CMD-SHELL", command]` run command with system's default shell
          #
          #   A non-zero exit code indicates a failed healthcheck:
          #
          #   - `0` healthy
          #   - `1` unhealthy
          #   - `2` reserved (treated as unhealthy)
          #   - other values: error running probe
          #
          #   @return [Array<String>, nil]
          optional :test_, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Test

          # @!attribute timeout
          #   The time to wait before considering the check to have hung. It should be 0 or at
          #   least 1000000 (1 ms). 0 means inherit.
          #
          #   If the health check command does not complete within this timeout, the check is
          #   considered failed and the health check process is forcibly terminated without a
          #   graceful shutdown.
          #
          #   @return [Integer, nil]
          optional :timeout, Integer, api_name: :Timeout

          # @!method initialize(interval: nil, retries: nil, start_interval: nil, start_period: nil, test_: nil, timeout: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::TaskSpec::ContainerSpec::HealthCheck} for more
          #   details.
          #
          #   A test to perform to check that the container is healthy. Healthcheck commands
          #   should be side-effect free.
          #
          #   @param interval [Integer] The time to wait between checks in nanoseconds. It should be 0 or at
          #
          #   @param retries [Integer] The number of consecutive failures needed to consider a container as
          #
          #   @param start_interval [Integer] The time to wait between checks in nanoseconds during the start period.
          #
          #   @param start_period [Integer] Start period for the container to initialize before starting
          #
          #   @param test_ [Array<String>] The test to perform. Possible values are:
          #
          #   @param timeout [Integer] The time to wait before considering the check to have hung. It should
        end

        # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec#isolation
        module Isolation
          extend DockerEngineRuby::Internal::Type::Enum

          DEFAULT = :default
          PROCESS = :process
          HYPERV = :hyperv
          EMPTY = :""

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Mount < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute bind_options
          #   Optional configuration for the `bind` type.
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::BindOptions, nil]
          optional :bind_options,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions },
                   api_name: :BindOptions

          # @!attribute consistency
          #   The consistency requirement for the mount: `default`, `consistent`, `cached`, or
          #   `delegated`.
          #
          #   @return [String, nil]
          optional :consistency, String, api_name: :Consistency

          # @!attribute image_options
          #   Optional configuration for the `image` type.
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::ImageOptions, nil]
          optional :image_options,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::ImageOptions },
                   api_name: :ImageOptions

          # @!attribute read_only
          #   Whether the mount should be read-only.
          #
          #   @return [Boolean, nil]
          optional :read_only, DockerEngineRuby::Internal::Type::Boolean, api_name: :ReadOnly

          # @!attribute source
          #   Mount source (e.g. a volume name, a host path). The source cannot be specified
          #   when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
          #   the `CreateMountpoint` must be set to `true` to create the source path on the
          #   host if missing.
          #
          #   For `Type=npipe`, the pipe must exist prior to creating the container.
          #
          #   @return [String, nil]
          optional :source, String, api_name: :Source

          # @!attribute target
          #   Container path.
          #
          #   @return [String, nil]
          optional :target, String, api_name: :Target

          # @!attribute tmpfs_options
          #   Optional configuration for the `tmpfs` type.
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::TmpfsOptions, nil]
          optional :tmpfs_options,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::TmpfsOptions },
                   api_name: :TmpfsOptions

          # @!attribute type
          #   The mount type. Available types:
          #
          #   - `bind` a mount of a file or directory from the host into the container.
          #   - `cluster` a Swarm cluster volume.
          #   - `image` an OCI image.
          #   - `npipe` a named pipe from the host into the container.
          #   - `tmpfs` a `tmpfs`.
          #   - `volume` a docker volume with the given `Name`.
          #
          #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::Type, nil]
          optional :type, enum: -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::Type }, api_name: :Type

          # @!attribute volume_options
          #   Optional configuration for the `volume` type.
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::VolumeOptions, nil]
          optional :volume_options,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions },
                   api_name: :VolumeOptions

          # @!method initialize(bind_options: nil, consistency: nil, image_options: nil, read_only: nil, source: nil, target: nil, tmpfs_options: nil, type: nil, volume_options: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount} for more details.
          #
          #   @param bind_options [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::BindOptions] Optional configuration for the `bind` type.
          #
          #   @param consistency [String] The consistency requirement for the mount: `default`, `consistent`, `cached`, or
          #
          #   @param image_options [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::ImageOptions] Optional configuration for the `image` type.
          #
          #   @param read_only [Boolean] Whether the mount should be read-only.
          #
          #   @param source [String] Mount source (e.g. a volume name, a host path). The source cannot be
          #
          #   @param target [String] Container path.
          #
          #   @param tmpfs_options [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::TmpfsOptions] Optional configuration for the `tmpfs` type.
          #
          #   @param type [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::Type] The mount type. Available types:
          #
          #   @param volume_options [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::VolumeOptions] Optional configuration for the `volume` type.

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount#bind_options
          class BindOptions < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute create_mountpoint
            #
            #   @return [Boolean, nil]
            optional :create_mountpoint,
                     DockerEngineRuby::Internal::Type::Boolean,
                     api_name: :CreateMountpoint

            # @!attribute non_recursive
            #
            #   @return [Boolean, nil]
            optional :non_recursive, DockerEngineRuby::Internal::Type::Boolean, api_name: :NonRecursive

            # @!attribute propagation
            #
            #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation, nil]
            optional :propagation,
                     enum: -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation },
                     api_name: :Propagation

            # @!attribute read_only_force_recursive
            #
            #   @return [Boolean, nil]
            optional :read_only_force_recursive,
                     DockerEngineRuby::Internal::Type::Boolean,
                     api_name: :ReadOnlyForceRecursive

            # @!attribute read_only_non_recursive
            #
            #   @return [Boolean, nil]
            optional :read_only_non_recursive,
                     DockerEngineRuby::Internal::Type::Boolean,
                     api_name: :ReadOnlyNonRecursive

            # @!method initialize(create_mountpoint: nil, non_recursive: nil, propagation: nil, read_only_force_recursive: nil, read_only_non_recursive: nil)
            #   Optional configuration for the `bind` type.
            #
            #   @param create_mountpoint [Boolean]
            #   @param non_recursive [Boolean]
            #   @param propagation [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::BindOptions::Propagation]
            #   @param read_only_force_recursive [Boolean]
            #   @param read_only_non_recursive [Boolean]

            # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::BindOptions#propagation
            module Propagation
              extend DockerEngineRuby::Internal::Type::Enum

              PRIVATE = :private
              RPRIVATE = :rprivate
              SHARED = :shared
              RSHARED = :rshared
              SLAVE = :slave
              RSLAVE = :rslave

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount#image_options
          class ImageOptions < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute subpath
            #
            #   @return [String, nil]
            optional :subpath, String, api_name: :Subpath

            # @!method initialize(subpath: nil)
            #   Optional configuration for the `image` type.
            #
            #   @param subpath [String]
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount#tmpfs_options
          class TmpfsOptions < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute mode
            #
            #   @return [Integer, nil]
            optional :mode, Integer, api_name: :Mode

            # @!attribute options
            #
            #   @return [Array<Array<String>>, nil]
            optional :options,
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::ArrayOf[String]],
                     api_name: :Options

            # @!attribute size_bytes
            #
            #   @return [Integer, nil]
            optional :size_bytes, Integer, api_name: :SizeBytes

            # @!method initialize(mode: nil, options: nil, size_bytes: nil)
            #   Optional configuration for the `tmpfs` type.
            #
            #   @param mode [Integer]
            #   @param options [Array<Array<String>>]
            #   @param size_bytes [Integer]
          end

          # The mount type. Available types:
          #
          # - `bind` a mount of a file or directory from the host into the container.
          # - `cluster` a Swarm cluster volume.
          # - `image` an OCI image.
          # - `npipe` a named pipe from the host into the container.
          # - `tmpfs` a `tmpfs`.
          # - `volume` a docker volume with the given `Name`.
          #
          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount#type
          module Type
            extend DockerEngineRuby::Internal::Type::Enum

            BIND = :bind
            CLUSTER = :cluster
            IMAGE = :image
            NPIPE = :npipe
            TMPFS = :tmpfs
            VOLUME = :volume

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount#volume_options
          class VolumeOptions < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute driver_config
            #
            #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig, nil]
            optional :driver_config,
                     -> { DockerEngineRuby::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig },
                     api_name: :DriverConfig

            # @!attribute labels
            #
            #   @return [Object, nil]
            optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

            # @!attribute no_copy
            #
            #   @return [Boolean, nil]
            optional :no_copy, DockerEngineRuby::Internal::Type::Boolean, api_name: :NoCopy

            # @!attribute subpath
            #
            #   @return [String, nil]
            optional :subpath, String, api_name: :Subpath

            # @!method initialize(driver_config: nil, labels: nil, no_copy: nil, subpath: nil)
            #   Optional configuration for the `volume` type.
            #
            #   @param driver_config [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::VolumeOptions::DriverConfig]
            #   @param labels [Object]
            #   @param no_copy [Boolean]
            #   @param subpath [String]

            # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Mount::VolumeOptions#driver_config
            class DriverConfig < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String, api_name: :Name

              # @!attribute options
              #
              #   @return [Object, nil]
              optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

              # @!method initialize(name: nil, options: nil)
              #   @param name [String]
              #   @param options [Object]
            end
          end
        end

        # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec#privileges
        class Privileges < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute app_armor
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::AppArmor, nil]
          optional :app_armor,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor },
                   api_name: :AppArmor

          # @!attribute credential_spec
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::CredentialSpec, nil]
          optional :credential_spec,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::CredentialSpec },
                   api_name: :CredentialSpec

          # @!attribute no_new_privileges
          #
          #   @return [Boolean, nil]
          optional :no_new_privileges, DockerEngineRuby::Internal::Type::Boolean, api_name: :NoNewPrivileges

          # @!attribute seccomp
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::Seccomp, nil]
          optional :seccomp,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp },
                   api_name: :Seccomp

          # @!attribute se_linux_context
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::SeLinuxContext, nil]
          optional :se_linux_context,
                   -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::SeLinuxContext },
                   api_name: :SELinuxContext

          # @!method initialize(app_armor: nil, credential_spec: nil, no_new_privileges: nil, seccomp: nil, se_linux_context: nil)
          #   @param app_armor [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::AppArmor]
          #   @param credential_spec [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::CredentialSpec]
          #   @param no_new_privileges [Boolean]
          #   @param seccomp [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::Seccomp]
          #   @param se_linux_context [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::SeLinuxContext]

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges#app_armor
          class AppArmor < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute mode
            #
            #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode, nil]
            optional :mode,
                     enum: -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode },
                     api_name: :Mode

            # @!method initialize(mode: nil)
            #   @param mode [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::AppArmor::Mode]

            # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::AppArmor#mode
            module Mode
              extend DockerEngineRuby::Internal::Type::Enum

              DEFAULT = :default
              DISABLED = :disabled

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges#credential_spec
          class CredentialSpec < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute config
            #
            #   @return [String, nil]
            optional :config, String, api_name: :Config

            # @!attribute file
            #
            #   @return [String, nil]
            optional :file, String, api_name: :File

            # @!attribute registry
            #
            #   @return [String, nil]
            optional :registry, String, api_name: :Registry

            # @!method initialize(config: nil, file: nil, registry: nil)
            #   @param config [String]
            #   @param file [String]
            #   @param registry [String]
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges#seccomp
          class Seccomp < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute mode
            #
            #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode, nil]
            optional :mode,
                     enum: -> { DockerEngineRuby::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode },
                     api_name: :Mode

            # @!attribute profile
            #
            #   @return [String, nil]
            optional :profile, String, api_name: :Profile

            # @!method initialize(mode: nil, profile: nil)
            #   @param mode [Symbol, DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::Seccomp::Mode]
            #   @param profile [String]

            # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges::Seccomp#mode
            module Mode
              extend DockerEngineRuby::Internal::Type::Enum

              DEFAULT = :default
              UNCONFINED = :unconfined
              CUSTOM = :custom

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Privileges#se_linux_context
          class SeLinuxContext < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute disable
            #
            #   @return [Boolean, nil]
            optional :disable, DockerEngineRuby::Internal::Type::Boolean, api_name: :Disable

            # @!attribute level
            #
            #   @return [String, nil]
            optional :level, String, api_name: :Level

            # @!attribute role
            #
            #   @return [String, nil]
            optional :role, String, api_name: :Role

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, api_name: :Type

            # @!attribute user
            #
            #   @return [String, nil]
            optional :user, String, api_name: :User

            # @!method initialize(disable: nil, level: nil, role: nil, type: nil, user: nil)
            #   @param disable [Boolean]
            #   @param level [String]
            #   @param role [String]
            #   @param type [String]
            #   @param user [String]
          end
        end

        class Secret < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute file
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Secret::File, nil]
          optional :file, -> { DockerEngineRuby::TaskSpec::ContainerSpec::Secret::File }, api_name: :File

          # @!attribute secret_id
          #
          #   @return [String, nil]
          optional :secret_id, String, api_name: :SecretID

          # @!attribute secret_name
          #
          #   @return [String, nil]
          optional :secret_name, String, api_name: :SecretName

          # @!method initialize(file: nil, secret_id: nil, secret_name: nil)
          #   @param file [DockerEngineRuby::Models::TaskSpec::ContainerSpec::Secret::File]
          #   @param secret_id [String]
          #   @param secret_name [String]

          # @see DockerEngineRuby::Models::TaskSpec::ContainerSpec::Secret#file
          class File < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute gid
            #
            #   @return [String, nil]
            optional :gid, String, api_name: :GID

            # @!attribute mode
            #
            #   @return [Integer, nil]
            optional :mode, Integer, api_name: :Mode

            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute uid
            #
            #   @return [String, nil]
            optional :uid, String, api_name: :UID

            # @!method initialize(gid: nil, mode: nil, name: nil, uid: nil)
            #   @param gid [String]
            #   @param mode [Integer]
            #   @param name [String]
            #   @param uid [String]
          end
        end

        class Ulimit < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute hard
          #
          #   @return [Integer, nil]
          optional :hard, Integer, api_name: :Hard

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute soft
          #
          #   @return [Integer, nil]
          optional :soft, Integer, api_name: :Soft

          # @!method initialize(hard: nil, name: nil, soft: nil)
          #   @param hard [Integer]
          #   @param name [String]
          #   @param soft [Integer]
        end
      end

      # @see DockerEngineRuby::Models::TaskSpec#log_driver
      class LogDriver < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String, api_name: :Name

        # @!attribute options
        #
        #   @return [Object, nil]
        optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

        # @!method initialize(name: nil, options: nil)
        #   Specifies the log driver to use for tasks created from this spec. If not
        #   present, the default one for the swarm will be used, finally falling back to the
        #   engine default if not specified.
        #
        #   @param name [String]
        #   @param options [Object]
      end

      # @see DockerEngineRuby::Models::TaskSpec#network_attachment_spec
      class NetworkAttachmentSpec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute container_id
        #
        #   @return [String, nil]
        optional :container_id, String, api_name: :ContainerID

        # @!method initialize(container_id: nil)
        #   Read-only spec type for non-swarm containers attached to swarm overlay networks.
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @param container_id [String]
      end

      class Network < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute aliases
        #   Discoverable alternate names for the service on this network.
        #
        #   @return [Array<String>, nil]
        optional :aliases, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Aliases

        # @!attribute driver_opts
        #   Driver attachment options for the network target.
        #
        #   @return [Object, nil]
        optional :driver_opts, DockerEngineRuby::Internal::Type::Unknown, api_name: :DriverOpts

        # @!attribute target
        #   The target network for attachment. Must be a network name or ID.
        #
        #   @return [String, nil]
        optional :target, String, api_name: :Target

        # @!method initialize(aliases: nil, driver_opts: nil, target: nil)
        #   Specifies how a service should be attached to a particular network.
        #
        #   @param aliases [Array<String>] Discoverable alternate names for the service on this network.
        #
        #   @param driver_opts [Object] Driver attachment options for the network target.
        #
        #   @param target [String] The target network for attachment. Must be a network name or ID.
      end

      # @see DockerEngineRuby::Models::TaskSpec#placement
      class Placement < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute constraints
        #
        #   @return [Array<String>, nil]
        optional :constraints, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Constraints

        # @!attribute max_replicas
        #
        #   @return [Integer, nil]
        optional :max_replicas, Integer, api_name: :MaxReplicas

        # @!attribute platforms
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::Placement::Platform>, nil]
        optional :platforms,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::Placement::Platform]
                 },
                 api_name: :Platforms

        # @!attribute preferences
        #
        #   @return [Array<DockerEngineRuby::Models::TaskSpec::Placement::Preference>, nil]
        optional :preferences,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::Placement::Preference]
                 },
                 api_name: :Preferences

        # @!method initialize(constraints: nil, max_replicas: nil, platforms: nil, preferences: nil)
        #   @param constraints [Array<String>]
        #   @param max_replicas [Integer]
        #   @param platforms [Array<DockerEngineRuby::Models::TaskSpec::Placement::Platform>]
        #   @param preferences [Array<DockerEngineRuby::Models::TaskSpec::Placement::Preference>]

        class Platform < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute architecture
          #   Architecture represents the hardware architecture (for example, `x86_64`).
          #
          #   @return [String, nil]
          optional :architecture, String, api_name: :Architecture

          # @!attribute os
          #   OS represents the Operating System (for example, `linux` or `windows`).
          #
          #   @return [String, nil]
          optional :os, String, api_name: :OS

          # @!method initialize(architecture: nil, os: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineRuby::Models::TaskSpec::Placement::Platform} for more details.
          #
          #   Platform represents the platform (Arch/OS).
          #
          #   @param architecture [String] Architecture represents the hardware architecture (for example,
          #
          #   @param os [String] OS represents the Operating System (for example, `linux` or `windows`).
        end

        class Preference < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute spread
          #
          #   @return [DockerEngineRuby::Models::TaskSpec::Placement::Preference::Spread, nil]
          optional :spread,
                   -> {
                     DockerEngineRuby::TaskSpec::Placement::Preference::Spread
                   },
                   api_name: :Spread

          # @!method initialize(spread: nil)
          #   @param spread [DockerEngineRuby::Models::TaskSpec::Placement::Preference::Spread]

          # @see DockerEngineRuby::Models::TaskSpec::Placement::Preference#spread
          class Spread < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute spread_descriptor
            #
            #   @return [String, nil]
            optional :spread_descriptor, String, api_name: :SpreadDescriptor

            # @!method initialize(spread_descriptor: nil)
            #   @param spread_descriptor [String]
          end
        end
      end

      # @see DockerEngineRuby::Models::TaskSpec#plugin_spec
      class PluginSpec < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute disabled
        #
        #   @return [Boolean, nil]
        optional :disabled, DockerEngineRuby::Internal::Type::Boolean, api_name: :Disabled

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String, api_name: :Name

        # @!attribute plugin_privilege
        #
        #   @return [Array<DockerEngineRuby::Models::Privilege>, nil]
        optional :plugin_privilege,
                 -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege] },
                 api_name: :PluginPrivilege

        # @!attribute remote
        #
        #   @return [String, nil]
        optional :remote, String, api_name: :Remote

        # @!method initialize(disabled: nil, name: nil, plugin_privilege: nil, remote: nil)
        #   Plugin spec for the service. _(Experimental release only.)_
        #
        #   <p><br /></p>
        #
        #   > **Note**: ContainerSpec, NetworkAttachmentSpec, and PluginSpec are mutually
        #   > exclusive. PluginSpec is only used when the Runtime field is set to `plugin`.
        #   > NetworkAttachmentSpec is used when the Runtime field is set to `attachment`.
        #
        #   @param disabled [Boolean]
        #   @param name [String]
        #   @param plugin_privilege [Array<DockerEngineRuby::Models::Privilege>]
        #   @param remote [String]
      end

      # @see DockerEngineRuby::Models::TaskSpec#resources
      class Resources < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute limits
        #   An object describing a limit on resources which can be requested by a task.
        #
        #   @return [DockerEngineRuby::Models::TaskSpec::Resources::Limits, nil]
        optional :limits, -> { DockerEngineRuby::TaskSpec::Resources::Limits }, api_name: :Limits

        # @!attribute memory_swappiness
        #
        #   @return [Integer, nil]
        optional :memory_swappiness, Integer, api_name: :MemorySwappiness, nil?: true

        # @!attribute reservations
        #   An object describing the resources which can be advertised by a node and
        #   requested by a task.
        #
        #   @return [DockerEngineRuby::Models::TaskSpec::Resources::Reservations, nil]
        optional :reservations,
                 -> { DockerEngineRuby::TaskSpec::Resources::Reservations },
                 api_name: :Reservations

        # @!attribute swap_bytes
        #
        #   @return [Integer, nil]
        optional :swap_bytes, Integer, api_name: :SwapBytes, nil?: true

        # @!method initialize(limits: nil, memory_swappiness: nil, reservations: nil, swap_bytes: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::TaskSpec::Resources} for more details.
        #
        #   Resource requirements which apply to each individual container created as part
        #   of the service.
        #
        #   @param limits [DockerEngineRuby::Models::TaskSpec::Resources::Limits] An object describing a limit on resources which can be requested by a task.
        #
        #   @param memory_swappiness [Integer, nil]
        #
        #   @param reservations [DockerEngineRuby::Models::TaskSpec::Resources::Reservations] An object describing the resources which can be advertised by a node and
        #
        #   @param swap_bytes [Integer, nil]

        # @see DockerEngineRuby::Models::TaskSpec::Resources#limits
        class Limits < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute memory_bytes
          #
          #   @return [Integer, nil]
          optional :memory_bytes, Integer, api_name: :MemoryBytes

          # @!attribute nano_cpus
          #
          #   @return [Integer, nil]
          optional :nano_cpus, Integer, api_name: :NanoCPUs

          # @!attribute pids
          #   Limits the maximum number of PIDs in the container. Set `0` for unlimited.
          #
          #   @return [Integer, nil]
          optional :pids, Integer, api_name: :Pids

          # @!method initialize(memory_bytes: nil, nano_cpus: nil, pids: nil)
          #   An object describing a limit on resources which can be requested by a task.
          #
          #   @param memory_bytes [Integer]
          #
          #   @param nano_cpus [Integer]
          #
          #   @param pids [Integer] Limits the maximum number of PIDs in the container. Set `0` for unlimited.
        end

        # @see DockerEngineRuby::Models::TaskSpec::Resources#reservations
        class Reservations < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute generic_resources
          #
          #   @return [Array<DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource>, nil]
          optional :generic_resources,
                   -> {
                     DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource]
                   },
                   api_name: :GenericResources

          # @!attribute memory_bytes
          #
          #   @return [Integer, nil]
          optional :memory_bytes, Integer, api_name: :MemoryBytes

          # @!attribute nano_cpus
          #
          #   @return [Integer, nil]
          optional :nano_cpus, Integer, api_name: :NanoCPUs

          # @!method initialize(generic_resources: nil, memory_bytes: nil, nano_cpus: nil)
          #   An object describing the resources which can be advertised by a node and
          #   requested by a task.
          #
          #   @param generic_resources [Array<DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource>]
          #   @param memory_bytes [Integer]
          #   @param nano_cpus [Integer]

          class GenericResource < DockerEngineRuby::Internal::Type::BaseModel
            # @!attribute discrete_resource_spec
            #
            #   @return [DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec, nil]
            optional :discrete_resource_spec,
                     -> {
                       DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec
                     },
                     api_name: :DiscreteResourceSpec

            # @!attribute named_resource_spec
            #
            #   @return [DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec, nil]
            optional :named_resource_spec,
                     -> {
                       DockerEngineRuby::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec
                     },
                     api_name: :NamedResourceSpec

            # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
            #   @param discrete_resource_spec [DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource::DiscreteResourceSpec]
            #   @param named_resource_spec [DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource::NamedResourceSpec]

            # @see DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource#discrete_resource_spec
            class DiscreteResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute kind
              #
              #   @return [String, nil]
              optional :kind, String, api_name: :Kind

              # @!attribute value
              #
              #   @return [Integer, nil]
              optional :value, Integer, api_name: :Value

              # @!method initialize(kind: nil, value: nil)
              #   @param kind [String]
              #   @param value [Integer]
            end

            # @see DockerEngineRuby::Models::TaskSpec::Resources::Reservations::GenericResource#named_resource_spec
            class NamedResourceSpec < DockerEngineRuby::Internal::Type::BaseModel
              # @!attribute kind
              #
              #   @return [String, nil]
              optional :kind, String, api_name: :Kind

              # @!attribute value
              #
              #   @return [String, nil]
              optional :value, String, api_name: :Value

              # @!method initialize(kind: nil, value: nil)
              #   @param kind [String]
              #   @param value [String]
            end
          end
        end
      end

      # @see DockerEngineRuby::Models::TaskSpec#restart_policy
      class RestartPolicy < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute condition
        #
        #   @return [Symbol, DockerEngineRuby::Models::TaskSpec::RestartPolicy::Condition, nil]
        optional :condition,
                 enum: -> { DockerEngineRuby::TaskSpec::RestartPolicy::Condition },
                 api_name: :Condition

        # @!attribute delay
        #
        #   @return [Integer, nil]
        optional :delay, Integer, api_name: :Delay

        # @!attribute max_attempts
        #
        #   @return [Integer, nil]
        optional :max_attempts, Integer, api_name: :MaxAttempts

        # @!attribute window
        #
        #   @return [Integer, nil]
        optional :window, Integer, api_name: :Window

        # @!method initialize(condition: nil, delay: nil, max_attempts: nil, window: nil)
        #   Specification for the restart policy which applies to containers created as part
        #   of this service.
        #
        #   @param condition [Symbol, DockerEngineRuby::Models::TaskSpec::RestartPolicy::Condition]
        #   @param delay [Integer]
        #   @param max_attempts [Integer]
        #   @param window [Integer]

        # @see DockerEngineRuby::Models::TaskSpec::RestartPolicy#condition
        module Condition
          extend DockerEngineRuby::Internal::Type::Enum

          NONE = :none
          ON_FAILURE = :"on-failure"
          ANY = :any

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
