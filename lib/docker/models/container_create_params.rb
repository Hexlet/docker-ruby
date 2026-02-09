# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#create
    class ContainerCreateParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute config
      #   Configuration for a container that is portable between hosts.
      #
      #   @return [Docker::Models::ContainerCreateParams::Config]
      required :config, -> { Docker::ContainerCreateParams::Config }

      # @!attribute name
      #   Assign the specified name to the container. Must match
      #   `/?[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute platform
      #   Platform in the format `os[/arch[/variant]]` used for image lookup.
      #
      #   When specified, the daemon checks if the requested image is present in the local
      #   image cache with the given OS and Architecture, and otherwise returns a `404`
      #   status.
      #
      #   If the option is not set, the host's native OS and Architecture are used to look
      #   up the image in the image cache. However, if no platform is passed and the given
      #   image does exist in the local image cache, but its OS or architecture does not
      #   match, the container is created with the available image, and a warning is added
      #   to the `Warnings` field in the response, for example;
      #
      #       WARNING: The requested image's platform (linux/arm64/v8) does not
      #                match the detected host platform (linux/amd64) and no
      #                specific platform was requested
      #
      #   @return [String, nil]
      optional :platform, String

      # @!method initialize(config:, name: nil, platform: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ContainerCreateParams} for more details.
      #
      #   @param config [Docker::Models::ContainerCreateParams::Config] Configuration for a container that is portable between hosts.
      #
      #   @param name [String] Assign the specified name to the container. Must match
      #
      #   @param platform [String] Platform in the format `os[/arch[/variant]]` used for image lookup.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]

      class Config < Docker::Models::Config
        # @!attribute host_config
        #   Container configuration that depends on the host we are running on
        #
        #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig, nil]
        optional :host_config, -> { Docker::ContainerCreateParams::Config::HostConfig }, api_name: :HostConfig

        # @!attribute networking_config
        #   NetworkingConfig represents the container's networking configuration for each of
        #   its interfaces. It is used for the networking configs specified in the
        #   `docker create` and `docker network connect` commands.
        #
        #   @return [Docker::Models::ContainerCreateParams::Config::NetworkingConfig, nil]
        optional :networking_config,
                 -> { Docker::ContainerCreateParams::Config::NetworkingConfig },
                 api_name: :NetworkingConfig

        # @!method initialize(host_config: nil, networking_config: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::ContainerCreateParams::Config} for more details.
        #
        #   Configuration for a container that is portable between hosts.
        #
        #   @param host_config [Docker::Models::ContainerCreateParams::Config::HostConfig] Container configuration that depends on the host we are running on
        #
        #   @param networking_config [Docker::Models::ContainerCreateParams::Config::NetworkingConfig] NetworkingConfig represents the container's networking configuration for

        class HostConfig < Docker::Internal::Type::BaseModel
          # @!attribute annotations
          #   Arbitrary non-identifying metadata attached to container and provided to the
          #   runtime when the container is started.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :annotations, Docker::Internal::Type::HashOf[String], api_name: :Annotations

          # @!attribute auto_remove
          #   Automatically remove the container when the container's process exits. This has
          #   no effect if `RestartPolicy` is set.
          #
          #   @return [Boolean, nil]
          optional :auto_remove, Docker::Internal::Type::Boolean, api_name: :AutoRemove

          # @!attribute binds
          #   A list of volume bindings for this container. Each volume binding is a string in
          #   one of these forms:
          #
          #   - `host-src:container-dest[:options]` to bind-mount a host path into the
          #     container. Both `host-src`, and `container-dest` must be an _absolute_ path.
          #   - `volume-name:container-dest[:options]` to bind-mount a volume managed by a
          #     volume driver into the container. `container-dest` must be an _absolute_ path.
          #
          #   `options` is an optional, comma-delimited list of:
          #
          #   - `nocopy` disables automatic copying of data from the container path to the
          #     volume. The `nocopy` flag only applies to named volumes.
          #   - `[ro|rw]` mounts a volume read-only or read-write, respectively. If omitted or
          #     set to `rw`, volumes are mounted read-write.
          #   - `[z|Z]` applies SELinux labels to allow or deny multiple containers to read
          #     and write to the same volume.
          #     - `z`: a _shared_ content label is applied to the content. This label
          #       indicates that multiple containers can share the volume content, for both
          #       reading and writing.
          #     - `Z`: a _private unshared_ label is applied to the content. This label
          #       indicates that only the current container can use a private volume. Labeling
          #       systems such as SELinux require proper labels to be placed on volume content
          #       that is mounted into a container. Without a label, the security system can
          #       prevent a container's processes from using the content. By default, the
          #       labels set by the host operating system are not modified.
          #   - `[[r]shared|[r]slave|[r]private]` specifies mount
          #     [propagation behavior](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt).
          #     This only applies to bind-mounted volumes, not internal volumes or named
          #     volumes. Mount propagation requires the source mount point (the location where
          #     the source directory is mounted in the host operating system) to have the
          #     correct propagation properties. For shared volumes, the source mount point
          #     must be set to `shared`. For slave volumes, the mount must be set to either
          #     `shared` or `slave`.
          #
          #   @return [Array<String>, nil]
          optional :binds, Docker::Internal::Type::ArrayOf[String], api_name: :Binds

          # @!attribute blkio_device_read_bps
          #   Limit read rate (bytes per second) from a device, in the form:
          #
          #   ```
          #   [{"Path": "device_path", "Rate": rate}]
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp>, nil]
          optional :blkio_device_read_bps,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp]
                   },
                   api_name: :BlkioDeviceReadBps

          # @!attribute blkio_device_read_i_ops
          #   Limit read rate (IO per second) from a device, in the form:
          #
          #   ```
          #   [{"Path": "device_path", "Rate": rate}]
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp>, nil]
          optional :blkio_device_read_i_ops,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp]
                   },
                   api_name: :BlkioDeviceReadIOps

          # @!attribute blkio_device_write_bps
          #   Limit write rate (bytes per second) to a device, in the form:
          #
          #   ```
          #   [{"Path": "device_path", "Rate": rate}]
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp>, nil]
          optional :blkio_device_write_bps,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp]
                   },
                   api_name: :BlkioDeviceWriteBps

          # @!attribute blkio_device_write_i_ops
          #   Limit write rate (IO per second) to a device, in the form:
          #
          #   ```
          #   [{"Path": "device_path", "Rate": rate}]
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp>, nil]
          optional :blkio_device_write_i_ops,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp]
                   },
                   api_name: :BlkioDeviceWriteIOps

          # @!attribute blkio_weight
          #   Block IO weight (relative weight).
          #
          #   @return [Integer, nil]
          optional :blkio_weight, Integer, api_name: :BlkioWeight

          # @!attribute blkio_weight_device
          #   Block IO weight (relative device weight) in the form:
          #
          #   ```
          #   [{"Path": "device_path", "Weight": weight}]
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice>, nil]
          optional :blkio_weight_device,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice]
                   },
                   api_name: :BlkioWeightDevice

          # @!attribute cap_add
          #   A list of kernel capabilities to add to the container. Conflicts with option
          #   'Capabilities'.
          #
          #   @return [Array<String>, nil]
          optional :cap_add, Docker::Internal::Type::ArrayOf[String], api_name: :CapAdd

          # @!attribute cap_drop
          #   A list of kernel capabilities to drop from the container. Conflicts with option
          #   'Capabilities'.
          #
          #   @return [Array<String>, nil]
          optional :cap_drop, Docker::Internal::Type::ArrayOf[String], api_name: :CapDrop

          # @!attribute cgroup
          #   Cgroup to use for the container.
          #
          #   @return [String, nil]
          optional :cgroup, String, api_name: :Cgroup

          # @!attribute cgroupns_mode
          #   cgroup namespace mode for the container. Possible values are:
          #
          #   - `"private"`: the container runs in its own private cgroup namespace
          #   - `"host"`: use the host system's cgroup namespace
          #
          #   If not specified, the daemon default is used, which can either be `"private"` or
          #   `"host"`, depending on daemon version, kernel support and configuration.
          #
          #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::CgroupnsMode, nil]
          optional :cgroupns_mode,
                   enum: -> { Docker::ContainerCreateParams::Config::HostConfig::CgroupnsMode },
                   api_name: :CgroupnsMode

          # @!attribute cgroup_parent
          #   Path to `cgroups` under which the container's `cgroup` is created. If the path
          #   is not absolute, the path is considered to be relative to the `cgroups` path of
          #   the init process. Cgroups are created if they do not already exist.
          #
          #   @return [String, nil]
          optional :cgroup_parent, String, api_name: :CgroupParent

          # @!attribute console_size
          #   Initial console size, as an `[height, width]` array.
          #
          #   @return [Array<Integer>, nil]
          optional :console_size, Docker::Internal::Type::ArrayOf[Integer], api_name: :ConsoleSize, nil?: true

          # @!attribute container_id_file
          #   Path to a file where the container ID is written
          #
          #   @return [String, nil]
          optional :container_id_file, String, api_name: :ContainerIDFile

          # @!attribute cpu_count
          #   The number of usable CPUs (Windows only).
          #
          #   On Windows Server containers, the processor resource controls are mutually
          #   exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
          #   `CPUPercent` last.
          #
          #   @return [Integer, nil]
          optional :cpu_count, Integer, api_name: :CpuCount

          # @!attribute cpu_percent
          #   The usable percentage of the available CPUs (Windows only).
          #
          #   On Windows Server containers, the processor resource controls are mutually
          #   exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
          #   `CPUPercent` last.
          #
          #   @return [Integer, nil]
          optional :cpu_percent, Integer, api_name: :CpuPercent

          # @!attribute cpu_period
          #   The length of a CPU period in microseconds.
          #
          #   @return [Integer, nil]
          optional :cpu_period, Integer, api_name: :CpuPeriod

          # @!attribute cpu_quota
          #   Microseconds of CPU time that the container can get in a CPU period.
          #
          #   @return [Integer, nil]
          optional :cpu_quota, Integer, api_name: :CpuQuota

          # @!attribute cpu_realtime_period
          #   The length of a CPU real-time period in microseconds. Set to 0 to allocate no
          #   time allocated to real-time tasks.
          #
          #   @return [Integer, nil]
          optional :cpu_realtime_period, Integer, api_name: :CpuRealtimePeriod

          # @!attribute cpu_realtime_runtime
          #   The length of a CPU real-time runtime in microseconds. Set to 0 to allocate no
          #   time allocated to real-time tasks.
          #
          #   @return [Integer, nil]
          optional :cpu_realtime_runtime, Integer, api_name: :CpuRealtimeRuntime

          # @!attribute cpuset_cpus
          #   CPUs in which to allow execution (e.g., `0-3`, `0,1`).
          #
          #   @return [String, nil]
          optional :cpuset_cpus, String, api_name: :CpusetCpus

          # @!attribute cpuset_mems
          #   Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on
          #   NUMA systems.
          #
          #   @return [String, nil]
          optional :cpuset_mems, String, api_name: :CpusetMems

          # @!attribute cpu_shares
          #   An integer value representing this container's relative CPU weight versus other
          #   containers.
          #
          #   @return [Integer, nil]
          optional :cpu_shares, Integer, api_name: :CpuShares

          # @!attribute device_cgroup_rules
          #   a list of cgroup rules to apply to the container
          #
          #   @return [Array<String>, nil]
          optional :device_cgroup_rules, Docker::Internal::Type::ArrayOf[String], api_name: :DeviceCgroupRules

          # @!attribute device_requests
          #   A list of requests for devices to be sent to device drivers.
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::DeviceRequest>, nil]
          optional :device_requests,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::DeviceRequest]
                   },
                   api_name: :DeviceRequests

          # @!attribute devices
          #   A list of devices to add to the container.
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Device>, nil]
          optional :devices,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::Device]
                   },
                   api_name: :Devices

          # @!attribute dns
          #   A list of DNS servers for the container to use.
          #
          #   @return [Array<String>, nil]
          optional :dns, Docker::Internal::Type::ArrayOf[String], api_name: :Dns

          # @!attribute dns_options
          #   A list of DNS options.
          #
          #   @return [Array<String>, nil]
          optional :dns_options, Docker::Internal::Type::ArrayOf[String], api_name: :DnsOptions

          # @!attribute dns_search
          #   A list of DNS search domains.
          #
          #   @return [Array<String>, nil]
          optional :dns_search, Docker::Internal::Type::ArrayOf[String], api_name: :DnsSearch

          # @!attribute extra_hosts
          #   A list of hostnames/IP mappings to add to the container's `/etc/hosts` file.
          #   Specified in the form `["hostname:IP"]`.
          #
          #   @return [Array<String>, nil]
          optional :extra_hosts, Docker::Internal::Type::ArrayOf[String], api_name: :ExtraHosts

          # @!attribute group_add
          #   A list of additional groups that the container process will run as.
          #
          #   @return [Array<String>, nil]
          optional :group_add, Docker::Internal::Type::ArrayOf[String], api_name: :GroupAdd

          # @!attribute init
          #   Run an init inside the container that forwards signals and reaps processes. This
          #   field is omitted if empty, and the default (as configured on the daemon) is
          #   used.
          #
          #   @return [Boolean, nil]
          optional :init, Docker::Internal::Type::Boolean, api_name: :Init, nil?: true

          # @!attribute io_maximum_bandwidth
          #   Maximum IO in bytes per second for the container system drive (Windows only).
          #
          #   @return [Integer, nil]
          optional :io_maximum_bandwidth, Integer, api_name: :IOMaximumBandwidth

          # @!attribute io_maximum_i_ops
          #   Maximum IOps for the container system drive (Windows only)
          #
          #   @return [Integer, nil]
          optional :io_maximum_i_ops, Integer, api_name: :IOMaximumIOps

          # @!attribute ipc_mode
          #   IPC sharing mode for the container. Possible values are:
          #
          #   - `"none"`: own private IPC namespace, with /dev/shm not mounted
          #   - `"private"`: own private IPC namespace
          #   - `"shareable"`: own private IPC namespace, with a possibility to share it with
          #     other containers
          #   - `"container:<name|id>"`: join another (shareable) container's IPC namespace
          #   - `"host"`: use the host system's IPC namespace
          #
          #   If not specified, daemon default is used, which can either be `"private"` or
          #   `"shareable"`, depending on daemon version and configuration.
          #
          #   @return [String, nil]
          optional :ipc_mode, String, api_name: :IpcMode

          # @!attribute isolation
          #   Isolation technology of the container. (Windows only)
          #
          #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Isolation, nil]
          optional :isolation,
                   enum: -> { Docker::ContainerCreateParams::Config::HostConfig::Isolation },
                   api_name: :Isolation

          # @!attribute links
          #   A list of links for the container in the form `container_name:alias`.
          #
          #   @return [Array<String>, nil]
          optional :links, Docker::Internal::Type::ArrayOf[String], api_name: :Links

          # @!attribute log_config
          #   The logging configuration for this container
          #
          #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig, nil]
          optional :log_config,
                   -> { Docker::ContainerCreateParams::Config::HostConfig::LogConfig },
                   api_name: :LogConfig

          # @!attribute masked_paths
          #   The list of paths to be masked inside the container (this overrides the default
          #   set of paths).
          #
          #   @return [Array<String>, nil]
          optional :masked_paths, Docker::Internal::Type::ArrayOf[String], api_name: :MaskedPaths

          # @!attribute memory
          #   Memory limit in bytes.
          #
          #   @return [Integer, nil]
          optional :memory, Integer, api_name: :Memory

          # @!attribute memory_reservation
          #   Memory soft limit in bytes.
          #
          #   @return [Integer, nil]
          optional :memory_reservation, Integer, api_name: :MemoryReservation

          # @!attribute memory_swap
          #   Total memory limit (memory + swap). Set as `-1` to enable unlimited swap.
          #
          #   @return [Integer, nil]
          optional :memory_swap, Integer, api_name: :MemorySwap

          # @!attribute memory_swappiness
          #   Tune a container's memory swappiness behavior. Accepts an integer between 0
          #   and 100.
          #
          #   @return [Integer, nil]
          optional :memory_swappiness, Integer, api_name: :MemorySwappiness

          # @!attribute mounts
          #   Specification for mounts to be added to the container.
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Mount>, nil]
          optional :mounts,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::Mount]
                   },
                   api_name: :Mounts

          # @!attribute nano_cpus
          #   CPU quota in units of 10<sup>-9</sup> CPUs.
          #
          #   @return [Integer, nil]
          optional :nano_cpus, Integer, api_name: :NanoCpus

          # @!attribute network_mode
          #   Network mode to use for this container. Supported standard values are: `bridge`,
          #   `host`, `none`, and `container:<name|id>`. Any other value is taken as a custom
          #   network's name to which this container should connect to.
          #
          #   @return [String, nil]
          optional :network_mode, String, api_name: :NetworkMode

          # @!attribute oom_kill_disable
          #   Disable OOM Killer for the container.
          #
          #   @return [Boolean, nil]
          optional :oom_kill_disable, Docker::Internal::Type::Boolean, api_name: :OomKillDisable

          # @!attribute oom_score_adj
          #   An integer value containing the score given to the container in order to tune
          #   OOM killer preferences.
          #
          #   @return [Integer, nil]
          optional :oom_score_adj, Integer, api_name: :OomScoreAdj

          # @!attribute pid_mode
          #   Set the PID (Process) Namespace mode for the container. It can be either:
          #
          #   - `"container:<name|id>"`: joins another container's PID namespace
          #   - `"host"`: use the host's PID namespace inside the container
          #
          #   @return [String, nil]
          optional :pid_mode, String, api_name: :PidMode

          # @!attribute pids_limit
          #   Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
          #   change.
          #
          #   @return [Integer, nil]
          optional :pids_limit, Integer, api_name: :PidsLimit, nil?: true

          # @!attribute port_bindings
          #   PortMap describes the mapping of container ports to host ports, using the
          #   container's port-number and protocol as key in the format `<port>/<protocol>`,
          #   for example, `80/udp`.
          #
          #   If a container's port is mapped for multiple protocols, separate entries are
          #   added to the mapping table.
          #
          #   @return [Hash{Symbol=>Array<Docker::Models::ContainerCreateParams::Config::HostConfig::PortBinding>}, nil]
          optional :port_bindings,
                   -> {
                     Docker::Internal::Type::HashOf[Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::PortBinding]]
                   },
                   api_name: :PortBindings

          # @!attribute privileged
          #   Gives the container full access to the host.
          #
          #   @return [Boolean, nil]
          optional :privileged, Docker::Internal::Type::Boolean, api_name: :Privileged

          # @!attribute publish_all_ports
          #   Allocates an ephemeral host port for all of a container's exposed ports.
          #
          #   Ports are de-allocated when the container stops and allocated when the container
          #   starts. The allocated port might be changed when restarting the container.
          #
          #   The port is selected from the ephemeral port range that depends on the kernel.
          #   For example, on Linux the range is defined by
          #   `/proc/sys/net/ipv4/ip_local_port_range`.
          #
          #   @return [Boolean, nil]
          optional :publish_all_ports, Docker::Internal::Type::Boolean, api_name: :PublishAllPorts

          # @!attribute readonly_paths
          #   The list of paths to be set as read-only inside the container (this overrides
          #   the default set of paths).
          #
          #   @return [Array<String>, nil]
          optional :readonly_paths, Docker::Internal::Type::ArrayOf[String], api_name: :ReadonlyPaths

          # @!attribute readonly_rootfs
          #   Mount the container's root filesystem as read only.
          #
          #   @return [Boolean, nil]
          optional :readonly_rootfs, Docker::Internal::Type::Boolean, api_name: :ReadonlyRootfs

          # @!attribute restart_policy
          #   The behavior to apply when the container exits. The default is not to restart.
          #
          #   An ever increasing delay (double the previous delay, starting at 100ms) is added
          #   before each restart to prevent flooding the server.
          #
          #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy, nil]
          optional :restart_policy,
                   -> { Docker::ContainerCreateParams::Config::HostConfig::RestartPolicy },
                   api_name: :RestartPolicy

          # @!attribute runtime
          #   Runtime to use with this container.
          #
          #   @return [String, nil]
          optional :runtime, String, api_name: :Runtime, nil?: true

          # @!attribute security_opt
          #   A list of string values to customize labels for MLS systems, such as SELinux.
          #
          #   @return [Array<String>, nil]
          optional :security_opt, Docker::Internal::Type::ArrayOf[String], api_name: :SecurityOpt

          # @!attribute shm_size
          #   Size of `/dev/shm` in bytes. If omitted, the system uses 64MB.
          #
          #   @return [Integer, nil]
          optional :shm_size, Integer, api_name: :ShmSize

          # @!attribute storage_opt
          #   Storage driver options for this container, in the form `{"size": "120G"}`.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :storage_opt, Docker::Internal::Type::HashOf[String], api_name: :StorageOpt

          # @!attribute sysctls
          #   A list of kernel parameters (sysctls) to set in the container.
          #
          #   This field is omitted if not set.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :sysctls, Docker::Internal::Type::HashOf[String], api_name: :Sysctls, nil?: true

          # @!attribute tmpfs
          #   A map of container directories which should be replaced by tmpfs mounts, and
          #   their corresponding mount options. For example:
          #
          #   ```
          #   { "/run": "rw,noexec,nosuid,size=65536k" }
          #   ```
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :tmpfs, Docker::Internal::Type::HashOf[String], api_name: :Tmpfs

          # @!attribute ulimits
          #   A list of resource limits to set in the container. For example:
          #
          #   ```
          #   {"Name": "nofile", "Soft": 1024, "Hard": 2048}
          #   ```
          #
          #   @return [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Ulimit>, nil]
          optional :ulimits,
                   -> {
                     Docker::Internal::Type::ArrayOf[Docker::ContainerCreateParams::Config::HostConfig::Ulimit]
                   },
                   api_name: :Ulimits

          # @!attribute userns_mode
          #   Sets the usernamespace mode for the container when usernamespace remapping
          #   option is enabled.
          #
          #   @return [String, nil]
          optional :userns_mode, String, api_name: :UsernsMode

          # @!attribute uts_mode
          #   UTS namespace to use for the container.
          #
          #   @return [String, nil]
          optional :uts_mode, String, api_name: :UTSMode

          # @!attribute volume_driver
          #   Driver that this container uses to mount volumes.
          #
          #   @return [String, nil]
          optional :volume_driver, String, api_name: :VolumeDriver

          # @!attribute volumes_from
          #   A list of volumes to inherit from another container, specified in the form
          #   `<container name>[:<ro|rw>]`.
          #
          #   @return [Array<String>, nil]
          optional :volumes_from, Docker::Internal::Type::ArrayOf[String], api_name: :VolumesFrom

          # @!method initialize(annotations: nil, auto_remove: nil, binds: nil, blkio_device_read_bps: nil, blkio_device_read_i_ops: nil, blkio_device_write_bps: nil, blkio_device_write_i_ops: nil, blkio_weight: nil, blkio_weight_device: nil, cap_add: nil, cap_drop: nil, cgroup: nil, cgroupns_mode: nil, cgroup_parent: nil, console_size: nil, container_id_file: nil, cpu_count: nil, cpu_percent: nil, cpu_period: nil, cpu_quota: nil, cpu_realtime_period: nil, cpu_realtime_runtime: nil, cpuset_cpus: nil, cpuset_mems: nil, cpu_shares: nil, device_cgroup_rules: nil, device_requests: nil, devices: nil, dns: nil, dns_options: nil, dns_search: nil, extra_hosts: nil, group_add: nil, init: nil, io_maximum_bandwidth: nil, io_maximum_i_ops: nil, ipc_mode: nil, isolation: nil, links: nil, log_config: nil, masked_paths: nil, memory: nil, memory_reservation: nil, memory_swap: nil, memory_swappiness: nil, mounts: nil, nano_cpus: nil, network_mode: nil, oom_kill_disable: nil, oom_score_adj: nil, pid_mode: nil, pids_limit: nil, port_bindings: nil, privileged: nil, publish_all_ports: nil, readonly_paths: nil, readonly_rootfs: nil, restart_policy: nil, runtime: nil, security_opt: nil, shm_size: nil, storage_opt: nil, sysctls: nil, tmpfs: nil, ulimits: nil, userns_mode: nil, uts_mode: nil, volume_driver: nil, volumes_from: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::ContainerCreateParams::Config::HostConfig} for more details.
          #
          #   Container configuration that depends on the host we are running on
          #
          #   @param annotations [Hash{Symbol=>String}] Arbitrary non-identifying metadata attached to container and
          #
          #   @param auto_remove [Boolean] Automatically remove the container when the container's process
          #
          #   @param binds [Array<String>] A list of volume bindings for this container. Each volume binding
          #
          #   @param blkio_device_read_bps [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp>] Limit read rate (bytes per second) from a device, in the form:
          #
          #   @param blkio_device_read_i_ops [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp>] Limit read rate (IO per second) from a device, in the form:
          #
          #   @param blkio_device_write_bps [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp>] Limit write rate (bytes per second) to a device, in the form:
          #
          #   @param blkio_device_write_i_ops [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp>] Limit write rate (IO per second) to a device, in the form:
          #
          #   @param blkio_weight [Integer] Block IO weight (relative weight).
          #
          #   @param blkio_weight_device [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice>] Block IO weight (relative device weight) in the form:
          #
          #   @param cap_add [Array<String>] A list of kernel capabilities to add to the container. Conflicts
          #
          #   @param cap_drop [Array<String>] A list of kernel capabilities to drop from the container. Conflicts
          #
          #   @param cgroup [String] Cgroup to use for the container.
          #
          #   @param cgroupns_mode [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::CgroupnsMode] cgroup namespace mode for the container. Possible values are:
          #
          #   @param cgroup_parent [String] Path to `cgroups` under which the container's `cgroup` is created. If
          #
          #   @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
          #
          #   @param container_id_file [String] Path to a file where the container ID is written
          #
          #   @param cpu_count [Integer] The number of usable CPUs (Windows only).
          #
          #   @param cpu_percent [Integer] The usable percentage of the available CPUs (Windows only).
          #
          #   @param cpu_period [Integer] The length of a CPU period in microseconds.
          #
          #   @param cpu_quota [Integer] Microseconds of CPU time that the container can get in a CPU period.
          #
          #   @param cpu_realtime_period [Integer] The length of a CPU real-time period in microseconds. Set to 0 to
          #
          #   @param cpu_realtime_runtime [Integer] The length of a CPU real-time runtime in microseconds. Set to 0 to
          #
          #   @param cpuset_cpus [String] CPUs in which to allow execution (e.g., `0-3`, `0,1`).
          #
          #   @param cpuset_mems [String] Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only
          #
          #   @param cpu_shares [Integer] An integer value representing this container's relative CPU weight
          #
          #   @param device_cgroup_rules [Array<String>] a list of cgroup rules to apply to the container
          #
          #   @param device_requests [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::DeviceRequest>] A list of requests for devices to be sent to device drivers.
          #
          #   @param devices [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Device>] A list of devices to add to the container.
          #
          #   @param dns [Array<String>] A list of DNS servers for the container to use.
          #
          #   @param dns_options [Array<String>] A list of DNS options.
          #
          #   @param dns_search [Array<String>] A list of DNS search domains.
          #
          #   @param extra_hosts [Array<String>] A list of hostnames/IP mappings to add to the container's `/etc/hosts`
          #
          #   @param group_add [Array<String>] A list of additional groups that the container process will run as.
          #
          #   @param init [Boolean, nil] Run an init inside the container that forwards signals and reaps
          #
          #   @param io_maximum_bandwidth [Integer] Maximum IO in bytes per second for the container system drive
          #
          #   @param io_maximum_i_ops [Integer] Maximum IOps for the container system drive (Windows only)
          #
          #   @param ipc_mode [String] IPC sharing mode for the container. Possible values are:
          #
          #   @param isolation [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Isolation] Isolation technology of the container. (Windows only)
          #
          #   @param links [Array<String>] A list of links for the container in the form `container_name:alias`.
          #
          #   @param log_config [Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig] The logging configuration for this container
          #
          #   @param masked_paths [Array<String>] The list of paths to be masked inside the container (this overrides
          #
          #   @param memory [Integer] Memory limit in bytes.
          #
          #   @param memory_reservation [Integer] Memory soft limit in bytes.
          #
          #   @param memory_swap [Integer] Total memory limit (memory + swap). Set as `-1` to enable unlimited
          #
          #   @param memory_swappiness [Integer] Tune a container's memory swappiness behavior. Accepts an integer
          #
          #   @param mounts [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Mount>] Specification for mounts to be added to the container.
          #
          #   @param nano_cpus [Integer] CPU quota in units of 10<sup>-9</sup> CPUs.
          #
          #   @param network_mode [String] Network mode to use for this container. Supported standard values
          #
          #   @param oom_kill_disable [Boolean] Disable OOM Killer for the container.
          #
          #   @param oom_score_adj [Integer] An integer value containing the score given to the container in
          #
          #   @param pid_mode [String] Set the PID (Process) Namespace mode for the container. It can be
          #
          #   @param pids_limit [Integer, nil] Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null`
          #
          #   @param port_bindings [Hash{Symbol=>Array<Docker::Models::ContainerCreateParams::Config::HostConfig::PortBinding>}] PortMap describes the mapping of container ports to host ports, using the
          #
          #   @param privileged [Boolean] Gives the container full access to the host.
          #
          #   @param publish_all_ports [Boolean] Allocates an ephemeral host port for all of a container's
          #
          #   @param readonly_paths [Array<String>] The list of paths to be set as read-only inside the container
          #
          #   @param readonly_rootfs [Boolean] Mount the container's root filesystem as read only.
          #
          #   @param restart_policy [Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy] The behavior to apply when the container exits. The default is not to
          #
          #   @param runtime [String, nil] Runtime to use with this container.
          #
          #   @param security_opt [Array<String>] A list of string values to customize labels for MLS systems, such
          #
          #   @param shm_size [Integer] Size of `/dev/shm` in bytes. If omitted, the system uses 64MB.
          #
          #   @param storage_opt [Hash{Symbol=>String}] Storage driver options for this container, in the form `{"size": "120G"}`.
          #
          #   @param sysctls [Hash{Symbol=>String}, nil] A list of kernel parameters (sysctls) to set in the container.
          #
          #   @param tmpfs [Hash{Symbol=>String}] A map of container directories which should be replaced by tmpfs
          #
          #   @param ulimits [Array<Docker::Models::ContainerCreateParams::Config::HostConfig::Ulimit>] A list of resource limits to set in the container. For example:
          #
          #   @param userns_mode [String] Sets the usernamespace mode for the container when usernamespace
          #
          #   @param uts_mode [String] UTS namespace to use for the container.
          #
          #   @param volume_driver [String] Driver that this container uses to mount volumes.
          #
          #   @param volumes_from [Array<String>] A list of volumes to inherit from another container, specified in

          class BlkioDeviceReadBp < Docker::Internal::Type::BaseModel
            # @!attribute path
            #   Device path
            #
            #   @return [String, nil]
            optional :path, String, api_name: :Path

            # @!attribute rate
            #   Rate
            #
            #   @return [Integer, nil]
            optional :rate, Integer, api_name: :Rate

            # @!method initialize(path: nil, rate: nil)
            #   @param path [String] Device path
            #
            #   @param rate [Integer] Rate
          end

          class BlkioDeviceReadIOp < Docker::Internal::Type::BaseModel
            # @!attribute path
            #   Device path
            #
            #   @return [String, nil]
            optional :path, String, api_name: :Path

            # @!attribute rate
            #   Rate
            #
            #   @return [Integer, nil]
            optional :rate, Integer, api_name: :Rate

            # @!method initialize(path: nil, rate: nil)
            #   @param path [String] Device path
            #
            #   @param rate [Integer] Rate
          end

          class BlkioDeviceWriteBp < Docker::Internal::Type::BaseModel
            # @!attribute path
            #   Device path
            #
            #   @return [String, nil]
            optional :path, String, api_name: :Path

            # @!attribute rate
            #   Rate
            #
            #   @return [Integer, nil]
            optional :rate, Integer, api_name: :Rate

            # @!method initialize(path: nil, rate: nil)
            #   @param path [String] Device path
            #
            #   @param rate [Integer] Rate
          end

          class BlkioDeviceWriteIOp < Docker::Internal::Type::BaseModel
            # @!attribute path
            #   Device path
            #
            #   @return [String, nil]
            optional :path, String, api_name: :Path

            # @!attribute rate
            #   Rate
            #
            #   @return [Integer, nil]
            optional :rate, Integer, api_name: :Rate

            # @!method initialize(path: nil, rate: nil)
            #   @param path [String] Device path
            #
            #   @param rate [Integer] Rate
          end

          class BlkioWeightDevice < Docker::Internal::Type::BaseModel
            # @!attribute path
            #
            #   @return [String, nil]
            optional :path, String, api_name: :Path

            # @!attribute weight
            #
            #   @return [Integer, nil]
            optional :weight, Integer, api_name: :Weight

            # @!method initialize(path: nil, weight: nil)
            #   @param path [String]
            #   @param weight [Integer]
          end

          # cgroup namespace mode for the container. Possible values are:
          #
          # - `"private"`: the container runs in its own private cgroup namespace
          # - `"host"`: use the host system's cgroup namespace
          #
          # If not specified, the daemon default is used, which can either be `"private"` or
          # `"host"`, depending on daemon version, kernel support and configuration.
          #
          # @see Docker::Models::ContainerCreateParams::Config::HostConfig#cgroupns_mode
          module CgroupnsMode
            extend Docker::Internal::Type::Enum

            PRIVATE = :private
            HOST = :host

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class DeviceRequest < Docker::Internal::Type::BaseModel
            # @!attribute capabilities
            #   A list of capabilities; an OR list of AND lists of capabilities.
            #
            #   Note that if a driver is specified the capabilities have no effect on selecting
            #   a driver as the driver name is used directly.
            #
            #   Note that if no driver is specified the capabilities are used to select a driver
            #   with the required capabilities.
            #
            #   @return [Array<Array<String>>, nil]
            optional :capabilities,
                     Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
                     api_name: :Capabilities

            # @!attribute count
            #
            #   @return [Integer, nil]
            optional :count, Integer, api_name: :Count

            # @!attribute device_ids
            #
            #   @return [Array<String>, nil]
            optional :device_ids, Docker::Internal::Type::ArrayOf[String], api_name: :DeviceIDs

            # @!attribute driver
            #   The name of the device driver to use for this request.
            #
            #   Note that if this is specified the capabilities are ignored when selecting a
            #   device driver.
            #
            #   @return [String, nil]
            optional :driver, String, api_name: :Driver

            # @!attribute options
            #   Driver-specific options, specified as a key/value pairs. These options are
            #   passed directly to the driver.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

            # @!method initialize(capabilities: nil, count: nil, device_ids: nil, driver: nil, options: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::ContainerCreateParams::Config::HostConfig::DeviceRequest} for
            #   more details.
            #
            #   A request for devices to be sent to device drivers
            #
            #   @param capabilities [Array<Array<String>>] A list of capabilities; an OR list of AND lists of capabilities.
            #
            #   @param count [Integer]
            #
            #   @param device_ids [Array<String>]
            #
            #   @param driver [String] The name of the device driver to use for this request.
            #
            #   @param options [Hash{Symbol=>String}] Driver-specific options, specified as a key/value pairs. These options
          end

          class Device < Docker::Internal::Type::BaseModel
            # @!attribute cgroup_permissions
            #
            #   @return [String, nil]
            optional :cgroup_permissions, String, api_name: :CgroupPermissions

            # @!attribute path_in_container
            #
            #   @return [String, nil]
            optional :path_in_container, String, api_name: :PathInContainer

            # @!attribute path_on_host
            #
            #   @return [String, nil]
            optional :path_on_host, String, api_name: :PathOnHost

            # @!method initialize(cgroup_permissions: nil, path_in_container: nil, path_on_host: nil)
            #   A device mapping between the host and container
            #
            #   @param cgroup_permissions [String]
            #   @param path_in_container [String]
            #   @param path_on_host [String]
          end

          # Isolation technology of the container. (Windows only)
          #
          # @see Docker::Models::ContainerCreateParams::Config::HostConfig#isolation
          module Isolation
            extend Docker::Internal::Type::Enum

            DEFAULT = :default
            PROCESS = :process
            HYPERV = :hyperv
            EMPTY = :""

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Docker::Models::ContainerCreateParams::Config::HostConfig#log_config
          class LogConfig < Docker::Internal::Type::BaseModel
            # @!attribute config
            #   Driver-specific configuration options for the logging driver.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :config, Docker::Internal::Type::HashOf[String], api_name: :Config

            # @!attribute type
            #   Name of the logging driver used for the container or "none" if logging is
            #   disabled.
            #
            #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig::Type, nil]
            optional :type,
                     enum: -> { Docker::ContainerCreateParams::Config::HostConfig::LogConfig::Type },
                     api_name: :Type

            # @!method initialize(config: nil, type: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig} for more
            #   details.
            #
            #   The logging configuration for this container
            #
            #   @param config [Hash{Symbol=>String}] Driver-specific configuration options for the logging driver.
            #
            #   @param type [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig::Type] Name of the logging driver used for the container or "none"

            # Name of the logging driver used for the container or "none" if logging is
            # disabled.
            #
            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::LogConfig#type
            module Type
              extend Docker::Internal::Type::Enum

              LOCAL = :local
              JSON_FILE = :"json-file"
              SYSLOG = :syslog
              JOURNALD = :journald
              GELF = :gelf
              FLUENTD = :fluentd
              AWSLOGS = :awslogs
              SPLUNK = :splunk
              ETWLOGS = :etwlogs
              NONE = :none

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class Mount < Docker::Internal::Type::BaseModel
            # @!attribute bind_options
            #   Optional configuration for the `bind` type.
            #
            #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions, nil]
            optional :bind_options,
                     -> { Docker::ContainerCreateParams::Config::HostConfig::Mount::BindOptions },
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
            #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions, nil]
            optional :image_options,
                     -> { Docker::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions },
                     api_name: :ImageOptions

            # @!attribute read_only
            #   Whether the mount should be read-only.
            #
            #   @return [Boolean, nil]
            optional :read_only, Docker::Internal::Type::Boolean, api_name: :ReadOnly

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
            #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions, nil]
            optional :tmpfs_options,
                     -> { Docker::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions },
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
            #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::Type, nil]
            optional :type,
                     enum: -> { Docker::ContainerCreateParams::Config::HostConfig::Mount::Type },
                     api_name: :Type

            # @!attribute volume_options
            #   Optional configuration for the `volume` type.
            #
            #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions, nil]
            optional :volume_options,
                     -> { Docker::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions },
                     api_name: :VolumeOptions

            # @!method initialize(bind_options: nil, consistency: nil, image_options: nil, read_only: nil, source: nil, target: nil, tmpfs_options: nil, type: nil, volume_options: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::ContainerCreateParams::Config::HostConfig::Mount} for more
            #   details.
            #
            #   @param bind_options [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions] Optional configuration for the `bind` type.
            #
            #   @param consistency [String] The consistency requirement for the mount: `default`, `consistent`, `cached`, or
            #
            #   @param image_options [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions] Optional configuration for the `image` type.
            #
            #   @param read_only [Boolean] Whether the mount should be read-only.
            #
            #   @param source [String] Mount source (e.g. a volume name, a host path). The source cannot be
            #
            #   @param target [String] Container path.
            #
            #   @param tmpfs_options [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions] Optional configuration for the `tmpfs` type.
            #
            #   @param type [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::Type] The mount type. Available types:
            #
            #   @param volume_options [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions] Optional configuration for the `volume` type.

            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount#bind_options
            class BindOptions < Docker::Internal::Type::BaseModel
              # @!attribute create_mountpoint
              #   Create mount point on host if missing
              #
              #   @return [Boolean, nil]
              optional :create_mountpoint, Docker::Internal::Type::Boolean, api_name: :CreateMountpoint

              # @!attribute non_recursive
              #   Disable recursive bind mount.
              #
              #   @return [Boolean, nil]
              optional :non_recursive, Docker::Internal::Type::Boolean, api_name: :NonRecursive

              # @!attribute propagation
              #   A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation, nil]
              optional :propagation,
                       enum: -> {
                         Docker::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation
                       },
                       api_name: :Propagation

              # @!attribute read_only_force_recursive
              #   Raise an error if the mount cannot be made recursively read-only.
              #
              #   @return [Boolean, nil]
              optional :read_only_force_recursive,
                       Docker::Internal::Type::Boolean,
                       api_name: :ReadOnlyForceRecursive

              # @!attribute read_only_non_recursive
              #   Make the mount non-recursively read-only, but still leave the mount recursive
              #   (unless NonRecursive is set to `true` in conjunction).
              #
              #   Added in v1.44, before that version all read-only mounts were non-recursive by
              #   default. To match the previous behaviour this will default to `true` for clients
              #   on versions prior to v1.44.
              #
              #   @return [Boolean, nil]
              optional :read_only_non_recursive,
                       Docker::Internal::Type::Boolean,
                       api_name: :ReadOnlyNonRecursive

              # @!method initialize(create_mountpoint: nil, non_recursive: nil, propagation: nil, read_only_force_recursive: nil, read_only_non_recursive: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions}
              #   for more details.
              #
              #   Optional configuration for the `bind` type.
              #
              #   @param create_mountpoint [Boolean] Create mount point on host if missing
              #
              #   @param non_recursive [Boolean] Disable recursive bind mount.
              #
              #   @param propagation [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation] A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              #   @param read_only_force_recursive [Boolean] Raise an error if the mount cannot be made recursively read-only.
              #
              #   @param read_only_non_recursive [Boolean] Make the mount non-recursively read-only, but still leave the mount recursive

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              #
              # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::BindOptions#propagation
              module Propagation
                extend Docker::Internal::Type::Enum

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

            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount#image_options
            class ImageOptions < Docker::Internal::Type::BaseModel
              # @!attribute subpath
              #   Source path inside the image. Must be relative without any back traversals.
              #
              #   @return [String, nil]
              optional :subpath, String, api_name: :Subpath

              # @!method initialize(subpath: nil)
              #   Optional configuration for the `image` type.
              #
              #   @param subpath [String] Source path inside the image. Must be relative without any back traversals.
            end

            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount#tmpfs_options
            class TmpfsOptions < Docker::Internal::Type::BaseModel
              # @!attribute mode
              #   The permission mode for the tmpfs mount in an integer. The value must not be in
              #   octal format (e.g. 755) but rather the decimal representation of the octal value
              #   (e.g. 493).
              #
              #   @return [Integer, nil]
              optional :mode, Integer, api_name: :Mode

              # @!attribute options
              #   The options to be passed to the tmpfs mount. An array of arrays. Flag options
              #   should be provided as 1-length arrays. Other types should be provided as as
              #   2-length arrays, where the first item is the key and the second the value.
              #
              #   @return [Array<Array<String>>, nil]
              optional :options,
                       Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
                       api_name: :Options

              # @!attribute size_bytes
              #   The size for the tmpfs mount in bytes.
              #
              #   @return [Integer, nil]
              optional :size_bytes, Integer, api_name: :SizeBytes

              # @!method initialize(mode: nil, options: nil, size_bytes: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions}
              #   for more details.
              #
              #   Optional configuration for the `tmpfs` type.
              #
              #   @param mode [Integer] The permission mode for the tmpfs mount in an integer.
              #
              #   @param options [Array<Array<String>>] The options to be passed to the tmpfs mount. An array of arrays.
              #
              #   @param size_bytes [Integer] The size for the tmpfs mount in bytes.
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
            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount#type
            module Type
              extend Docker::Internal::Type::Enum

              BIND = :bind
              CLUSTER = :cluster
              IMAGE = :image
              NPIPE = :npipe
              TMPFS = :tmpfs
              VOLUME = :volume

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount#volume_options
            class VolumeOptions < Docker::Internal::Type::BaseModel
              # @!attribute driver_config
              #   Map of driver specific options
              #
              #   @return [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig, nil]
              optional :driver_config,
                       -> {
                         Docker::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig
                       },
                       api_name: :DriverConfig

              # @!attribute labels
              #   User-defined key/value metadata.
              #
              #   @return [Hash{Symbol=>String}, nil]
              optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

              # @!attribute no_copy
              #   Populate volume with data from the target.
              #
              #   @return [Boolean, nil]
              optional :no_copy, Docker::Internal::Type::Boolean, api_name: :NoCopy

              # @!attribute subpath
              #   Source path inside the volume. Must be relative without any back traversals.
              #
              #   @return [String, nil]
              optional :subpath, String, api_name: :Subpath

              # @!method initialize(driver_config: nil, labels: nil, no_copy: nil, subpath: nil)
              #   Optional configuration for the `volume` type.
              #
              #   @param driver_config [Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig] Map of driver specific options
              #
              #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
              #
              #   @param no_copy [Boolean] Populate volume with data from the target.
              #
              #   @param subpath [String] Source path inside the volume. Must be relative without any back traversals.

              # @see Docker::Models::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions#driver_config
              class DriverConfig < Docker::Internal::Type::BaseModel
                # @!attribute name
                #   Name of the driver to use to create the volume.
                #
                #   @return [String, nil]
                optional :name, String, api_name: :Name

                # @!attribute options
                #   key/value map of driver specific options.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

                # @!method initialize(name: nil, options: nil)
                #   Map of driver specific options
                #
                #   @param name [String] Name of the driver to use to create the volume.
                #
                #   @param options [Hash{Symbol=>String}] key/value map of driver specific options.
              end
            end
          end

          class PortBinding < Docker::Internal::Type::BaseModel
            # @!attribute host_ip
            #   Host IP address that the container's port is mapped to.
            #
            #   @return [String, nil]
            optional :host_ip, String, api_name: :HostIp

            # @!attribute host_port
            #   Host port number that the container's port is mapped to.
            #
            #   @return [String, nil]
            optional :host_port, String, api_name: :HostPort

            # @!method initialize(host_ip: nil, host_port: nil)
            #   PortBinding represents a binding between a host IP address and a host port.
            #
            #   @param host_ip [String] Host IP address that the container's port is mapped to.
            #
            #   @param host_port [String] Host port number that the container's port is mapped to.
          end

          # @see Docker::Models::ContainerCreateParams::Config::HostConfig#restart_policy
          class RestartPolicy < Docker::Internal::Type::BaseModel
            # @!attribute maximum_retry_count
            #   If `on-failure` is used, the number of times to retry before giving up.
            #
            #   @return [Integer, nil]
            optional :maximum_retry_count, Integer, api_name: :MaximumRetryCount

            # @!attribute name
            #   - Empty string means not to restart
            #   - `no` Do not automatically restart
            #   - `always` Always restart
            #   - `unless-stopped` Restart always except when the user has manually stopped the
            #     container
            #   - `on-failure` Restart only when the container exit code is non-zero
            #
            #   @return [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name, nil]
            optional :name,
                     enum: -> { Docker::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name },
                     api_name: :Name

            # @!method initialize(maximum_retry_count: nil, name: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy} for
            #   more details.
            #
            #   The behavior to apply when the container exits. The default is not to restart.
            #
            #   An ever increasing delay (double the previous delay, starting at 100ms) is added
            #   before each restart to prevent flooding the server.
            #
            #   @param maximum_retry_count [Integer] If `on-failure` is used, the number of times to retry before giving up.
            #
            #   @param name [Symbol, Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name] - Empty string means not to restart

            # - Empty string means not to restart
            # - `no` Do not automatically restart
            # - `always` Always restart
            # - `unless-stopped` Restart always except when the user has manually stopped the
            #   container
            # - `on-failure` Restart only when the container exit code is non-zero
            #
            # @see Docker::Models::ContainerCreateParams::Config::HostConfig::RestartPolicy#name
            module Name
              extend Docker::Internal::Type::Enum

              EMPTY = :""
              NO = :no
              ALWAYS = :always
              UNLESS_STOPPED = :"unless-stopped"
              ON_FAILURE = :"on-failure"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class Ulimit < Docker::Internal::Type::BaseModel
            # @!attribute hard
            #   Hard limit
            #
            #   @return [Integer, nil]
            optional :hard, Integer, api_name: :Hard

            # @!attribute name
            #   Name of ulimit
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute soft
            #   Soft limit
            #
            #   @return [Integer, nil]
            optional :soft, Integer, api_name: :Soft

            # @!method initialize(hard: nil, name: nil, soft: nil)
            #   @param hard [Integer] Hard limit
            #
            #   @param name [String] Name of ulimit
            #
            #   @param soft [Integer] Soft limit
          end
        end

        class NetworkingConfig < Docker::Internal::Type::BaseModel
          # @!attribute endpoints_config
          #   A mapping of network name to endpoint configuration for that network. The
          #   endpoint configuration can be left empty to connect to that network with no
          #   particular endpoint configuration.
          #
          #   @return [Hash{Symbol=>Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig}, nil]
          optional :endpoints_config,
                   -> {
                     Docker::Internal::Type::HashOf[Docker::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig]
                   },
                   api_name: :EndpointsConfig

          # @!method initialize(endpoints_config: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::ContainerCreateParams::Config::NetworkingConfig} for more
          #   details.
          #
          #   NetworkingConfig represents the container's networking configuration for each of
          #   its interfaces. It is used for the networking configs specified in the
          #   `docker create` and `docker network connect` commands.
          #
          #   @param endpoints_config [Hash{Symbol=>Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig}] A mapping of network name to endpoint configuration for that network.

          class EndpointsConfig < Docker::Internal::Type::BaseModel
            # @!attribute aliases
            #
            #   @return [Array<String>, nil]
            optional :aliases, Docker::Internal::Type::ArrayOf[String], api_name: :Aliases

            # @!attribute dns_names
            #   List of all DNS names an endpoint has on a specific network. This list is based
            #   on the container name, network aliases, container short ID, and hostname.
            #
            #   These DNS names are non-fully qualified but can contain several dots. You can
            #   get fully qualified DNS names by appending `.<network-name>`. For instance, if
            #   container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
            #   contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
            #
            #   @return [Array<String>, nil]
            optional :dns_names, Docker::Internal::Type::ArrayOf[String], api_name: :DNSNames

            # @!attribute driver_opts
            #   DriverOpts is a mapping of driver options and values. These options are passed
            #   directly to the driver and are driver specific.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :driver_opts, Docker::Internal::Type::HashOf[String], api_name: :DriverOpts, nil?: true

            # @!attribute endpoint_id
            #   Unique ID for the service endpoint in a Sandbox.
            #
            #   @return [String, nil]
            optional :endpoint_id, String, api_name: :EndpointID

            # @!attribute gateway
            #   Gateway address for this network.
            #
            #   @return [String, nil]
            optional :gateway, String, api_name: :Gateway

            # @!attribute global_i_pv6_address
            #   Global IPv6 address.
            #
            #   @return [String, nil]
            optional :global_i_pv6_address, String, api_name: :GlobalIPv6Address

            # @!attribute global_i_pv6_prefix_len
            #   Mask length of the global IPv6 address.
            #
            #   @return [Integer, nil]
            optional :global_i_pv6_prefix_len, Integer, api_name: :GlobalIPv6PrefixLen

            # @!attribute gw_priority
            #   This property determines which endpoint will provide the default gateway for a
            #   container. The endpoint with the highest priority will be used. If multiple
            #   endpoints have the same priority, endpoints are lexicographically sorted based
            #   on their network name, and the one that sorts first is picked.
            #
            #   @return [Integer, nil]
            optional :gw_priority, Integer, api_name: :GwPriority

            # @!attribute ip_address
            #   IPv4 address.
            #
            #   @return [String, nil]
            optional :ip_address, String, api_name: :IPAddress

            # @!attribute ipam_config
            #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
            #
            #   @return [Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig, nil]
            optional :ipam_config,
                     -> {
                       Docker::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig
                     },
                     api_name: :IPAMConfig,
                     nil?: true

            # @!attribute ip_prefix_len
            #   Mask length of the IPv4 address.
            #
            #   @return [Integer, nil]
            optional :ip_prefix_len, Integer, api_name: :IPPrefixLen

            # @!attribute i_pv6_gateway
            #   IPv6 gateway address.
            #
            #   @return [String, nil]
            optional :i_pv6_gateway, String, api_name: :IPv6Gateway

            # @!attribute links
            #
            #   @return [Array<String>, nil]
            optional :links, Docker::Internal::Type::ArrayOf[String], api_name: :Links

            # @!attribute mac_address
            #   MAC address for the endpoint on this network. The network driver might ignore
            #   this parameter.
            #
            #   @return [String, nil]
            optional :mac_address, String, api_name: :MacAddress

            # @!attribute network_id
            #   Unique ID of the network.
            #
            #   @return [String, nil]
            optional :network_id, String, api_name: :NetworkID

            # @!method initialize(aliases: nil, dns_names: nil, driver_opts: nil, endpoint_id: nil, gateway: nil, global_i_pv6_address: nil, global_i_pv6_prefix_len: nil, gw_priority: nil, ip_address: nil, ipam_config: nil, ip_prefix_len: nil, i_pv6_gateway: nil, links: nil, mac_address: nil, network_id: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig}
            #   for more details.
            #
            #   Configuration for a network endpoint.
            #
            #   @param aliases [Array<String>]
            #
            #   @param dns_names [Array<String>] List of all DNS names an endpoint has on a specific network. This
            #
            #   @param driver_opts [Hash{Symbol=>String}, nil] DriverOpts is a mapping of driver options and values. These options
            #
            #   @param endpoint_id [String] Unique ID for the service endpoint in a Sandbox.
            #
            #   @param gateway [String] Gateway address for this network.
            #
            #   @param global_i_pv6_address [String] Global IPv6 address.
            #
            #   @param global_i_pv6_prefix_len [Integer] Mask length of the global IPv6 address.
            #
            #   @param gw_priority [Integer] This property determines which endpoint will provide the default
            #
            #   @param ip_address [String] IPv4 address.
            #
            #   @param ipam_config [Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig, nil] EndpointIPAMConfig represents an endpoint's IPAM configuration.
            #
            #   @param ip_prefix_len [Integer] Mask length of the IPv4 address.
            #
            #   @param i_pv6_gateway [String] IPv6 gateway address.
            #
            #   @param links [Array<String>]
            #
            #   @param mac_address [String] MAC address for the endpoint on this network. The network driver might ignore th
            #
            #   @param network_id [String] Unique ID of the network.

            # @see Docker::Models::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig#ipam_config
            class IpamConfig < Docker::Internal::Type::BaseModel
              # @!attribute i_pv4_address
              #
              #   @return [String, nil]
              optional :i_pv4_address, String, api_name: :IPv4Address

              # @!attribute i_pv6_address
              #
              #   @return [String, nil]
              optional :i_pv6_address, String, api_name: :IPv6Address

              # @!attribute link_local_ips
              #
              #   @return [Array<String>, nil]
              optional :link_local_ips, Docker::Internal::Type::ArrayOf[String], api_name: :LinkLocalIPs

              # @!method initialize(i_pv4_address: nil, i_pv6_address: nil, link_local_ips: nil)
              #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
              #
              #   @param i_pv4_address [String]
              #   @param i_pv6_address [String]
              #   @param link_local_ips [Array<String>]
            end
          end
        end
      end
    end
  end
end
