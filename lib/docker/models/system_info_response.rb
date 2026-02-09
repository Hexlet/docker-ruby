# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::System#info
    class SystemInfoResponse < Docker::Internal::Type::BaseModel
      # @!attribute architecture
      #   Hardware architecture of the host, as returned by the operating system. This is
      #   equivalent to the output of `uname -m` on Linux.
      #
      #   Unlike `Arch` (from `/version`), this reports the machine's native architecture,
      #   which can differ from the Go runtime architecture when running a binary compiled
      #   for a different architecture (for example, a 32-bit binary running on 64-bit
      #   hardware).
      #
      #   @return [String, nil]
      optional :architecture, String, api_name: :Architecture

      # @!attribute cdi_spec_dirs
      #   List of directories where (Container Device Interface) CDI specifications are
      #   located.
      #
      #   These specifications define vendor-specific modifications to an OCI runtime
      #   specification for a container being created.
      #
      #   An empty list indicates that CDI device injection is disabled.
      #
      #   Note that since using CDI device injection requires the daemon to have
      #   experimental enabled. For non-experimental daemons an empty list will always be
      #   returned.
      #
      #   @return [Array<String>, nil]
      optional :cdi_spec_dirs, Docker::Internal::Type::ArrayOf[String], api_name: :CDISpecDirs

      # @!attribute cgroup_driver
      #   The driver to use for managing cgroups.
      #
      #   @return [Symbol, Docker::Models::SystemInfoResponse::CgroupDriver, nil]
      optional :cgroup_driver,
               enum: -> { Docker::Models::SystemInfoResponse::CgroupDriver },
               api_name: :CgroupDriver

      # @!attribute cgroup_version
      #   The version of the cgroup.
      #
      #   @return [Symbol, Docker::Models::SystemInfoResponse::CgroupVersion, nil]
      optional :cgroup_version,
               enum: -> { Docker::Models::SystemInfoResponse::CgroupVersion },
               api_name: :CgroupVersion

      # @!attribute containerd
      #   Information for connecting to the containerd instance that is used by the
      #   daemon. This is included for debugging purposes only.
      #
      #   @return [Docker::Models::SystemInfoResponse::Containerd, nil]
      optional :containerd,
               -> { Docker::Models::SystemInfoResponse::Containerd },
               api_name: :Containerd,
               nil?: true

      # @!attribute containerd_commit
      #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      #   the version-string of external tools, such as `containerd`, or `runC`.
      #
      #   @return [Docker::Models::SystemInfoResponse::ContainerdCommit, nil]
      optional :containerd_commit,
               -> { Docker::Models::SystemInfoResponse::ContainerdCommit },
               api_name: :ContainerdCommit

      # @!attribute containers
      #   Total number of containers on the host.
      #
      #   @return [Integer, nil]
      optional :containers, Integer, api_name: :Containers

      # @!attribute containers_paused
      #   Number of containers with status `"paused"`.
      #
      #   @return [Integer, nil]
      optional :containers_paused, Integer, api_name: :ContainersPaused

      # @!attribute containers_running
      #   Number of containers with status `"running"`.
      #
      #   @return [Integer, nil]
      optional :containers_running, Integer, api_name: :ContainersRunning

      # @!attribute containers_stopped
      #   Number of containers with status `"stopped"`.
      #
      #   @return [Integer, nil]
      optional :containers_stopped, Integer, api_name: :ContainersStopped

      # @!attribute cpu_cfs_period
      #   Indicates if CPU CFS(Completely Fair Scheduler) period is supported by the host.
      #
      #   @return [Boolean, nil]
      optional :cpu_cfs_period, Docker::Internal::Type::Boolean, api_name: :CpuCfsPeriod

      # @!attribute cpu_cfs_quota
      #   Indicates if CPU CFS(Completely Fair Scheduler) quota is supported by the host.
      #
      #   @return [Boolean, nil]
      optional :cpu_cfs_quota, Docker::Internal::Type::Boolean, api_name: :CpuCfsQuota

      # @!attribute cpu_set
      #   Indicates if CPUsets (cpuset.cpus, cpuset.mems) are supported by the host.
      #
      #   See [cpuset(7)](https://www.kernel.org/doc/Documentation/cgroup-v1/cpusets.txt)
      #
      #   @return [Boolean, nil]
      optional :cpu_set, Docker::Internal::Type::Boolean, api_name: :CPUSet

      # @!attribute cpu_shares
      #   Indicates if CPU Shares limiting is supported by the host.
      #
      #   @return [Boolean, nil]
      optional :cpu_shares, Docker::Internal::Type::Boolean, api_name: :CPUShares

      # @!attribute debug
      #   Indicates if the daemon is running in debug-mode / with debug-level logging
      #   enabled.
      #
      #   @return [Boolean, nil]
      optional :debug, Docker::Internal::Type::Boolean, api_name: :Debug

      # @!attribute default_address_pools
      #   List of custom default address pools for local networks, which can be specified
      #   in the daemon.json file or dockerd option.
      #
      #   Example: a Base "10.10.0.0/16" with Size 24 will define the set of 256
      #   10.10.[0-255].0/24 address pools.
      #
      #   @return [Array<Docker::Models::SystemInfoResponse::DefaultAddressPool>, nil]
      optional :default_address_pools,
               -> { Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::DefaultAddressPool] },
               api_name: :DefaultAddressPools

      # @!attribute default_runtime
      #   Name of the default OCI runtime that is used when starting containers.
      #
      #   The default can be overridden per-container at create time.
      #
      #   @return [String, nil]
      optional :default_runtime, String, api_name: :DefaultRuntime

      # @!attribute discovered_devices
      #   List of devices discovered by device drivers.
      #
      #   Each device includes information about its source driver, kind, name, and
      #   additional driver-specific attributes.
      #
      #   @return [Array<Docker::Models::SystemInfoResponse::DiscoveredDevice>, nil]
      optional :discovered_devices,
               -> { Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::DiscoveredDevice] },
               api_name: :DiscoveredDevices

      # @!attribute docker_root_dir
      #   Root directory of persistent Docker state.
      #
      #   Defaults to `/var/lib/docker` on Linux, and `C:\ProgramData\docker` on Windows.
      #
      #   @return [String, nil]
      optional :docker_root_dir, String, api_name: :DockerRootDir

      # @!attribute driver
      #   Name of the storage driver in use.
      #
      #   @return [String, nil]
      optional :driver, String, api_name: :Driver

      # @!attribute driver_status
      #   Information specific to the storage driver, provided as "label" / "value" pairs.
      #
      #   This information is provided by the storage driver, and formatted in a way
      #   consistent with the output of `docker info` on the command line.
      #
      #   <p><br /></p>
      #
      #   > **Note**: The information returned in this field, including the formatting of
      #   > values and labels, should not be considered stable, and may change without
      #   > notice.
      #
      #   @return [Array<Array<String>>, nil]
      optional :driver_status,
               Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
               api_name: :DriverStatus

      # @!attribute experimental_build
      #   Indicates if experimental features are enabled on the daemon.
      #
      #   @return [Boolean, nil]
      optional :experimental_build, Docker::Internal::Type::Boolean, api_name: :ExperimentalBuild

      # @!attribute firewall_backend
      #   Information about the daemon's firewalling configuration.
      #
      #   This field is currently only used on Linux, and omitted on other platforms.
      #
      #   @return [Docker::Models::SystemInfoResponse::FirewallBackend, nil]
      optional :firewall_backend,
               -> { Docker::Models::SystemInfoResponse::FirewallBackend },
               api_name: :FirewallBackend,
               nil?: true

      # @!attribute generic_resources
      #   User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
      #   resources (e.g, `GPU=UUID1`).
      #
      #   @return [Array<Docker::Models::SystemInfoResponse::GenericResource>, nil]
      optional :generic_resources,
               -> { Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::GenericResource] },
               api_name: :GenericResources

      # @!attribute http_proxy
      #   HTTP-proxy configured for the daemon. This value is obtained from the
      #   [`HTTP_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      #   environment variable. Credentials
      #   ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
      #   the proxy URL are masked in the API response.
      #
      #   Containers do not automatically inherit this configuration.
      #
      #   @return [String, nil]
      optional :http_proxy, String, api_name: :HttpProxy

      # @!attribute https_proxy
      #   HTTPS-proxy configured for the daemon. This value is obtained from the
      #   [`HTTPS_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      #   environment variable. Credentials
      #   ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
      #   the proxy URL are masked in the API response.
      #
      #   Containers do not automatically inherit this configuration.
      #
      #   @return [String, nil]
      optional :https_proxy, String, api_name: :HttpsProxy

      # @!attribute id
      #   Unique identifier of the daemon.
      #
      #   <p><br /></p>
      #
      #   > **Note**: The format of the ID itself is not part of the API, and should not
      #   > be considered stable.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :ID

      # @!attribute images
      #   Total number of images on the host.
      #
      #   Both _tagged_ and _untagged_ (dangling) images are counted.
      #
      #   @return [Integer, nil]
      optional :images, Integer, api_name: :Images

      # @!attribute index_server_address
      #   Address / URL of the index server that is used for image search, and as a
      #   default for user authentication for Docker Hub and Docker Cloud.
      #
      #   @return [String, nil]
      optional :index_server_address, String, api_name: :IndexServerAddress

      # @!attribute init_binary
      #   Name and, optional, path of the `docker-init` binary.
      #
      #   If the path is omitted, the daemon searches the host's `$PATH` for the binary
      #   and uses the first result.
      #
      #   @return [String, nil]
      optional :init_binary, String, api_name: :InitBinary

      # @!attribute init_commit
      #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      #   the version-string of external tools, such as `containerd`, or `runC`.
      #
      #   @return [Docker::Models::SystemInfoResponse::InitCommit, nil]
      optional :init_commit, -> { Docker::Models::SystemInfoResponse::InitCommit }, api_name: :InitCommit

      # @!attribute i_pv4_forwarding
      #   Indicates IPv4 forwarding is enabled.
      #
      #   @return [Boolean, nil]
      optional :i_pv4_forwarding, Docker::Internal::Type::Boolean, api_name: :IPv4Forwarding

      # @!attribute isolation
      #   Represents the isolation technology to use as a default for containers. The
      #   supported values are platform-specific.
      #
      #   If no isolation value is specified on daemon start, on Windows client, the
      #   default is `hyperv`, and on Windows server, the default is `process`.
      #
      #   This option is currently not used on other platforms.
      #
      #   @return [Symbol, Docker::Models::SystemInfoResponse::Isolation, nil]
      optional :isolation, enum: -> { Docker::Models::SystemInfoResponse::Isolation }, api_name: :Isolation

      # @!attribute kernel_version
      #   Kernel version of the host.
      #
      #   On Linux, this information obtained from `uname`. On Windows this information is
      #   queried from the <kbd>HKEY*LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows
      #   NT\\CurrentVersion\\</kbd> registry value, for example *"10.0 14393
      #   (14393.1198.amd64fre.rs1*release_sec.170427-1353)"*.
      #
      #   @return [String, nil]
      optional :kernel_version, String, api_name: :KernelVersion

      # @!attribute labels
      #   User-defined labels (key/value metadata) as set on the daemon.
      #
      #   <p><br /></p>
      #
      #   > **Note**: When part of a Swarm, nodes can both have _daemon_ labels, set
      #   > through the daemon configuration, and _node_ labels, set from a manager node
      #   > in the Swarm. Node labels are not included in this field. Node labels can be
      #   > retrieved using the `/nodes/(id)` endpoint on a manager node in the Swarm.
      #
      #   @return [Array<String>, nil]
      optional :labels, Docker::Internal::Type::ArrayOf[String], api_name: :Labels

      # @!attribute live_restore_enabled
      #   Indicates if live restore is enabled.
      #
      #   If enabled, containers are kept running when the daemon is shutdown or upon
      #   daemon start if running containers are detected.
      #
      #   @return [Boolean, nil]
      optional :live_restore_enabled, Docker::Internal::Type::Boolean, api_name: :LiveRestoreEnabled

      # @!attribute logging_driver
      #   The logging driver to use as a default for new containers.
      #
      #   @return [String, nil]
      optional :logging_driver, String, api_name: :LoggingDriver

      # @!attribute memory_limit
      #   Indicates if the host has memory limit support enabled.
      #
      #   @return [Boolean, nil]
      optional :memory_limit, Docker::Internal::Type::Boolean, api_name: :MemoryLimit

      # @!attribute mem_total
      #   Total amount of physical memory available on the host, in bytes.
      #
      #   @return [Integer, nil]
      optional :mem_total, Integer, api_name: :MemTotal

      # @!attribute name
      #   Hostname of the host.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute ncpu
      #   The number of logical CPUs usable by the daemon.
      #
      #   The number of available CPUs is checked by querying the operating system when
      #   the daemon starts. Changes to operating system CPU allocation after the daemon
      #   is started are not reflected.
      #
      #   @return [Integer, nil]
      optional :ncpu, Integer, api_name: :NCPU

      # @!attribute n_events_listener
      #   Number of event listeners subscribed.
      #
      #   @return [Integer, nil]
      optional :n_events_listener, Integer, api_name: :NEventsListener

      # @!attribute n_fd
      #   The total number of file Descriptors in use by the daemon process.
      #
      #   This information is only returned if debug-mode is enabled.
      #
      #   @return [Integer, nil]
      optional :n_fd, Integer, api_name: :NFd

      # @!attribute n_goroutines
      #   The number of goroutines that currently exist.
      #
      #   This information is only returned if debug-mode is enabled.
      #
      #   @return [Integer, nil]
      optional :n_goroutines, Integer, api_name: :NGoroutines

      # @!attribute no_proxy
      #   Comma-separated list of domain extensions for which no proxy should be used.
      #   This value is obtained from the
      #   [`NO_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      #   environment variable.
      #
      #   Containers do not automatically inherit this configuration.
      #
      #   @return [String, nil]
      optional :no_proxy, String, api_name: :NoProxy

      # @!attribute nri
      #   Information about the Node Resource Interface (NRI).
      #
      #   This field is only present if NRI is enabled.
      #
      #   @return [Docker::Models::SystemInfoResponse::Nri, nil]
      optional :nri, -> { Docker::Models::SystemInfoResponse::Nri }, api_name: :NRI, nil?: true

      # @!attribute oom_kill_disable
      #   Indicates if OOM killer disable is supported on the host.
      #
      #   @return [Boolean, nil]
      optional :oom_kill_disable, Docker::Internal::Type::Boolean, api_name: :OomKillDisable

      # @!attribute operating_system
      #   Name of the host's operating system, for example: "Ubuntu 24.04 LTS" or "Windows
      #   Server 2016 Datacenter"
      #
      #   @return [String, nil]
      optional :operating_system, String, api_name: :OperatingSystem

      # @!attribute os_type
      #   Generic type of the operating system of the host, as returned by the Go runtime
      #   (`GOOS`).
      #
      #   Currently returned values are "linux" and "windows". A full list of possible
      #   values can be found in the
      #   [Go documentation](https://go.dev/doc/install/source#environment).
      #
      #   @return [String, nil]
      optional :os_type, String, api_name: :OSType

      # @!attribute os_version
      #   Version of the host's operating system
      #
      #   <p><br /></p>
      #
      #   > **Note**: The information returned in this field, including its very
      #   > existence, and the formatting of values, should not be considered stable, and
      #   > may change without notice.
      #
      #   @return [String, nil]
      optional :os_version, String, api_name: :OSVersion

      # @!attribute pids_limit
      #   Indicates if the host kernel has PID limit support enabled.
      #
      #   @return [Boolean, nil]
      optional :pids_limit, Docker::Internal::Type::Boolean, api_name: :PidsLimit

      # @!attribute plugins
      #   Available plugins per type.
      #
      #   <p><br /></p>
      #
      #   > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
      #   > are "lazily" loaded, and are not returned in this list if there is no resource
      #   > using the plugin.
      #
      #   @return [Docker::Models::SystemInfoResponse::Plugins, nil]
      optional :plugins, -> { Docker::Models::SystemInfoResponse::Plugins }, api_name: :Plugins

      # @!attribute product_license
      #   Reports a summary of the product license on the daemon.
      #
      #   If a commercial license has been applied to the daemon, information such as
      #   number of nodes, and expiration are included.
      #
      #   @return [String, nil]
      optional :product_license, String, api_name: :ProductLicense

      # @!attribute registry_config
      #   RegistryServiceConfig stores daemon registry services configuration.
      #
      #   @return [Docker::Models::SystemInfoResponse::RegistryConfig, nil]
      optional :registry_config,
               -> { Docker::Models::SystemInfoResponse::RegistryConfig },
               api_name: :RegistryConfig,
               nil?: true

      # @!attribute runc_commit
      #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      #   the version-string of external tools, such as `containerd`, or `runC`.
      #
      #   @return [Docker::Models::SystemInfoResponse::RuncCommit, nil]
      optional :runc_commit, -> { Docker::Models::SystemInfoResponse::RuncCommit }, api_name: :RuncCommit

      # @!attribute runtimes
      #   List of [OCI compliant](https://github.com/opencontainers/runtime-spec) runtimes
      #   configured on the daemon. Keys hold the "name" used to reference the runtime.
      #
      #   The Docker daemon relies on an OCI compliant runtime (invoked via the
      #   `containerd` daemon) as its interface to the Linux kernel namespaces, cgroups,
      #   and SELinux.
      #
      #   The default runtime is `runc`, and automatically configured. Additional runtimes
      #   can be configured by the user and will be listed here.
      #
      #   @return [Hash{Symbol=>Docker::Models::SystemInfoResponse::Runtime}, nil]
      optional :runtimes,
               -> { Docker::Internal::Type::HashOf[Docker::Models::SystemInfoResponse::Runtime] },
               api_name: :Runtimes

      # @!attribute security_options
      #   List of security features that are enabled on the daemon, such as apparmor,
      #   seccomp, SELinux, user-namespaces (userns), rootless and no-new-privileges.
      #
      #   Additional configuration options for each security feature may be present, and
      #   are included as a comma-separated list of key/value pairs.
      #
      #   @return [Array<String>, nil]
      optional :security_options, Docker::Internal::Type::ArrayOf[String], api_name: :SecurityOptions

      # @!attribute server_version
      #   Version string of the daemon.
      #
      #   @return [String, nil]
      optional :server_version, String, api_name: :ServerVersion

      # @!attribute swap_limit
      #   Indicates if the host has memory swap limit support enabled.
      #
      #   @return [Boolean, nil]
      optional :swap_limit, Docker::Internal::Type::Boolean, api_name: :SwapLimit

      # @!attribute swarm
      #   Represents generic information about swarm.
      #
      #   @return [Docker::Models::SystemInfoResponse::Swarm, nil]
      optional :swarm, -> { Docker::Models::SystemInfoResponse::Swarm }, api_name: :Swarm

      # @!attribute system_time
      #   Current system-time in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format
      #   with nano-seconds.
      #
      #   @return [String, nil]
      optional :system_time, String, api_name: :SystemTime

      # @!attribute warnings
      #   List of warnings / informational messages about missing features, or issues
      #   related to the daemon configuration.
      #
      #   These messages can be printed by the client as information to the user.
      #
      #   @return [Array<String>, nil]
      optional :warnings, Docker::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(architecture: nil, cdi_spec_dirs: nil, cgroup_driver: nil, cgroup_version: nil, containerd: nil, containerd_commit: nil, containers: nil, containers_paused: nil, containers_running: nil, containers_stopped: nil, cpu_cfs_period: nil, cpu_cfs_quota: nil, cpu_set: nil, cpu_shares: nil, debug: nil, default_address_pools: nil, default_runtime: nil, discovered_devices: nil, docker_root_dir: nil, driver: nil, driver_status: nil, experimental_build: nil, firewall_backend: nil, generic_resources: nil, http_proxy: nil, https_proxy: nil, id: nil, images: nil, index_server_address: nil, init_binary: nil, init_commit: nil, i_pv4_forwarding: nil, isolation: nil, kernel_version: nil, labels: nil, live_restore_enabled: nil, logging_driver: nil, memory_limit: nil, mem_total: nil, name: nil, ncpu: nil, n_events_listener: nil, n_fd: nil, n_goroutines: nil, no_proxy: nil, nri: nil, oom_kill_disable: nil, operating_system: nil, os_type: nil, os_version: nil, pids_limit: nil, plugins: nil, product_license: nil, registry_config: nil, runc_commit: nil, runtimes: nil, security_options: nil, server_version: nil, swap_limit: nil, swarm: nil, system_time: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::SystemInfoResponse} for more details.
      #
      #   @param architecture [String] Hardware architecture of the host, as returned by the operating system.
      #
      #   @param cdi_spec_dirs [Array<String>] List of directories where (Container Device Interface) CDI
      #
      #   @param cgroup_driver [Symbol, Docker::Models::SystemInfoResponse::CgroupDriver] The driver to use for managing cgroups.
      #
      #   @param cgroup_version [Symbol, Docker::Models::SystemInfoResponse::CgroupVersion] The version of the cgroup.
      #
      #   @param containerd [Docker::Models::SystemInfoResponse::Containerd, nil] Information for connecting to the containerd instance that is used by the daemon
      #
      #   @param containerd_commit [Docker::Models::SystemInfoResponse::ContainerdCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
      #
      #   @param containers [Integer] Total number of containers on the host.
      #
      #   @param containers_paused [Integer] Number of containers with status `"paused"`.
      #
      #   @param containers_running [Integer] Number of containers with status `"running"`.
      #
      #   @param containers_stopped [Integer] Number of containers with status `"stopped"`.
      #
      #   @param cpu_cfs_period [Boolean] Indicates if CPU CFS(Completely Fair Scheduler) period is supported by
      #
      #   @param cpu_cfs_quota [Boolean] Indicates if CPU CFS(Completely Fair Scheduler) quota is supported by
      #
      #   @param cpu_set [Boolean] Indicates if CPUsets (cpuset.cpus, cpuset.mems) are supported by the host.
      #
      #   @param cpu_shares [Boolean] Indicates if CPU Shares limiting is supported by the host.
      #
      #   @param debug [Boolean] Indicates if the daemon is running in debug-mode / with debug-level
      #
      #   @param default_address_pools [Array<Docker::Models::SystemInfoResponse::DefaultAddressPool>] List of custom default address pools for local networks, which can be
      #
      #   @param default_runtime [String] Name of the default OCI runtime that is used when starting containers.
      #
      #   @param discovered_devices [Array<Docker::Models::SystemInfoResponse::DiscoveredDevice>] List of devices discovered by device drivers.
      #
      #   @param docker_root_dir [String] Root directory of persistent Docker state.
      #
      #   @param driver [String] Name of the storage driver in use.
      #
      #   @param driver_status [Array<Array<String>>] Information specific to the storage driver, provided as
      #
      #   @param experimental_build [Boolean] Indicates if experimental features are enabled on the daemon.
      #
      #   @param firewall_backend [Docker::Models::SystemInfoResponse::FirewallBackend, nil] Information about the daemon's firewalling configuration.
      #
      #   @param generic_resources [Array<Docker::Models::SystemInfoResponse::GenericResource>] User-defined resources can be either Integer resources (e.g, `SSD=3`) or
      #
      #   @param http_proxy [String] HTTP-proxy configured for the daemon. This value is obtained from the
      #
      #   @param https_proxy [String] HTTPS-proxy configured for the daemon. This value is obtained from the
      #
      #   @param id [String] Unique identifier of the daemon.
      #
      #   @param images [Integer] Total number of images on the host.
      #
      #   @param index_server_address [String] Address / URL of the index server that is used for image search,
      #
      #   @param init_binary [String] Name and, optional, path of the `docker-init` binary.
      #
      #   @param init_commit [Docker::Models::SystemInfoResponse::InitCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
      #
      #   @param i_pv4_forwarding [Boolean] Indicates IPv4 forwarding is enabled.
      #
      #   @param isolation [Symbol, Docker::Models::SystemInfoResponse::Isolation] Represents the isolation technology to use as a default for containers.
      #
      #   @param kernel_version [String] Kernel version of the host.
      #
      #   @param labels [Array<String>] User-defined labels (key/value metadata) as set on the daemon.
      #
      #   @param live_restore_enabled [Boolean] Indicates if live restore is enabled.
      #
      #   @param logging_driver [String] The logging driver to use as a default for new containers.
      #
      #   @param memory_limit [Boolean] Indicates if the host has memory limit support enabled.
      #
      #   @param mem_total [Integer] Total amount of physical memory available on the host, in bytes.
      #
      #   @param name [String] Hostname of the host.
      #
      #   @param ncpu [Integer] The number of logical CPUs usable by the daemon.
      #
      #   @param n_events_listener [Integer] Number of event listeners subscribed.
      #
      #   @param n_fd [Integer] The total number of file Descriptors in use by the daemon process.
      #
      #   @param n_goroutines [Integer] The number of goroutines that currently exist.
      #
      #   @param no_proxy [String] Comma-separated list of domain extensions for which no proxy should be
      #
      #   @param nri [Docker::Models::SystemInfoResponse::Nri, nil] Information about the Node Resource Interface (NRI).
      #
      #   @param oom_kill_disable [Boolean] Indicates if OOM killer disable is supported on the host.
      #
      #   @param operating_system [String] Name of the host's operating system, for example: "Ubuntu 24.04 LTS"
      #
      #   @param os_type [String] Generic type of the operating system of the host, as returned by the
      #
      #   @param os_version [String] Version of the host's operating system
      #
      #   @param pids_limit [Boolean] Indicates if the host kernel has PID limit support enabled.
      #
      #   @param plugins [Docker::Models::SystemInfoResponse::Plugins] Available plugins per type.
      #
      #   @param product_license [String] Reports a summary of the product license on the daemon.
      #
      #   @param registry_config [Docker::Models::SystemInfoResponse::RegistryConfig, nil] RegistryServiceConfig stores daemon registry services configuration.
      #
      #   @param runc_commit [Docker::Models::SystemInfoResponse::RuncCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
      #
      #   @param runtimes [Hash{Symbol=>Docker::Models::SystemInfoResponse::Runtime}] List of [OCI compliant](https://github.com/opencontainers/runtime-spec)
      #
      #   @param security_options [Array<String>] List of security features that are enabled on the daemon, such as
      #
      #   @param server_version [String] Version string of the daemon.
      #
      #   @param swap_limit [Boolean] Indicates if the host has memory swap limit support enabled.
      #
      #   @param swarm [Docker::Models::SystemInfoResponse::Swarm] Represents generic information about swarm.
      #
      #   @param system_time [String] Current system-time in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt)
      #
      #   @param warnings [Array<String>] List of warnings / informational messages about missing features, or

      # The driver to use for managing cgroups.
      #
      # @see Docker::Models::SystemInfoResponse#cgroup_driver
      module CgroupDriver
        extend Docker::Internal::Type::Enum

        CGROUPFS = :cgroupfs
        SYSTEMD = :systemd
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The version of the cgroup.
      #
      # @see Docker::Models::SystemInfoResponse#cgroup_version
      module CgroupVersion
        extend Docker::Internal::Type::Enum

        CGROUP_VERSION_1 = :"1"
        CGROUP_VERSION_2 = :"2"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Docker::Models::SystemInfoResponse#containerd
      class Containerd < Docker::Internal::Type::BaseModel
        # @!attribute address
        #   The address of the containerd socket.
        #
        #   @return [String, nil]
        optional :address, String, api_name: :Address

        # @!attribute namespaces
        #   The namespaces that the daemon uses for running containers and plugins in
        #   containerd. These namespaces can be configured in the daemon configuration, and
        #   are considered to be used exclusively by the daemon, Tampering with the
        #   containerd instance may cause unexpected behavior.
        #
        #   As these namespaces are considered to be exclusively accessed by the daemon, it
        #   is not recommended to change these values, or to change them to a value that is
        #   used by other systems, such as cri-containerd.
        #
        #   @return [Docker::Models::SystemInfoResponse::Containerd::Namespaces, nil]
        optional :namespaces,
                 -> { Docker::Models::SystemInfoResponse::Containerd::Namespaces },
                 api_name: :Namespaces

        # @!method initialize(address: nil, namespaces: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::Containerd} for more details.
        #
        #   Information for connecting to the containerd instance that is used by the
        #   daemon. This is included for debugging purposes only.
        #
        #   @param address [String] The address of the containerd socket.
        #
        #   @param namespaces [Docker::Models::SystemInfoResponse::Containerd::Namespaces] The namespaces that the daemon uses for running containers and

        # @see Docker::Models::SystemInfoResponse::Containerd#namespaces
        class Namespaces < Docker::Internal::Type::BaseModel
          # @!attribute containers
          #   The default containerd namespace used for containers managed by the daemon.
          #
          #   The default namespace for containers is "moby", but will be suffixed with the
          #   `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
          #   containerd image-store is used.
          #
          #   @return [String, nil]
          optional :containers, String, api_name: :Containers

          # @!attribute plugins
          #   The default containerd namespace used for plugins managed by the daemon.
          #
          #   The default namespace for plugins is "plugins.moby", but will be suffixed with
          #   the `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
          #   containerd image-store is used.
          #
          #   @return [String, nil]
          optional :plugins, String, api_name: :Plugins

          # @!method initialize(containers: nil, plugins: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::SystemInfoResponse::Containerd::Namespaces} for more details.
          #
          #   The namespaces that the daemon uses for running containers and plugins in
          #   containerd. These namespaces can be configured in the daemon configuration, and
          #   are considered to be used exclusively by the daemon, Tampering with the
          #   containerd instance may cause unexpected behavior.
          #
          #   As these namespaces are considered to be exclusively accessed by the daemon, it
          #   is not recommended to change these values, or to change them to a value that is
          #   used by other systems, such as cri-containerd.
          #
          #   @param containers [String] The default containerd namespace used for containers managed
          #
          #   @param plugins [String] The default containerd namespace used for plugins managed by
        end
      end

      # @see Docker::Models::SystemInfoResponse#containerd_commit
      class ContainerdCommit < Docker::Internal::Type::BaseModel
        # @!attribute id
        #   Actual commit ID of external tool.
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!method initialize(id: nil)
        #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        #   the version-string of external tools, such as `containerd`, or `runC`.
        #
        #   @param id [String] Actual commit ID of external tool.
      end

      class DefaultAddressPool < Docker::Internal::Type::BaseModel
        # @!attribute base
        #   The network address in CIDR format
        #
        #   @return [String, nil]
        optional :base, String, api_name: :Base

        # @!attribute size
        #   The network pool size
        #
        #   @return [Integer, nil]
        optional :size, Integer, api_name: :Size

        # @!method initialize(base: nil, size: nil)
        #   @param base [String] The network address in CIDR format
        #
        #   @param size [Integer] The network pool size
      end

      class DiscoveredDevice < Docker::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the device within its source driver. For CDI devices,
        #   this would be an FQDN like "vendor.com/gpu=0".
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!attribute source
        #   The origin device driver.
        #
        #   @return [String, nil]
        optional :source, String, api_name: :Source

        # @!method initialize(id: nil, source: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::DiscoveredDevice} for more details.
        #
        #   DeviceInfo represents a device that can be used by a container.
        #
        #   @param id [String] The unique identifier for the device within its source driver.
        #
        #   @param source [String] The origin device driver.
      end

      # @see Docker::Models::SystemInfoResponse#firewall_backend
      class FirewallBackend < Docker::Internal::Type::BaseModel
        # @!attribute driver
        #   The name of the firewall backend driver.
        #
        #   @return [String, nil]
        optional :driver, String, api_name: :Driver

        # @!attribute info
        #   Information about the firewall backend, provided as "label" / "value" pairs.
        #
        #   <p><br /></p>
        #
        #   > **Note**: The information returned in this field, including the formatting of
        #   > values and labels, should not be considered stable, and may change without
        #   > notice.
        #
        #   @return [Array<Array<String>>, nil]
        optional :info,
                 Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
                 api_name: :Info

        # @!method initialize(driver: nil, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::FirewallBackend} for more details.
        #
        #   Information about the daemon's firewalling configuration.
        #
        #   This field is currently only used on Linux, and omitted on other platforms.
        #
        #   @param driver [String] The name of the firewall backend driver.
        #
        #   @param info [Array<Array<String>>] Information about the firewall backend, provided as
      end

      class GenericResource < Docker::Internal::Type::BaseModel
        # @!attribute discrete_resource_spec
        #
        #   @return [Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec, nil]
        optional :discrete_resource_spec,
                 -> { Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec },
                 api_name: :DiscreteResourceSpec

        # @!attribute named_resource_spec
        #
        #   @return [Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec, nil]
        optional :named_resource_spec,
                 -> { Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec },
                 api_name: :NamedResourceSpec

        # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
        #   @param discrete_resource_spec [Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec]
        #   @param named_resource_spec [Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec]

        # @see Docker::Models::SystemInfoResponse::GenericResource#discrete_resource_spec
        class DiscreteResourceSpec < Docker::Internal::Type::BaseModel
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

        # @see Docker::Models::SystemInfoResponse::GenericResource#named_resource_spec
        class NamedResourceSpec < Docker::Internal::Type::BaseModel
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

      # @see Docker::Models::SystemInfoResponse#init_commit
      class InitCommit < Docker::Internal::Type::BaseModel
        # @!attribute id
        #   Actual commit ID of external tool.
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!method initialize(id: nil)
        #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        #   the version-string of external tools, such as `containerd`, or `runC`.
        #
        #   @param id [String] Actual commit ID of external tool.
      end

      # Represents the isolation technology to use as a default for containers. The
      # supported values are platform-specific.
      #
      # If no isolation value is specified on daemon start, on Windows client, the
      # default is `hyperv`, and on Windows server, the default is `process`.
      #
      # This option is currently not used on other platforms.
      #
      # @see Docker::Models::SystemInfoResponse#isolation
      module Isolation
        extend Docker::Internal::Type::Enum

        DEFAULT = :default
        HYPERV = :hyperv
        PROCESS = :process
        EMPTY = :""

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Docker::Models::SystemInfoResponse#nri
      class Nri < Docker::Internal::Type::BaseModel
        # @!attribute info
        #   Information about NRI, provided as "label" / "value" pairs.
        #
        #   <p><br /></p>
        #
        #   > **Note**: The information returned in this field, including the formatting of
        #   > values and labels, should not be considered stable, and may change without
        #   > notice.
        #
        #   @return [Array<Array<String>>, nil]
        optional :info,
                 Docker::Internal::Type::ArrayOf[Docker::Internal::Type::ArrayOf[String]],
                 api_name: :Info

        # @!method initialize(info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::Nri} for more details.
        #
        #   Information about the Node Resource Interface (NRI).
        #
        #   This field is only present if NRI is enabled.
        #
        #   @param info [Array<Array<String>>] Information about NRI, provided as "label" / "value" pairs.
      end

      # @see Docker::Models::SystemInfoResponse#plugins
      class Plugins < Docker::Internal::Type::BaseModel
        # @!attribute authorization
        #   Names of available authorization plugins.
        #
        #   @return [Array<String>, nil]
        optional :authorization, Docker::Internal::Type::ArrayOf[String], api_name: :Authorization

        # @!attribute log
        #   Names of available logging-drivers, and logging-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :log, Docker::Internal::Type::ArrayOf[String], api_name: :Log

        # @!attribute network
        #   Names of available network-drivers, and network-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :network, Docker::Internal::Type::ArrayOf[String], api_name: :Network

        # @!attribute volume
        #   Names of available volume-drivers, and network-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :volume, Docker::Internal::Type::ArrayOf[String], api_name: :Volume

        # @!method initialize(authorization: nil, log: nil, network: nil, volume: nil)
        #   Available plugins per type.
        #
        #   <p><br /></p>
        #
        #   > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
        #   > are "lazily" loaded, and are not returned in this list if there is no resource
        #   > using the plugin.
        #
        #   @param authorization [Array<String>] Names of available authorization plugins.
        #
        #   @param log [Array<String>] Names of available logging-drivers, and logging-driver plugins.
        #
        #   @param network [Array<String>] Names of available network-drivers, and network-driver plugins.
        #
        #   @param volume [Array<String>] Names of available volume-drivers, and network-driver plugins.
      end

      # @see Docker::Models::SystemInfoResponse#registry_config
      class RegistryConfig < Docker::Internal::Type::BaseModel
        # @!attribute index_configs
        #
        #   @return [Hash{Symbol=>Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig, nil}, nil]
        optional :index_configs,
                 -> { Docker::Internal::Type::HashOf[Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig, nil?: true] },
                 api_name: :IndexConfigs

        # @!attribute insecure_registry_cid_rs
        #   List of IP ranges of insecure registries, using the CIDR syntax
        #   ([RFC 4632](https://tools.ietf.org/html/4632)). Insecure registries accept
        #   un-encrypted (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
        #   communication.
        #
        #   By default, local registries (`::1/128` and `127.0.0.0/8`) are configured as
        #   insecure. All other registries are secure. Communicating with an insecure
        #   registry is not possible if the daemon assumes that registry is secure.
        #
        #   This configuration override this behavior, insecure communication with
        #   registries whose resolved IP address is within the subnet described by the CIDR
        #   syntax.
        #
        #   Registries can also be marked insecure by hostname. Those registries are listed
        #   under `IndexConfigs` and have their `Secure` field set to `false`.
        #
        #   > **Warning**: Using this option can be useful when running a local registry,
        #   > but introduces security vulnerabilities. This option should therefore ONLY be
        #   > used for testing purposes. For increased security, users should add their CA
        #   > to their system's list of trusted CAs instead of enabling this option.
        #
        #   @return [Array<String>, nil]
        optional :insecure_registry_cid_rs,
                 Docker::Internal::Type::ArrayOf[String],
                 api_name: :InsecureRegistryCIDRs

        # @!attribute mirrors
        #   List of registry URLs that act as a mirror for the official (`docker.io`)
        #   registry.
        #
        #   @return [Array<String>, nil]
        optional :mirrors, Docker::Internal::Type::ArrayOf[String], api_name: :Mirrors

        # @!method initialize(index_configs: nil, insecure_registry_cid_rs: nil, mirrors: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::RegistryConfig} for more details.
        #
        #   RegistryServiceConfig stores daemon registry services configuration.
        #
        #   @param index_configs [Hash{Symbol=>Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig, nil}]
        #
        #   @param insecure_registry_cid_rs [Array<String>] List of IP ranges of insecure registries, using the CIDR syntax
        #
        #   @param mirrors [Array<String>] List of registry URLs that act as a mirror for the official

        class IndexConfig < Docker::Internal::Type::BaseModel
          # @!attribute mirrors
          #   List of mirrors, expressed as URIs.
          #
          #   @return [Array<String>, nil]
          optional :mirrors, Docker::Internal::Type::ArrayOf[String], api_name: :Mirrors

          # @!attribute name
          #   Name of the registry, such as "docker.io".
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute official
          #   Indicates whether this is an official registry (i.e., Docker Hub / docker.io)
          #
          #   @return [Boolean, nil]
          optional :official, Docker::Internal::Type::Boolean, api_name: :Official

          # @!attribute secure
          #   Indicates if the registry is part of the list of insecure registries.
          #
          #   If `false`, the registry is insecure. Insecure registries accept un-encrypted
          #   (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
          #   communication.
          #
          #   > **Warning**: Insecure registries can be useful when running a local registry.
          #   > However, because its use creates security vulnerabilities it should ONLY be
          #   > enabled for testing purposes. For increased security, users should add their
          #   > CA to their system's list of trusted CAs instead of enabling this option.
          #
          #   @return [Boolean, nil]
          optional :secure, Docker::Internal::Type::Boolean, api_name: :Secure

          # @!method initialize(mirrors: nil, name: nil, official: nil, secure: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig} for more
          #   details.
          #
          #   IndexInfo contains information about a registry.
          #
          #   @param mirrors [Array<String>] List of mirrors, expressed as URIs.
          #
          #   @param name [String] Name of the registry, such as "docker.io".
          #
          #   @param official [Boolean] Indicates whether this is an official registry (i.e., Docker Hub / docker.io)
          #
          #   @param secure [Boolean] Indicates if the registry is part of the list of insecure
        end
      end

      # @see Docker::Models::SystemInfoResponse#runc_commit
      class RuncCommit < Docker::Internal::Type::BaseModel
        # @!attribute id
        #   Actual commit ID of external tool.
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!method initialize(id: nil)
        #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        #   the version-string of external tools, such as `containerd`, or `runC`.
        #
        #   @param id [String] Actual commit ID of external tool.
      end

      class Runtime < Docker::Internal::Type::BaseModel
        # @!attribute path
        #   Name and, optional, path, of the OCI executable binary.
        #
        #   If the path is omitted, the daemon searches the host's `$PATH` for the binary
        #   and uses the first result.
        #
        #   @return [String, nil]
        optional :path, String

        # @!attribute runtime_args
        #   List of command-line arguments to pass to the runtime when invoked.
        #
        #   @return [Array<String>, nil]
        optional :runtime_args, Docker::Internal::Type::ArrayOf[String], api_name: :runtimeArgs, nil?: true

        # @!attribute status
        #   Information specific to the runtime.
        #
        #   While this API specification does not define data provided by runtimes, the
        #   following well-known properties may be provided by runtimes:
        #
        #   `org.opencontainers.runtime-spec.features`: features structure as defined in the
        #   [OCI Runtime Specification](https://github.com/opencontainers/runtime-spec/blob/main/features.md),
        #   in a JSON string representation.
        #
        #   <p><br /></p>
        #
        #   > **Note**: The information returned in this field, including the formatting of
        #   > values and labels, should not be considered stable, and may change without
        #   > notice.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :status, Docker::Internal::Type::HashOf[String], nil?: true

        # @!method initialize(path: nil, runtime_args: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::Runtime} for more details.
        #
        #   Runtime describes an
        #   [OCI compliant](https://github.com/opencontainers/runtime-spec) runtime.
        #
        #   The runtime is invoked by the daemon via the `containerd` daemon. OCI runtimes
        #   act as an interface to the Linux kernel namespaces, cgroups, and SELinux.
        #
        #   @param path [String] Name and, optional, path, of the OCI executable binary.
        #
        #   @param runtime_args [Array<String>, nil] List of command-line arguments to pass to the runtime when invoked.
        #
        #   @param status [Hash{Symbol=>String}, nil] Information specific to the runtime.
      end

      # @see Docker::Models::SystemInfoResponse#swarm
      class Swarm < Docker::Internal::Type::BaseModel
        # @!attribute cluster
        #   ClusterInfo represents information about the swarm as is returned by the "/info"
        #   endpoint. Join-tokens are not included.
        #
        #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster, nil]
        optional :cluster,
                 -> { Docker::Models::SystemInfoResponse::Swarm::Cluster },
                 api_name: :Cluster,
                 nil?: true

        # @!attribute control_available
        #
        #   @return [Boolean, nil]
        optional :control_available, Docker::Internal::Type::Boolean, api_name: :ControlAvailable

        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String, api_name: :Error

        # @!attribute local_node_state
        #   Current local status of this node.
        #
        #   @return [Symbol, Docker::Models::SystemInfoResponse::Swarm::LocalNodeState, nil]
        optional :local_node_state,
                 enum: -> { Docker::Models::SystemInfoResponse::Swarm::LocalNodeState },
                 api_name: :LocalNodeState

        # @!attribute managers
        #   Total number of managers in the swarm.
        #
        #   @return [Integer, nil]
        optional :managers, Integer, api_name: :Managers, nil?: true

        # @!attribute node_addr
        #   IP address at which this node can be reached by other nodes in the swarm.
        #
        #   @return [String, nil]
        optional :node_addr, String, api_name: :NodeAddr

        # @!attribute node_id
        #   Unique identifier of for this node in the swarm.
        #
        #   @return [String, nil]
        optional :node_id, String, api_name: :NodeID

        # @!attribute nodes
        #   Total number of nodes in the swarm.
        #
        #   @return [Integer, nil]
        optional :nodes, Integer, api_name: :Nodes, nil?: true

        # @!attribute remote_managers
        #   List of ID's and addresses of other managers in the swarm.
        #
        #   @return [Array<Docker::Models::SystemInfoResponse::Swarm::RemoteManager>, nil]
        optional :remote_managers,
                 -> { Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::Swarm::RemoteManager] },
                 api_name: :RemoteManagers,
                 nil?: true

        # @!method initialize(cluster: nil, control_available: nil, error: nil, local_node_state: nil, managers: nil, node_addr: nil, node_id: nil, nodes: nil, remote_managers: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::SystemInfoResponse::Swarm} for more details.
        #
        #   Represents generic information about swarm.
        #
        #   @param cluster [Docker::Models::SystemInfoResponse::Swarm::Cluster, nil] ClusterInfo represents information about the swarm as is returned by the
        #
        #   @param control_available [Boolean]
        #
        #   @param error [String]
        #
        #   @param local_node_state [Symbol, Docker::Models::SystemInfoResponse::Swarm::LocalNodeState] Current local status of this node.
        #
        #   @param managers [Integer, nil] Total number of managers in the swarm.
        #
        #   @param node_addr [String] IP address at which this node can be reached by other nodes in the
        #
        #   @param node_id [String] Unique identifier of for this node in the swarm.
        #
        #   @param nodes [Integer, nil] Total number of nodes in the swarm.
        #
        #   @param remote_managers [Array<Docker::Models::SystemInfoResponse::Swarm::RemoteManager>, nil] List of ID's and addresses of other managers in the swarm.

        # @see Docker::Models::SystemInfoResponse::Swarm#cluster
        class Cluster < Docker::Internal::Type::BaseModel
          # @!attribute created_at
          #   Date and time at which the swarm was initialised in
          #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :CreatedAt

          # @!attribute data_path_port
          #   DataPathPort specifies the data path port number for data traffic. Acceptable
          #   port range is 1024 to 49151. If no port is set or is set to 0, the default port
          #   (4789) is used.
          #
          #   @return [Integer, nil]
          optional :data_path_port, Integer, api_name: :DataPathPort

          # @!attribute default_addr_pool
          #   Default Address Pool specifies default subnet pools for global scope networks.
          #
          #   @return [Array<String>, nil]
          optional :default_addr_pool, Docker::Internal::Type::ArrayOf[String], api_name: :DefaultAddrPool

          # @!attribute id
          #   The ID of the swarm.
          #
          #   @return [String, nil]
          optional :id, String, api_name: :ID

          # @!attribute root_rotation_in_progress
          #   Whether there is currently a root CA rotation in progress for the swarm
          #
          #   @return [Boolean, nil]
          optional :root_rotation_in_progress,
                   Docker::Internal::Type::Boolean,
                   api_name: :RootRotationInProgress

          # @!attribute spec
          #   User modifiable swarm configuration.
          #
          #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec, nil]
          optional :spec, -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec }, api_name: :Spec

          # @!attribute subnet_size
          #   SubnetSize specifies the subnet size of the networks created from the default
          #   subnet pool.
          #
          #   @return [Integer, nil]
          optional :subnet_size, Integer, api_name: :SubnetSize

          # @!attribute tls_info
          #   Information about the issuer of leaf TLS certificates and the trusted root CA
          #   certificate.
          #
          #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo, nil]
          optional :tls_info, -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo }, api_name: :TLSInfo

          # @!attribute updated_at
          #   Date and time at which the swarm was last updated in
          #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
          #
          #   @return [String, nil]
          optional :updated_at, String, api_name: :UpdatedAt

          # @!attribute version
          #   The version number of the object such as node, service, etc. This is needed to
          #   avoid conflicting writes. The client must send the version number along with the
          #   modified specification when updating these objects.
          #
          #   This approach ensures safe concurrency and determinism in that the change on the
          #   object may not be applied if the version number has changed from the last read.
          #   In other words, if two update requests specify the same base version, only one
          #   of the requests can succeed. As a result, two separate update requests that
          #   happen at the same time will not unintentionally overwrite each other.
          #
          #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Version, nil]
          optional :version, -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Version }, api_name: :Version

          # @!method initialize(created_at: nil, data_path_port: nil, default_addr_pool: nil, id: nil, root_rotation_in_progress: nil, spec: nil, subnet_size: nil, tls_info: nil, updated_at: nil, version: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::SystemInfoResponse::Swarm::Cluster} for more details.
          #
          #   ClusterInfo represents information about the swarm as is returned by the "/info"
          #   endpoint. Join-tokens are not included.
          #
          #   @param created_at [String] Date and time at which the swarm was initialised in
          #
          #   @param data_path_port [Integer] DataPathPort specifies the data path port number for data traffic.
          #
          #   @param default_addr_pool [Array<String>] Default Address Pool specifies default subnet pools for global scope
          #
          #   @param id [String] The ID of the swarm.
          #
          #   @param root_rotation_in_progress [Boolean] Whether there is currently a root CA rotation in progress for the swarm
          #
          #   @param spec [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec] User modifiable swarm configuration.
          #
          #   @param subnet_size [Integer] SubnetSize specifies the subnet size of the networks created from the
          #
          #   @param tls_info [Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo] Information about the issuer of leaf TLS certificates and the trusted root
          #
          #   @param updated_at [String] Date and time at which the swarm was last updated in
          #
          #   @param version [Docker::Models::SystemInfoResponse::Swarm::Cluster::Version] The version number of the object such as node, service, etc. This is needed

          # @see Docker::Models::SystemInfoResponse::Swarm::Cluster#spec
          class Spec < Docker::Internal::Type::BaseModel
            # @!attribute ca_config
            #   CA configuration.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig, nil]
            optional :ca_config,
                     -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig },
                     api_name: :CAConfig,
                     nil?: true

            # @!attribute dispatcher
            #   Dispatcher configuration.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher, nil]
            optional :dispatcher,
                     -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher },
                     api_name: :Dispatcher,
                     nil?: true

            # @!attribute encryption_config
            #   Parameters related to encryption-at-rest.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig, nil]
            optional :encryption_config,
                     -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig },
                     api_name: :EncryptionConfig

            # @!attribute labels
            #   User-defined key/value metadata.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

            # @!attribute name
            #   Name of the swarm.
            #
            #   @return [String, nil]
            optional :name, String, api_name: :Name

            # @!attribute orchestration
            #   Orchestration configuration.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration, nil]
            optional :orchestration,
                     -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration },
                     api_name: :Orchestration,
                     nil?: true

            # @!attribute raft
            #   Raft configuration.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft, nil]
            optional :raft, -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft }, api_name: :Raft

            # @!attribute task_defaults
            #   Defaults for creating tasks in this cluster.
            #
            #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults, nil]
            optional :task_defaults,
                     -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults },
                     api_name: :TaskDefaults

            # @!method initialize(ca_config: nil, dispatcher: nil, encryption_config: nil, labels: nil, name: nil, orchestration: nil, raft: nil, task_defaults: nil)
            #   User modifiable swarm configuration.
            #
            #   @param ca_config [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig, nil] CA configuration.
            #
            #   @param dispatcher [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher, nil] Dispatcher configuration.
            #
            #   @param encryption_config [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig] Parameters related to encryption-at-rest.
            #
            #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
            #
            #   @param name [String] Name of the swarm.
            #
            #   @param orchestration [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration, nil] Orchestration configuration.
            #
            #   @param raft [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft] Raft configuration.
            #
            #   @param task_defaults [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults] Defaults for creating tasks in this cluster.

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#ca_config
            class CaConfig < Docker::Internal::Type::BaseModel
              # @!attribute external_c_as
              #   Configuration for forwarding signing requests to an external certificate
              #   authority.
              #
              #   @return [Array<Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA>, nil]
              optional :external_c_as,
                       -> { Docker::Internal::Type::ArrayOf[Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA] },
                       api_name: :ExternalCAs

              # @!attribute force_rotate
              #   An integer whose purpose is to force swarm to generate a new signing CA
              #   certificate and key, if none have been specified in `SigningCACert` and
              #   `SigningCAKey`
              #
              #   @return [Integer, nil]
              optional :force_rotate, Integer, api_name: :ForceRotate

              # @!attribute node_cert_expiry
              #   The duration node certificates are issued for.
              #
              #   @return [Integer, nil]
              optional :node_cert_expiry, Integer, api_name: :NodeCertExpiry

              # @!attribute signing_ca_cert
              #   The desired signing CA certificate for all swarm node TLS leaf certificates, in
              #   PEM format.
              #
              #   @return [String, nil]
              optional :signing_ca_cert, String, api_name: :SigningCACert

              # @!attribute signing_ca_key
              #   The desired signing CA key for all swarm node TLS leaf certificates, in PEM
              #   format.
              #
              #   @return [String, nil]
              optional :signing_ca_key, String, api_name: :SigningCAKey

              # @!method initialize(external_c_as: nil, force_rotate: nil, node_cert_expiry: nil, signing_ca_cert: nil, signing_ca_key: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig} for more
              #   details.
              #
              #   CA configuration.
              #
              #   @param external_c_as [Array<Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA>] Configuration for forwarding signing requests to an external
              #
              #   @param force_rotate [Integer] An integer whose purpose is to force swarm to generate a new
              #
              #   @param node_cert_expiry [Integer] The duration node certificates are issued for.
              #
              #   @param signing_ca_cert [String] The desired signing CA certificate for all swarm node TLS leaf
              #
              #   @param signing_ca_key [String] The desired signing CA key for all swarm node TLS leaf certificates,

              class ExternalCA < Docker::Internal::Type::BaseModel
                # @!attribute ca_cert
                #   The root CA certificate (in PEM format) this external CA uses to issue TLS
                #   certificates (assumed to be to the current swarm root CA certificate if not
                #   provided).
                #
                #   @return [String, nil]
                optional :ca_cert, String, api_name: :CACert

                # @!attribute options
                #   An object with key/value pairs that are interpreted as protocol-specific options
                #   for the external CA driver.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

                # @!attribute protocol
                #   Protocol for communication with the external CA (currently only `cfssl` is
                #   supported).
                #
                #   @return [Symbol, Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol, nil]
                optional :protocol,
                         enum: -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol },
                         api_name: :Protocol

                # @!attribute url
                #   URL where certificate signing requests should be sent.
                #
                #   @return [String, nil]
                optional :url, String, api_name: :URL

                # @!method initialize(ca_cert: nil, options: nil, protocol: nil, url: nil)
                #   Some parameter documentations has been truncated, see
                #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA}
                #   for more details.
                #
                #   @param ca_cert [String] The root CA certificate (in PEM format) this external CA uses
                #
                #   @param options [Hash{Symbol=>String}] An object with key/value pairs that are interpreted as
                #
                #   @param protocol [Symbol, Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol] Protocol for communication with the external CA (currently
                #
                #   @param url [String] URL where certificate signing requests should be sent.

                # Protocol for communication with the external CA (currently only `cfssl` is
                # supported).
                #
                # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA#protocol
                module Protocol
                  extend Docker::Internal::Type::Enum

                  CFSSL = :cfssl

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#dispatcher
            class Dispatcher < Docker::Internal::Type::BaseModel
              # @!attribute heartbeat_period
              #   The delay for an agent to send a heartbeat to the dispatcher.
              #
              #   @return [Integer, nil]
              optional :heartbeat_period, Integer, api_name: :HeartbeatPeriod

              # @!method initialize(heartbeat_period: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher} for more
              #   details.
              #
              #   Dispatcher configuration.
              #
              #   @param heartbeat_period [Integer] The delay for an agent to send a heartbeat to the dispatcher.
            end

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#encryption_config
            class EncryptionConfig < Docker::Internal::Type::BaseModel
              # @!attribute auto_lock_managers
              #   If set, generate a key and use it to lock data stored on the managers.
              #
              #   @return [Boolean, nil]
              optional :auto_lock_managers, Docker::Internal::Type::Boolean, api_name: :AutoLockManagers

              # @!method initialize(auto_lock_managers: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig} for
              #   more details.
              #
              #   Parameters related to encryption-at-rest.
              #
              #   @param auto_lock_managers [Boolean] If set, generate a key and use it to lock data stored on the
            end

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#orchestration
            class Orchestration < Docker::Internal::Type::BaseModel
              # @!attribute task_history_retention_limit
              #   The number of historic tasks to keep per instance or node. If negative, never
              #   remove completed or failed tasks.
              #
              #   @return [Integer, nil]
              optional :task_history_retention_limit, Integer, api_name: :TaskHistoryRetentionLimit

              # @!method initialize(task_history_retention_limit: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration} for
              #   more details.
              #
              #   Orchestration configuration.
              #
              #   @param task_history_retention_limit [Integer] The number of historic tasks to keep per instance or node. If
            end

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#raft
            class Raft < Docker::Internal::Type::BaseModel
              # @!attribute election_tick
              #   The number of ticks that a follower will wait for a message from the leader
              #   before becoming a candidate and starting an election. `ElectionTick` must be
              #   greater than `HeartbeatTick`.
              #
              #   A tick currently defaults to one second, so these translate directly to seconds
              #   currently, but this is NOT guaranteed.
              #
              #   @return [Integer, nil]
              optional :election_tick, Integer, api_name: :ElectionTick

              # @!attribute heartbeat_tick
              #   The number of ticks between heartbeats. Every HeartbeatTick ticks, the leader
              #   will send a heartbeat to the followers.
              #
              #   A tick currently defaults to one second, so these translate directly to seconds
              #   currently, but this is NOT guaranteed.
              #
              #   @return [Integer, nil]
              optional :heartbeat_tick, Integer, api_name: :HeartbeatTick

              # @!attribute keep_old_snapshots
              #   The number of snapshots to keep beyond the current snapshot.
              #
              #   @return [Integer, nil]
              optional :keep_old_snapshots, Integer, api_name: :KeepOldSnapshots

              # @!attribute log_entries_for_slow_followers
              #   The number of log entries to keep around to sync up slow followers after a
              #   snapshot is created.
              #
              #   @return [Integer, nil]
              optional :log_entries_for_slow_followers, Integer, api_name: :LogEntriesForSlowFollowers

              # @!attribute snapshot_interval
              #   The number of log entries between snapshots.
              #
              #   @return [Integer, nil]
              optional :snapshot_interval, Integer, api_name: :SnapshotInterval

              # @!method initialize(election_tick: nil, heartbeat_tick: nil, keep_old_snapshots: nil, log_entries_for_slow_followers: nil, snapshot_interval: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft} for more
              #   details.
              #
              #   Raft configuration.
              #
              #   @param election_tick [Integer] The number of ticks that a follower will wait for a message from
              #
              #   @param heartbeat_tick [Integer] The number of ticks between heartbeats. Every HeartbeatTick ticks,
              #
              #   @param keep_old_snapshots [Integer] The number of snapshots to keep beyond the current snapshot.
              #
              #   @param log_entries_for_slow_followers [Integer] The number of log entries to keep around to sync up slow followers
              #
              #   @param snapshot_interval [Integer] The number of log entries between snapshots.
            end

            # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec#task_defaults
            class TaskDefaults < Docker::Internal::Type::BaseModel
              # @!attribute log_driver
              #   The log driver to use for tasks created in the orchestrator if unspecified by a
              #   service.
              #
              #   Updating this value only affects new tasks. Existing tasks continue to use their
              #   previously configured log driver until recreated.
              #
              #   @return [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver, nil]
              optional :log_driver,
                       -> { Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver },
                       api_name: :LogDriver

              # @!method initialize(log_driver: nil)
              #   Some parameter documentations has been truncated, see
              #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults} for
              #   more details.
              #
              #   Defaults for creating tasks in this cluster.
              #
              #   @param log_driver [Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver] The log driver to use for tasks created in the orchestrator if

              # @see Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults#log_driver
              class LogDriver < Docker::Internal::Type::BaseModel
                # @!attribute name
                #   The log driver to use as a default for new tasks.
                #
                #   @return [String, nil]
                optional :name, String, api_name: :Name

                # @!attribute options
                #   Driver-specific options for the selected log driver, specified as key/value
                #   pairs.
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

                # @!method initialize(name: nil, options: nil)
                #   Some parameter documentations has been truncated, see
                #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver}
                #   for more details.
                #
                #   The log driver to use for tasks created in the orchestrator if unspecified by a
                #   service.
                #
                #   Updating this value only affects new tasks. Existing tasks continue to use their
                #   previously configured log driver until recreated.
                #
                #   @param name [String] The log driver to use as a default for new tasks.
                #
                #   @param options [Hash{Symbol=>String}] Driver-specific options for the selected log driver, specified
              end
            end
          end

          # @see Docker::Models::SystemInfoResponse::Swarm::Cluster#tls_info
          class TlsInfo < Docker::Internal::Type::BaseModel
            # @!attribute cert_issuer_public_key
            #   The base64-url-safe-encoded raw public key bytes of the issuer.
            #
            #   @return [String, nil]
            optional :cert_issuer_public_key, String, api_name: :CertIssuerPublicKey

            # @!attribute cert_issuer_subject
            #   The base64-url-safe-encoded raw subject bytes of the issuer.
            #
            #   @return [String, nil]
            optional :cert_issuer_subject, String, api_name: :CertIssuerSubject

            # @!attribute trust_root
            #   The root CA certificate(s) that are used to validate leaf TLS certificates.
            #
            #   @return [String, nil]
            optional :trust_root, String, api_name: :TrustRoot

            # @!method initialize(cert_issuer_public_key: nil, cert_issuer_subject: nil, trust_root: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo} for more details.
            #
            #   Information about the issuer of leaf TLS certificates and the trusted root CA
            #   certificate.
            #
            #   @param cert_issuer_public_key [String] The base64-url-safe-encoded raw public key bytes of the issuer.
            #
            #   @param cert_issuer_subject [String] The base64-url-safe-encoded raw subject bytes of the issuer.
            #
            #   @param trust_root [String] The root CA certificate(s) that are used to validate leaf TLS
          end

          # @see Docker::Models::SystemInfoResponse::Swarm::Cluster#version
          class Version < Docker::Internal::Type::BaseModel
            # @!attribute index
            #
            #   @return [Integer, nil]
            optional :index, Integer, api_name: :Index

            # @!method initialize(index: nil)
            #   The version number of the object such as node, service, etc. This is needed to
            #   avoid conflicting writes. The client must send the version number along with the
            #   modified specification when updating these objects.
            #
            #   This approach ensures safe concurrency and determinism in that the change on the
            #   object may not be applied if the version number has changed from the last read.
            #   In other words, if two update requests specify the same base version, only one
            #   of the requests can succeed. As a result, two separate update requests that
            #   happen at the same time will not unintentionally overwrite each other.
            #
            #   @param index [Integer]
          end
        end

        # Current local status of this node.
        #
        # @see Docker::Models::SystemInfoResponse::Swarm#local_node_state
        module LocalNodeState
          extend Docker::Internal::Type::Enum

          EMPTY = :""
          INACTIVE = :inactive
          PENDING = :pending
          ACTIVE = :active
          ERROR = :error
          LOCKED = :locked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class RemoteManager < Docker::Internal::Type::BaseModel
          # @!attribute addr
          #   IP address and ports at which this node can be reached.
          #
          #   @return [String, nil]
          optional :addr, String, api_name: :Addr

          # @!attribute node_id
          #   Unique identifier of for this node in the swarm.
          #
          #   @return [String, nil]
          optional :node_id, String, api_name: :NodeID

          # @!method initialize(addr: nil, node_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Docker::Models::SystemInfoResponse::Swarm::RemoteManager} for more details.
          #
          #   Represents a peer-node in the swarm
          #
          #   @param addr [String] IP address and ports at which this node can be reached.
          #
          #   @param node_id [String] Unique identifier of for this node in the swarm.
        end
      end
    end
  end
end
