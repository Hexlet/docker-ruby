# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::System#info
    class Info < DockerEngineAPI::Internal::Type::BaseModel
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
      optional :cdi_spec_dirs, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :CDISpecDirs

      # @!attribute cgroup_driver
      #   The driver to use for managing cgroups.
      #
      #   @return [Symbol, DockerEngineAPI::Models::Info::CgroupDriver, nil]
      optional :cgroup_driver, enum: -> { DockerEngineAPI::Info::CgroupDriver }, api_name: :CgroupDriver

      # @!attribute cgroup_version
      #   The version of the cgroup.
      #
      #   @return [Symbol, DockerEngineAPI::Models::Info::CgroupVersion, nil]
      optional :cgroup_version, enum: -> { DockerEngineAPI::Info::CgroupVersion }, api_name: :CgroupVersion

      # @!attribute containerd
      #   Information for connecting to the containerd instance that is used by the
      #   daemon. This is included for debugging purposes only.
      #
      #   @return [DockerEngineAPI::Models::Info::Containerd, nil]
      optional :containerd, -> { DockerEngineAPI::Info::Containerd }, api_name: :Containerd, nil?: true

      # @!attribute containerd_commit
      #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      #   the version-string of external tools, such as `containerd`, or `runC`.
      #
      #   @return [DockerEngineAPI::Models::Info::ContainerdCommit, nil]
      optional :containerd_commit, -> { DockerEngineAPI::Info::ContainerdCommit }, api_name: :ContainerdCommit

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
      optional :cpu_cfs_period, DockerEngineAPI::Internal::Type::Boolean, api_name: :CpuCfsPeriod

      # @!attribute cpu_cfs_quota
      #   Indicates if CPU CFS(Completely Fair Scheduler) quota is supported by the host.
      #
      #   @return [Boolean, nil]
      optional :cpu_cfs_quota, DockerEngineAPI::Internal::Type::Boolean, api_name: :CpuCfsQuota

      # @!attribute cpu_set
      #   Indicates if CPUsets (cpuset.cpus, cpuset.mems) are supported by the host.
      #
      #   See [cpuset(7)](https://www.kernel.org/doc/Documentation/cgroup-v1/cpusets.txt)
      #
      #   @return [Boolean, nil]
      optional :cpu_set, DockerEngineAPI::Internal::Type::Boolean, api_name: :CPUSet

      # @!attribute cpu_shares
      #   Indicates if CPU Shares limiting is supported by the host.
      #
      #   @return [Boolean, nil]
      optional :cpu_shares, DockerEngineAPI::Internal::Type::Boolean, api_name: :CPUShares

      # @!attribute debug
      #   Indicates if the daemon is running in debug-mode / with debug-level logging
      #   enabled.
      #
      #   @return [Boolean, nil]
      optional :debug, DockerEngineAPI::Internal::Type::Boolean, api_name: :Debug

      # @!attribute default_address_pools
      #   List of custom default address pools for local networks, which can be specified
      #   in the daemon.json file or dockerd option.
      #
      #   Example: a Base "10.10.0.0/16" with Size 24 will define the set of 256
      #   10.10.[0-255].0/24 address pools.
      #
      #   @return [Array<DockerEngineAPI::Models::Info::DefaultAddressPool>, nil]
      optional :default_address_pools,
               -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::DefaultAddressPool] },
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
      #   @return [Array<DockerEngineAPI::Models::Info::DiscoveredDevice>, nil]
      optional :discovered_devices,
               -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::DiscoveredDevice] },
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
               DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Internal::Type::ArrayOf[String]],
               api_name: :DriverStatus

      # @!attribute experimental_build
      #   Indicates if experimental features are enabled on the daemon.
      #
      #   @return [Boolean, nil]
      optional :experimental_build, DockerEngineAPI::Internal::Type::Boolean, api_name: :ExperimentalBuild

      # @!attribute firewall_backend
      #   Information about the daemon's firewalling configuration.
      #
      #   This field is currently only used on Linux, and omitted on other platforms.
      #
      #   @return [DockerEngineAPI::Models::Info::FirewallBackend, nil]
      optional :firewall_backend,
               -> { DockerEngineAPI::Info::FirewallBackend },
               api_name: :FirewallBackend,
               nil?: true

      # @!attribute generic_resources
      #   User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
      #   resources (e.g, `GPU=UUID1`).
      #
      #   @return [Array<DockerEngineAPI::Models::Info::GenericResource>, nil]
      optional :generic_resources,
               -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::GenericResource] },
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
      #   @return [DockerEngineAPI::Models::Info::InitCommit, nil]
      optional :init_commit, -> { DockerEngineAPI::Info::InitCommit }, api_name: :InitCommit

      # @!attribute i_pv4_forwarding
      #   Indicates IPv4 forwarding is enabled.
      #
      #   @return [Boolean, nil]
      optional :i_pv4_forwarding, DockerEngineAPI::Internal::Type::Boolean, api_name: :IPv4Forwarding

      # @!attribute isolation
      #   Represents the isolation technology to use as a default for containers. The
      #   supported values are platform-specific.
      #
      #   If no isolation value is specified on daemon start, on Windows client, the
      #   default is `hyperv`, and on Windows server, the default is `process`.
      #
      #   This option is currently not used on other platforms.
      #
      #   @return [Symbol, DockerEngineAPI::Models::Info::Isolation, nil]
      optional :isolation, enum: -> { DockerEngineAPI::Info::Isolation }, api_name: :Isolation

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
      optional :labels, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Labels

      # @!attribute live_restore_enabled
      #   Indicates if live restore is enabled.
      #
      #   If enabled, containers are kept running when the daemon is shutdown or upon
      #   daemon start if running containers are detected.
      #
      #   @return [Boolean, nil]
      optional :live_restore_enabled, DockerEngineAPI::Internal::Type::Boolean, api_name: :LiveRestoreEnabled

      # @!attribute logging_driver
      #   The logging driver to use as a default for new containers.
      #
      #   @return [String, nil]
      optional :logging_driver, String, api_name: :LoggingDriver

      # @!attribute memory_limit
      #   Indicates if the host has memory limit support enabled.
      #
      #   @return [Boolean, nil]
      optional :memory_limit, DockerEngineAPI::Internal::Type::Boolean, api_name: :MemoryLimit

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
      #   @return [DockerEngineAPI::Models::Info::Nri, nil]
      optional :nri, -> { DockerEngineAPI::Info::Nri }, api_name: :NRI, nil?: true

      # @!attribute oom_kill_disable
      #   Indicates if OOM killer disable is supported on the host.
      #
      #   @return [Boolean, nil]
      optional :oom_kill_disable, DockerEngineAPI::Internal::Type::Boolean, api_name: :OomKillDisable

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
      optional :pids_limit, DockerEngineAPI::Internal::Type::Boolean, api_name: :PidsLimit

      # @!attribute plugins
      #   Available plugins per type.
      #
      #   <p><br /></p>
      #
      #   > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
      #   > are "lazily" loaded, and are not returned in this list if there is no resource
      #   > using the plugin.
      #
      #   @return [DockerEngineAPI::Models::Info::Plugins, nil]
      optional :plugins, -> { DockerEngineAPI::Info::Plugins }, api_name: :Plugins

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
      #   @return [DockerEngineAPI::Models::Info::RegistryConfig, nil]
      optional :registry_config,
               -> { DockerEngineAPI::Info::RegistryConfig },
               api_name: :RegistryConfig,
               nil?: true

      # @!attribute runc_commit
      #   Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      #   the version-string of external tools, such as `containerd`, or `runC`.
      #
      #   @return [DockerEngineAPI::Models::Info::RuncCommit, nil]
      optional :runc_commit, -> { DockerEngineAPI::Info::RuncCommit }, api_name: :RuncCommit

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
      #   @return [Hash{Symbol=>DockerEngineAPI::Models::Info::Runtime}, nil]
      optional :runtimes,
               -> { DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Info::Runtime] },
               api_name: :Runtimes

      # @!attribute security_options
      #   List of security features that are enabled on the daemon, such as apparmor,
      #   seccomp, SELinux, user-namespaces (userns), rootless and no-new-privileges.
      #
      #   Additional configuration options for each security feature may be present, and
      #   are included as a comma-separated list of key/value pairs.
      #
      #   @return [Array<String>, nil]
      optional :security_options, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :SecurityOptions

      # @!attribute server_version
      #   Version string of the daemon.
      #
      #   @return [String, nil]
      optional :server_version, String, api_name: :ServerVersion

      # @!attribute swap_limit
      #   Indicates if the host has memory swap limit support enabled.
      #
      #   @return [Boolean, nil]
      optional :swap_limit, DockerEngineAPI::Internal::Type::Boolean, api_name: :SwapLimit

      # @!attribute swarm
      #   Represents generic information about swarm.
      #
      #   @return [DockerEngineAPI::Models::Info::Swarm, nil]
      optional :swarm, -> { DockerEngineAPI::Info::Swarm }, api_name: :Swarm

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
      optional :warnings, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Warnings

      # @!method initialize(architecture: nil, cdi_spec_dirs: nil, cgroup_driver: nil, cgroup_version: nil, containerd: nil, containerd_commit: nil, containers: nil, containers_paused: nil, containers_running: nil, containers_stopped: nil, cpu_cfs_period: nil, cpu_cfs_quota: nil, cpu_set: nil, cpu_shares: nil, debug: nil, default_address_pools: nil, default_runtime: nil, discovered_devices: nil, docker_root_dir: nil, driver: nil, driver_status: nil, experimental_build: nil, firewall_backend: nil, generic_resources: nil, http_proxy: nil, https_proxy: nil, id: nil, images: nil, index_server_address: nil, init_binary: nil, init_commit: nil, i_pv4_forwarding: nil, isolation: nil, kernel_version: nil, labels: nil, live_restore_enabled: nil, logging_driver: nil, memory_limit: nil, mem_total: nil, name: nil, ncpu: nil, n_events_listener: nil, n_fd: nil, n_goroutines: nil, no_proxy: nil, nri: nil, oom_kill_disable: nil, operating_system: nil, os_type: nil, os_version: nil, pids_limit: nil, plugins: nil, product_license: nil, registry_config: nil, runc_commit: nil, runtimes: nil, security_options: nil, server_version: nil, swap_limit: nil, swarm: nil, system_time: nil, warnings: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::Info} for more details.
      #
      #   @param architecture [String] Hardware architecture of the host, as returned by the operating system.
      #
      #   @param cdi_spec_dirs [Array<String>] List of directories where (Container Device Interface) CDI
      #
      #   @param cgroup_driver [Symbol, DockerEngineAPI::Models::Info::CgroupDriver] The driver to use for managing cgroups.
      #
      #   @param cgroup_version [Symbol, DockerEngineAPI::Models::Info::CgroupVersion] The version of the cgroup.
      #
      #   @param containerd [DockerEngineAPI::Models::Info::Containerd, nil] Information for connecting to the containerd instance that is used by the daemon
      #
      #   @param containerd_commit [DockerEngineAPI::Models::Info::ContainerdCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
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
      #   @param default_address_pools [Array<DockerEngineAPI::Models::Info::DefaultAddressPool>] List of custom default address pools for local networks, which can be
      #
      #   @param default_runtime [String] Name of the default OCI runtime that is used when starting containers.
      #
      #   @param discovered_devices [Array<DockerEngineAPI::Models::Info::DiscoveredDevice>] List of devices discovered by device drivers.
      #
      #   @param docker_root_dir [String] Root directory of persistent Docker state.
      #
      #   @param driver [String] Name of the storage driver in use.
      #
      #   @param driver_status [Array<Array<String>>] Information specific to the storage driver, provided as
      #
      #   @param experimental_build [Boolean] Indicates if experimental features are enabled on the daemon.
      #
      #   @param firewall_backend [DockerEngineAPI::Models::Info::FirewallBackend, nil] Information about the daemon's firewalling configuration.
      #
      #   @param generic_resources [Array<DockerEngineAPI::Models::Info::GenericResource>] User-defined resources can be either Integer resources (e.g, `SSD=3`) or
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
      #   @param init_commit [DockerEngineAPI::Models::Info::InitCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
      #
      #   @param i_pv4_forwarding [Boolean] Indicates IPv4 forwarding is enabled.
      #
      #   @param isolation [Symbol, DockerEngineAPI::Models::Info::Isolation] Represents the isolation technology to use as a default for containers.
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
      #   @param nri [DockerEngineAPI::Models::Info::Nri, nil] Information about the Node Resource Interface (NRI).
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
      #   @param plugins [DockerEngineAPI::Models::Info::Plugins] Available plugins per type.
      #
      #   @param product_license [String] Reports a summary of the product license on the daemon.
      #
      #   @param registry_config [DockerEngineAPI::Models::Info::RegistryConfig, nil] RegistryServiceConfig stores daemon registry services configuration.
      #
      #   @param runc_commit [DockerEngineAPI::Models::Info::RuncCommit] Commit holds the Git-commit (SHA1) that a binary was built from, as
      #
      #   @param runtimes [Hash{Symbol=>DockerEngineAPI::Models::Info::Runtime}] List of [OCI compliant](https://github.com/opencontainers/runtime-spec)
      #
      #   @param security_options [Array<String>] List of security features that are enabled on the daemon, such as
      #
      #   @param server_version [String] Version string of the daemon.
      #
      #   @param swap_limit [Boolean] Indicates if the host has memory swap limit support enabled.
      #
      #   @param swarm [DockerEngineAPI::Models::Info::Swarm] Represents generic information about swarm.
      #
      #   @param system_time [String] Current system-time in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt)
      #
      #   @param warnings [Array<String>] List of warnings / informational messages about missing features, or

      # The driver to use for managing cgroups.
      #
      # @see DockerEngineAPI::Models::Info#cgroup_driver
      module CgroupDriver
        extend DockerEngineAPI::Internal::Type::Enum

        CGROUPFS = :cgroupfs
        SYSTEMD = :systemd
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The version of the cgroup.
      #
      # @see DockerEngineAPI::Models::Info#cgroup_version
      module CgroupVersion
        extend DockerEngineAPI::Internal::Type::Enum

        CGROUP_VERSION_1 = :"1"
        CGROUP_VERSION_2 = :"2"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DockerEngineAPI::Models::Info#containerd
      class Containerd < DockerEngineAPI::Internal::Type::BaseModel
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
        #   @return [DockerEngineAPI::Models::Info::Containerd::Namespaces, nil]
        optional :namespaces, -> { DockerEngineAPI::Info::Containerd::Namespaces }, api_name: :Namespaces

        # @!method initialize(address: nil, namespaces: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::Containerd} for more details.
        #
        #   Information for connecting to the containerd instance that is used by the
        #   daemon. This is included for debugging purposes only.
        #
        #   @param address [String] The address of the containerd socket.
        #
        #   @param namespaces [DockerEngineAPI::Models::Info::Containerd::Namespaces] The namespaces that the daemon uses for running containers and

        # @see DockerEngineAPI::Models::Info::Containerd#namespaces
        class Namespaces < DockerEngineAPI::Internal::Type::BaseModel
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
          #   {DockerEngineAPI::Models::Info::Containerd::Namespaces} for more details.
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

      # @see DockerEngineAPI::Models::Info#containerd_commit
      class ContainerdCommit < DockerEngineAPI::Internal::Type::BaseModel
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

      class DefaultAddressPool < DockerEngineAPI::Internal::Type::BaseModel
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

      class DiscoveredDevice < DockerEngineAPI::Internal::Type::BaseModel
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
        #   {DockerEngineAPI::Models::Info::DiscoveredDevice} for more details.
        #
        #   DeviceInfo represents a device that can be used by a container.
        #
        #   @param id [String] The unique identifier for the device within its source driver.
        #
        #   @param source [String] The origin device driver.
      end

      # @see DockerEngineAPI::Models::Info#firewall_backend
      class FirewallBackend < DockerEngineAPI::Internal::Type::BaseModel
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
                 DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Internal::Type::ArrayOf[String]],
                 api_name: :Info

        # @!method initialize(driver: nil, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::FirewallBackend} for more details.
        #
        #   Information about the daemon's firewalling configuration.
        #
        #   This field is currently only used on Linux, and omitted on other platforms.
        #
        #   @param driver [String] The name of the firewall backend driver.
        #
        #   @param info [Array<Array<String>>] Information about the firewall backend, provided as
      end

      class GenericResource < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute discrete_resource_spec
        #
        #   @return [DockerEngineAPI::Models::Info::GenericResource::DiscreteResourceSpec, nil]
        optional :discrete_resource_spec,
                 -> { DockerEngineAPI::Info::GenericResource::DiscreteResourceSpec },
                 api_name: :DiscreteResourceSpec

        # @!attribute named_resource_spec
        #
        #   @return [DockerEngineAPI::Models::Info::GenericResource::NamedResourceSpec, nil]
        optional :named_resource_spec,
                 -> { DockerEngineAPI::Info::GenericResource::NamedResourceSpec },
                 api_name: :NamedResourceSpec

        # @!method initialize(discrete_resource_spec: nil, named_resource_spec: nil)
        #   @param discrete_resource_spec [DockerEngineAPI::Models::Info::GenericResource::DiscreteResourceSpec]
        #   @param named_resource_spec [DockerEngineAPI::Models::Info::GenericResource::NamedResourceSpec]

        # @see DockerEngineAPI::Models::Info::GenericResource#discrete_resource_spec
        class DiscreteResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
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

        # @see DockerEngineAPI::Models::Info::GenericResource#named_resource_spec
        class NamedResourceSpec < DockerEngineAPI::Internal::Type::BaseModel
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

      # @see DockerEngineAPI::Models::Info#init_commit
      class InitCommit < DockerEngineAPI::Internal::Type::BaseModel
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
      # @see DockerEngineAPI::Models::Info#isolation
      module Isolation
        extend DockerEngineAPI::Internal::Type::Enum

        DEFAULT = :default
        HYPERV = :hyperv
        PROCESS = :process
        EMPTY = :""

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DockerEngineAPI::Models::Info#nri
      class Nri < DockerEngineAPI::Internal::Type::BaseModel
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
                 DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Internal::Type::ArrayOf[String]],
                 api_name: :Info

        # @!method initialize(info: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::Nri} for more details.
        #
        #   Information about the Node Resource Interface (NRI).
        #
        #   This field is only present if NRI is enabled.
        #
        #   @param info [Array<Array<String>>] Information about NRI, provided as "label" / "value" pairs.
      end

      # @see DockerEngineAPI::Models::Info#plugins
      class Plugins < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute authorization
        #   Names of available authorization plugins.
        #
        #   @return [Array<String>, nil]
        optional :authorization, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Authorization

        # @!attribute log
        #   Names of available logging-drivers, and logging-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :log, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Log

        # @!attribute network
        #   Names of available network-drivers, and network-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :network, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Network

        # @!attribute volume
        #   Names of available volume-drivers, and network-driver plugins.
        #
        #   @return [Array<String>, nil]
        optional :volume, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Volume

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

      # @see DockerEngineAPI::Models::Info#registry_config
      class RegistryConfig < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute index_configs
        #
        #   @return [Hash{Symbol=>DockerEngineAPI::Models::Info::RegistryConfig::IndexConfig, nil}, nil]
        optional :index_configs,
                 -> {
                   DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Info::RegistryConfig::IndexConfig,
                                                           nil?: true]
                 },
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
                 DockerEngineAPI::Internal::Type::ArrayOf[String],
                 api_name: :InsecureRegistryCIDRs

        # @!attribute mirrors
        #   List of registry URLs that act as a mirror for the official (`docker.io`)
        #   registry.
        #
        #   @return [Array<String>, nil]
        optional :mirrors, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Mirrors

        # @!method initialize(index_configs: nil, insecure_registry_cid_rs: nil, mirrors: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::RegistryConfig} for more details.
        #
        #   RegistryServiceConfig stores daemon registry services configuration.
        #
        #   @param index_configs [Hash{Symbol=>DockerEngineAPI::Models::Info::RegistryConfig::IndexConfig, nil}]
        #
        #   @param insecure_registry_cid_rs [Array<String>] List of IP ranges of insecure registries, using the CIDR syntax
        #
        #   @param mirrors [Array<String>] List of registry URLs that act as a mirror for the official

        class IndexConfig < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute mirrors
          #   List of mirrors, expressed as URIs.
          #
          #   @return [Array<String>, nil]
          optional :mirrors, DockerEngineAPI::Internal::Type::ArrayOf[String], api_name: :Mirrors

          # @!attribute name
          #   Name of the registry, such as "docker.io".
          #
          #   @return [String, nil]
          optional :name, String, api_name: :Name

          # @!attribute official
          #   Indicates whether this is an official registry (i.e., Docker Hub / docker.io)
          #
          #   @return [Boolean, nil]
          optional :official, DockerEngineAPI::Internal::Type::Boolean, api_name: :Official

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
          optional :secure, DockerEngineAPI::Internal::Type::Boolean, api_name: :Secure

          # @!method initialize(mirrors: nil, name: nil, official: nil, secure: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Info::RegistryConfig::IndexConfig} for more details.
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

      # @see DockerEngineAPI::Models::Info#runc_commit
      class RuncCommit < DockerEngineAPI::Internal::Type::BaseModel
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

      class Runtime < DockerEngineAPI::Internal::Type::BaseModel
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
        optional :runtime_args,
                 DockerEngineAPI::Internal::Type::ArrayOf[String],
                 api_name: :runtimeArgs,
                 nil?: true

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
        optional :status, DockerEngineAPI::Internal::Type::HashOf[String], nil?: true

        # @!method initialize(path: nil, runtime_args: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::Runtime} for more details.
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

      # @see DockerEngineAPI::Models::Info#swarm
      class Swarm < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute cluster
        #   ClusterInfo represents information about the swarm as is returned by the "/info"
        #   endpoint. Join-tokens are not included.
        #
        #   @return [DockerEngineAPI::Models::Info::Swarm::Cluster, nil]
        optional :cluster, -> { DockerEngineAPI::Info::Swarm::Cluster }, api_name: :Cluster, nil?: true

        # @!attribute control_available
        #
        #   @return [Boolean, nil]
        optional :control_available, DockerEngineAPI::Internal::Type::Boolean, api_name: :ControlAvailable

        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String, api_name: :Error

        # @!attribute local_node_state
        #   Current local status of this node.
        #
        #   @return [Symbol, DockerEngineAPI::Models::Info::Swarm::LocalNodeState, nil]
        optional :local_node_state,
                 enum: -> { DockerEngineAPI::Info::Swarm::LocalNodeState },
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
        #   @return [Array<DockerEngineAPI::Models::Info::Swarm::RemoteManager>, nil]
        optional :remote_managers,
                 -> { DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Info::Swarm::RemoteManager] },
                 api_name: :RemoteManagers,
                 nil?: true

        # @!method initialize(cluster: nil, control_available: nil, error: nil, local_node_state: nil, managers: nil, node_addr: nil, node_id: nil, nodes: nil, remote_managers: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::Info::Swarm} for more details.
        #
        #   Represents generic information about swarm.
        #
        #   @param cluster [DockerEngineAPI::Models::Info::Swarm::Cluster, nil] ClusterInfo represents information about the swarm as is returned by the
        #
        #   @param control_available [Boolean]
        #
        #   @param error [String]
        #
        #   @param local_node_state [Symbol, DockerEngineAPI::Models::Info::Swarm::LocalNodeState] Current local status of this node.
        #
        #   @param managers [Integer, nil] Total number of managers in the swarm.
        #
        #   @param node_addr [String] IP address at which this node can be reached by other nodes in the
        #
        #   @param node_id [String] Unique identifier of for this node in the swarm.
        #
        #   @param nodes [Integer, nil] Total number of nodes in the swarm.
        #
        #   @param remote_managers [Array<DockerEngineAPI::Models::Info::Swarm::RemoteManager>, nil] List of ID's and addresses of other managers in the swarm.

        # @see DockerEngineAPI::Models::Info::Swarm#cluster
        class Cluster < DockerEngineAPI::Internal::Type::BaseModel
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
          optional :default_addr_pool,
                   DockerEngineAPI::Internal::Type::ArrayOf[String],
                   api_name: :DefaultAddrPool

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
                   DockerEngineAPI::Internal::Type::Boolean,
                   api_name: :RootRotationInProgress

          # @!attribute spec
          #   User modifiable swarm configuration.
          #
          #   @return [DockerEngineAPI::Models::Spec, nil]
          optional :spec, -> { DockerEngineAPI::Spec }, api_name: :Spec

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
          #   @return [DockerEngineAPI::Models::Info::Swarm::Cluster::TlsInfo, nil]
          optional :tls_info, -> { DockerEngineAPI::Info::Swarm::Cluster::TlsInfo }, api_name: :TLSInfo

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
          #   @return [DockerEngineAPI::Models::Info::Swarm::Cluster::Version, nil]
          optional :version, -> { DockerEngineAPI::Info::Swarm::Cluster::Version }, api_name: :Version

          # @!method initialize(created_at: nil, data_path_port: nil, default_addr_pool: nil, id: nil, root_rotation_in_progress: nil, spec: nil, subnet_size: nil, tls_info: nil, updated_at: nil, version: nil)
          #   Some parameter documentations has been truncated, see
          #   {DockerEngineAPI::Models::Info::Swarm::Cluster} for more details.
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
          #   @param spec [DockerEngineAPI::Models::Spec] User modifiable swarm configuration.
          #
          #   @param subnet_size [Integer] SubnetSize specifies the subnet size of the networks created from the
          #
          #   @param tls_info [DockerEngineAPI::Models::Info::Swarm::Cluster::TlsInfo] Information about the issuer of leaf TLS certificates and the trusted root
          #
          #   @param updated_at [String] Date and time at which the swarm was last updated in
          #
          #   @param version [DockerEngineAPI::Models::Info::Swarm::Cluster::Version] The version number of the object such as node, service, etc. This is needed

          # @see DockerEngineAPI::Models::Info::Swarm::Cluster#tls_info
          class TlsInfo < DockerEngineAPI::Internal::Type::BaseModel
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
            #   {DockerEngineAPI::Models::Info::Swarm::Cluster::TlsInfo} for more details.
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

          # @see DockerEngineAPI::Models::Info::Swarm::Cluster#version
          class Version < DockerEngineAPI::Internal::Type::BaseModel
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
        # @see DockerEngineAPI::Models::Info::Swarm#local_node_state
        module LocalNodeState
          extend DockerEngineAPI::Internal::Type::Enum

          EMPTY = :""
          INACTIVE = :inactive
          PENDING = :pending
          ACTIVE = :active
          ERROR = :error
          LOCKED = :locked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class RemoteManager < DockerEngineAPI::Internal::Type::BaseModel
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
          #   {DockerEngineAPI::Models::Info::Swarm::RemoteManager} for more details.
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
