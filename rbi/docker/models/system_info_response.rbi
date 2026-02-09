# typed: strong

module Docker
  module Models
    class SystemInfoResponse < Docker::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Docker::Models::SystemInfoResponse, Docker::Internal::AnyHash)
        end

      # Hardware architecture of the host, as returned by the operating system. This is
      # equivalent to the output of `uname -m` on Linux.
      #
      # Unlike `Arch` (from `/version`), this reports the machine's native architecture,
      # which can differ from the Go runtime architecture when running a binary compiled
      # for a different architecture (for example, a 32-bit binary running on 64-bit
      # hardware).
      sig { returns(T.nilable(String)) }
      attr_reader :architecture

      sig { params(architecture: String).void }
      attr_writer :architecture

      # List of directories where (Container Device Interface) CDI specifications are
      # located.
      #
      # These specifications define vendor-specific modifications to an OCI runtime
      # specification for a container being created.
      #
      # An empty list indicates that CDI device injection is disabled.
      #
      # Note that since using CDI device injection requires the daemon to have
      # experimental enabled. For non-experimental daemons an empty list will always be
      # returned.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cdi_spec_dirs

      sig { params(cdi_spec_dirs: T::Array[String]).void }
      attr_writer :cdi_spec_dirs

      # The driver to use for managing cgroups.
      sig do
        returns(
          T.nilable(
            Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol
          )
        )
      end
      attr_reader :cgroup_driver

      sig do
        params(
          cgroup_driver:
            Docker::Models::SystemInfoResponse::CgroupDriver::OrSymbol
        ).void
      end
      attr_writer :cgroup_driver

      # The version of the cgroup.
      sig do
        returns(
          T.nilable(
            Docker::Models::SystemInfoResponse::CgroupVersion::TaggedSymbol
          )
        )
      end
      attr_reader :cgroup_version

      sig do
        params(
          cgroup_version:
            Docker::Models::SystemInfoResponse::CgroupVersion::OrSymbol
        ).void
      end
      attr_writer :cgroup_version

      # Information for connecting to the containerd instance that is used by the
      # daemon. This is included for debugging purposes only.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::Containerd)) }
      attr_reader :containerd

      sig do
        params(
          containerd:
            T.nilable(Docker::Models::SystemInfoResponse::Containerd::OrHash)
        ).void
      end
      attr_writer :containerd

      # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      # the version-string of external tools, such as `containerd`, or `runC`.
      sig do
        returns(T.nilable(Docker::Models::SystemInfoResponse::ContainerdCommit))
      end
      attr_reader :containerd_commit

      sig do
        params(
          containerd_commit:
            Docker::Models::SystemInfoResponse::ContainerdCommit::OrHash
        ).void
      end
      attr_writer :containerd_commit

      # Total number of containers on the host.
      sig { returns(T.nilable(Integer)) }
      attr_reader :containers

      sig { params(containers: Integer).void }
      attr_writer :containers

      # Number of containers with status `"paused"`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :containers_paused

      sig { params(containers_paused: Integer).void }
      attr_writer :containers_paused

      # Number of containers with status `"running"`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :containers_running

      sig { params(containers_running: Integer).void }
      attr_writer :containers_running

      # Number of containers with status `"stopped"`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :containers_stopped

      sig { params(containers_stopped: Integer).void }
      attr_writer :containers_stopped

      # Indicates if CPU CFS(Completely Fair Scheduler) period is supported by the host.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :cpu_cfs_period

      sig { params(cpu_cfs_period: T::Boolean).void }
      attr_writer :cpu_cfs_period

      # Indicates if CPU CFS(Completely Fair Scheduler) quota is supported by the host.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :cpu_cfs_quota

      sig { params(cpu_cfs_quota: T::Boolean).void }
      attr_writer :cpu_cfs_quota

      # Indicates if CPUsets (cpuset.cpus, cpuset.mems) are supported by the host.
      #
      # See [cpuset(7)](https://www.kernel.org/doc/Documentation/cgroup-v1/cpusets.txt)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :cpu_set

      sig { params(cpu_set: T::Boolean).void }
      attr_writer :cpu_set

      # Indicates if CPU Shares limiting is supported by the host.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :cpu_shares

      sig { params(cpu_shares: T::Boolean).void }
      attr_writer :cpu_shares

      # Indicates if the daemon is running in debug-mode / with debug-level logging
      # enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :debug

      sig { params(debug: T::Boolean).void }
      attr_writer :debug

      # List of custom default address pools for local networks, which can be specified
      # in the daemon.json file or dockerd option.
      #
      # Example: a Base "10.10.0.0/16" with Size 24 will define the set of 256
      # 10.10.[0-255].0/24 address pools.
      sig do
        returns(
          T.nilable(
            T::Array[Docker::Models::SystemInfoResponse::DefaultAddressPool]
          )
        )
      end
      attr_reader :default_address_pools

      sig do
        params(
          default_address_pools:
            T::Array[
              Docker::Models::SystemInfoResponse::DefaultAddressPool::OrHash
            ]
        ).void
      end
      attr_writer :default_address_pools

      # Name of the default OCI runtime that is used when starting containers.
      #
      # The default can be overridden per-container at create time.
      sig { returns(T.nilable(String)) }
      attr_reader :default_runtime

      sig { params(default_runtime: String).void }
      attr_writer :default_runtime

      # List of devices discovered by device drivers.
      #
      # Each device includes information about its source driver, kind, name, and
      # additional driver-specific attributes.
      sig do
        returns(
          T.nilable(
            T::Array[Docker::Models::SystemInfoResponse::DiscoveredDevice]
          )
        )
      end
      attr_reader :discovered_devices

      sig do
        params(
          discovered_devices:
            T::Array[
              Docker::Models::SystemInfoResponse::DiscoveredDevice::OrHash
            ]
        ).void
      end
      attr_writer :discovered_devices

      # Root directory of persistent Docker state.
      #
      # Defaults to `/var/lib/docker` on Linux, and `C:\ProgramData\docker` on Windows.
      sig { returns(T.nilable(String)) }
      attr_reader :docker_root_dir

      sig { params(docker_root_dir: String).void }
      attr_writer :docker_root_dir

      # Name of the storage driver in use.
      sig { returns(T.nilable(String)) }
      attr_reader :driver

      sig { params(driver: String).void }
      attr_writer :driver

      # Information specific to the storage driver, provided as "label" / "value" pairs.
      #
      # This information is provided by the storage driver, and formatted in a way
      # consistent with the output of `docker info` on the command line.
      #
      # <p><br /></p>
      #
      # > **Note**: The information returned in this field, including the formatting of
      # > values and labels, should not be considered stable, and may change without
      # > notice.
      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      attr_reader :driver_status

      sig { params(driver_status: T::Array[T::Array[String]]).void }
      attr_writer :driver_status

      # Indicates if experimental features are enabled on the daemon.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :experimental_build

      sig { params(experimental_build: T::Boolean).void }
      attr_writer :experimental_build

      # Information about the daemon's firewalling configuration.
      #
      # This field is currently only used on Linux, and omitted on other platforms.
      sig do
        returns(T.nilable(Docker::Models::SystemInfoResponse::FirewallBackend))
      end
      attr_reader :firewall_backend

      sig do
        params(
          firewall_backend:
            T.nilable(
              Docker::Models::SystemInfoResponse::FirewallBackend::OrHash
            )
        ).void
      end
      attr_writer :firewall_backend

      # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
      # resources (e.g, `GPU=UUID1`).
      sig do
        returns(
          T.nilable(
            T::Array[Docker::Models::SystemInfoResponse::GenericResource]
          )
        )
      end
      attr_reader :generic_resources

      sig do
        params(
          generic_resources:
            T::Array[
              Docker::Models::SystemInfoResponse::GenericResource::OrHash
            ]
        ).void
      end
      attr_writer :generic_resources

      # HTTP-proxy configured for the daemon. This value is obtained from the
      # [`HTTP_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      # environment variable. Credentials
      # ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
      # the proxy URL are masked in the API response.
      #
      # Containers do not automatically inherit this configuration.
      sig { returns(T.nilable(String)) }
      attr_reader :http_proxy

      sig { params(http_proxy: String).void }
      attr_writer :http_proxy

      # HTTPS-proxy configured for the daemon. This value is obtained from the
      # [`HTTPS_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      # environment variable. Credentials
      # ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
      # the proxy URL are masked in the API response.
      #
      # Containers do not automatically inherit this configuration.
      sig { returns(T.nilable(String)) }
      attr_reader :https_proxy

      sig { params(https_proxy: String).void }
      attr_writer :https_proxy

      # Unique identifier of the daemon.
      #
      # <p><br /></p>
      #
      # > **Note**: The format of the ID itself is not part of the API, and should not
      # > be considered stable.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Total number of images on the host.
      #
      # Both _tagged_ and _untagged_ (dangling) images are counted.
      sig { returns(T.nilable(Integer)) }
      attr_reader :images

      sig { params(images: Integer).void }
      attr_writer :images

      # Address / URL of the index server that is used for image search, and as a
      # default for user authentication for Docker Hub and Docker Cloud.
      sig { returns(T.nilable(String)) }
      attr_reader :index_server_address

      sig { params(index_server_address: String).void }
      attr_writer :index_server_address

      # Name and, optional, path of the `docker-init` binary.
      #
      # If the path is omitted, the daemon searches the host's `$PATH` for the binary
      # and uses the first result.
      sig { returns(T.nilable(String)) }
      attr_reader :init_binary

      sig { params(init_binary: String).void }
      attr_writer :init_binary

      # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      # the version-string of external tools, such as `containerd`, or `runC`.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::InitCommit)) }
      attr_reader :init_commit

      sig do
        params(
          init_commit: Docker::Models::SystemInfoResponse::InitCommit::OrHash
        ).void
      end
      attr_writer :init_commit

      # Indicates IPv4 forwarding is enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :i_pv4_forwarding

      sig { params(i_pv4_forwarding: T::Boolean).void }
      attr_writer :i_pv4_forwarding

      # Represents the isolation technology to use as a default for containers. The
      # supported values are platform-specific.
      #
      # If no isolation value is specified on daemon start, on Windows client, the
      # default is `hyperv`, and on Windows server, the default is `process`.
      #
      # This option is currently not used on other platforms.
      sig do
        returns(
          T.nilable(Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol)
        )
      end
      attr_reader :isolation

      sig do
        params(
          isolation: Docker::Models::SystemInfoResponse::Isolation::OrSymbol
        ).void
      end
      attr_writer :isolation

      # Kernel version of the host.
      #
      # On Linux, this information obtained from `uname`. On Windows this information is
      # queried from the <kbd>HKEY*LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows
      # NT\\CurrentVersion\\</kbd> registry value, for example *"10.0 14393
      # (14393.1198.amd64fre.rs1*release_sec.170427-1353)"*.
      sig { returns(T.nilable(String)) }
      attr_reader :kernel_version

      sig { params(kernel_version: String).void }
      attr_writer :kernel_version

      # User-defined labels (key/value metadata) as set on the daemon.
      #
      # <p><br /></p>
      #
      # > **Note**: When part of a Swarm, nodes can both have _daemon_ labels, set
      # > through the daemon configuration, and _node_ labels, set from a manager node
      # > in the Swarm. Node labels are not included in this field. Node labels can be
      # > retrieved using the `/nodes/(id)` endpoint on a manager node in the Swarm.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :labels

      sig { params(labels: T::Array[String]).void }
      attr_writer :labels

      # Indicates if live restore is enabled.
      #
      # If enabled, containers are kept running when the daemon is shutdown or upon
      # daemon start if running containers are detected.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :live_restore_enabled

      sig { params(live_restore_enabled: T::Boolean).void }
      attr_writer :live_restore_enabled

      # The logging driver to use as a default for new containers.
      sig { returns(T.nilable(String)) }
      attr_reader :logging_driver

      sig { params(logging_driver: String).void }
      attr_writer :logging_driver

      # Indicates if the host has memory limit support enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :memory_limit

      sig { params(memory_limit: T::Boolean).void }
      attr_writer :memory_limit

      # Total amount of physical memory available on the host, in bytes.
      sig { returns(T.nilable(Integer)) }
      attr_reader :mem_total

      sig { params(mem_total: Integer).void }
      attr_writer :mem_total

      # Hostname of the host.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # The number of logical CPUs usable by the daemon.
      #
      # The number of available CPUs is checked by querying the operating system when
      # the daemon starts. Changes to operating system CPU allocation after the daemon
      # is started are not reflected.
      sig { returns(T.nilable(Integer)) }
      attr_reader :ncpu

      sig { params(ncpu: Integer).void }
      attr_writer :ncpu

      # Number of event listeners subscribed.
      sig { returns(T.nilable(Integer)) }
      attr_reader :n_events_listener

      sig { params(n_events_listener: Integer).void }
      attr_writer :n_events_listener

      # The total number of file Descriptors in use by the daemon process.
      #
      # This information is only returned if debug-mode is enabled.
      sig { returns(T.nilable(Integer)) }
      attr_reader :n_fd

      sig { params(n_fd: Integer).void }
      attr_writer :n_fd

      # The number of goroutines that currently exist.
      #
      # This information is only returned if debug-mode is enabled.
      sig { returns(T.nilable(Integer)) }
      attr_reader :n_goroutines

      sig { params(n_goroutines: Integer).void }
      attr_writer :n_goroutines

      # Comma-separated list of domain extensions for which no proxy should be used.
      # This value is obtained from the
      # [`NO_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
      # environment variable.
      #
      # Containers do not automatically inherit this configuration.
      sig { returns(T.nilable(String)) }
      attr_reader :no_proxy

      sig { params(no_proxy: String).void }
      attr_writer :no_proxy

      # Information about the Node Resource Interface (NRI).
      #
      # This field is only present if NRI is enabled.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::Nri)) }
      attr_reader :nri

      sig do
        params(
          nri: T.nilable(Docker::Models::SystemInfoResponse::Nri::OrHash)
        ).void
      end
      attr_writer :nri

      # Indicates if OOM killer disable is supported on the host.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :oom_kill_disable

      sig { params(oom_kill_disable: T::Boolean).void }
      attr_writer :oom_kill_disable

      # Name of the host's operating system, for example: "Ubuntu 24.04 LTS" or "Windows
      # Server 2016 Datacenter"
      sig { returns(T.nilable(String)) }
      attr_reader :operating_system

      sig { params(operating_system: String).void }
      attr_writer :operating_system

      # Generic type of the operating system of the host, as returned by the Go runtime
      # (`GOOS`).
      #
      # Currently returned values are "linux" and "windows". A full list of possible
      # values can be found in the
      # [Go documentation](https://go.dev/doc/install/source#environment).
      sig { returns(T.nilable(String)) }
      attr_reader :os_type

      sig { params(os_type: String).void }
      attr_writer :os_type

      # Version of the host's operating system
      #
      # <p><br /></p>
      #
      # > **Note**: The information returned in this field, including its very
      # > existence, and the formatting of values, should not be considered stable, and
      # > may change without notice.
      sig { returns(T.nilable(String)) }
      attr_reader :os_version

      sig { params(os_version: String).void }
      attr_writer :os_version

      # Indicates if the host kernel has PID limit support enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :pids_limit

      sig { params(pids_limit: T::Boolean).void }
      attr_writer :pids_limit

      # Available plugins per type.
      #
      # <p><br /></p>
      #
      # > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
      # > are "lazily" loaded, and are not returned in this list if there is no resource
      # > using the plugin.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::Plugins)) }
      attr_reader :plugins

      sig do
        params(
          plugins: Docker::Models::SystemInfoResponse::Plugins::OrHash
        ).void
      end
      attr_writer :plugins

      # Reports a summary of the product license on the daemon.
      #
      # If a commercial license has been applied to the daemon, information such as
      # number of nodes, and expiration are included.
      sig { returns(T.nilable(String)) }
      attr_reader :product_license

      sig { params(product_license: String).void }
      attr_writer :product_license

      # RegistryServiceConfig stores daemon registry services configuration.
      sig do
        returns(T.nilable(Docker::Models::SystemInfoResponse::RegistryConfig))
      end
      attr_reader :registry_config

      sig do
        params(
          registry_config:
            T.nilable(
              Docker::Models::SystemInfoResponse::RegistryConfig::OrHash
            )
        ).void
      end
      attr_writer :registry_config

      # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
      # the version-string of external tools, such as `containerd`, or `runC`.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::RuncCommit)) }
      attr_reader :runc_commit

      sig do
        params(
          runc_commit: Docker::Models::SystemInfoResponse::RuncCommit::OrHash
        ).void
      end
      attr_writer :runc_commit

      # List of [OCI compliant](https://github.com/opencontainers/runtime-spec) runtimes
      # configured on the daemon. Keys hold the "name" used to reference the runtime.
      #
      # The Docker daemon relies on an OCI compliant runtime (invoked via the
      # `containerd` daemon) as its interface to the Linux kernel namespaces, cgroups,
      # and SELinux.
      #
      # The default runtime is `runc`, and automatically configured. Additional runtimes
      # can be configured by the user and will be listed here.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, Docker::Models::SystemInfoResponse::Runtime]
          )
        )
      end
      attr_reader :runtimes

      sig do
        params(
          runtimes:
            T::Hash[Symbol, Docker::Models::SystemInfoResponse::Runtime::OrHash]
        ).void
      end
      attr_writer :runtimes

      # List of security features that are enabled on the daemon, such as apparmor,
      # seccomp, SELinux, user-namespaces (userns), rootless and no-new-privileges.
      #
      # Additional configuration options for each security feature may be present, and
      # are included as a comma-separated list of key/value pairs.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :security_options

      sig { params(security_options: T::Array[String]).void }
      attr_writer :security_options

      # Version string of the daemon.
      sig { returns(T.nilable(String)) }
      attr_reader :server_version

      sig { params(server_version: String).void }
      attr_writer :server_version

      # Indicates if the host has memory swap limit support enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :swap_limit

      sig { params(swap_limit: T::Boolean).void }
      attr_writer :swap_limit

      # Represents generic information about swarm.
      sig { returns(T.nilable(Docker::Models::SystemInfoResponse::Swarm)) }
      attr_reader :swarm

      sig do
        params(swarm: Docker::Models::SystemInfoResponse::Swarm::OrHash).void
      end
      attr_writer :swarm

      # Current system-time in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format
      # with nano-seconds.
      sig { returns(T.nilable(String)) }
      attr_reader :system_time

      sig { params(system_time: String).void }
      attr_writer :system_time

      # List of warnings / informational messages about missing features, or issues
      # related to the daemon configuration.
      #
      # These messages can be printed by the client as information to the user.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :warnings

      sig { params(warnings: T::Array[String]).void }
      attr_writer :warnings

      sig do
        params(
          architecture: String,
          cdi_spec_dirs: T::Array[String],
          cgroup_driver:
            Docker::Models::SystemInfoResponse::CgroupDriver::OrSymbol,
          cgroup_version:
            Docker::Models::SystemInfoResponse::CgroupVersion::OrSymbol,
          containerd:
            T.nilable(Docker::Models::SystemInfoResponse::Containerd::OrHash),
          containerd_commit:
            Docker::Models::SystemInfoResponse::ContainerdCommit::OrHash,
          containers: Integer,
          containers_paused: Integer,
          containers_running: Integer,
          containers_stopped: Integer,
          cpu_cfs_period: T::Boolean,
          cpu_cfs_quota: T::Boolean,
          cpu_set: T::Boolean,
          cpu_shares: T::Boolean,
          debug: T::Boolean,
          default_address_pools:
            T::Array[
              Docker::Models::SystemInfoResponse::DefaultAddressPool::OrHash
            ],
          default_runtime: String,
          discovered_devices:
            T::Array[
              Docker::Models::SystemInfoResponse::DiscoveredDevice::OrHash
            ],
          docker_root_dir: String,
          driver: String,
          driver_status: T::Array[T::Array[String]],
          experimental_build: T::Boolean,
          firewall_backend:
            T.nilable(
              Docker::Models::SystemInfoResponse::FirewallBackend::OrHash
            ),
          generic_resources:
            T::Array[
              Docker::Models::SystemInfoResponse::GenericResource::OrHash
            ],
          http_proxy: String,
          https_proxy: String,
          id: String,
          images: Integer,
          index_server_address: String,
          init_binary: String,
          init_commit: Docker::Models::SystemInfoResponse::InitCommit::OrHash,
          i_pv4_forwarding: T::Boolean,
          isolation: Docker::Models::SystemInfoResponse::Isolation::OrSymbol,
          kernel_version: String,
          labels: T::Array[String],
          live_restore_enabled: T::Boolean,
          logging_driver: String,
          memory_limit: T::Boolean,
          mem_total: Integer,
          name: String,
          ncpu: Integer,
          n_events_listener: Integer,
          n_fd: Integer,
          n_goroutines: Integer,
          no_proxy: String,
          nri: T.nilable(Docker::Models::SystemInfoResponse::Nri::OrHash),
          oom_kill_disable: T::Boolean,
          operating_system: String,
          os_type: String,
          os_version: String,
          pids_limit: T::Boolean,
          plugins: Docker::Models::SystemInfoResponse::Plugins::OrHash,
          product_license: String,
          registry_config:
            T.nilable(
              Docker::Models::SystemInfoResponse::RegistryConfig::OrHash
            ),
          runc_commit: Docker::Models::SystemInfoResponse::RuncCommit::OrHash,
          runtimes:
            T::Hash[
              Symbol,
              Docker::Models::SystemInfoResponse::Runtime::OrHash
            ],
          security_options: T::Array[String],
          server_version: String,
          swap_limit: T::Boolean,
          swarm: Docker::Models::SystemInfoResponse::Swarm::OrHash,
          system_time: String,
          warnings: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Hardware architecture of the host, as returned by the operating system. This is
        # equivalent to the output of `uname -m` on Linux.
        #
        # Unlike `Arch` (from `/version`), this reports the machine's native architecture,
        # which can differ from the Go runtime architecture when running a binary compiled
        # for a different architecture (for example, a 32-bit binary running on 64-bit
        # hardware).
        architecture: nil,
        # List of directories where (Container Device Interface) CDI specifications are
        # located.
        #
        # These specifications define vendor-specific modifications to an OCI runtime
        # specification for a container being created.
        #
        # An empty list indicates that CDI device injection is disabled.
        #
        # Note that since using CDI device injection requires the daemon to have
        # experimental enabled. For non-experimental daemons an empty list will always be
        # returned.
        cdi_spec_dirs: nil,
        # The driver to use for managing cgroups.
        cgroup_driver: nil,
        # The version of the cgroup.
        cgroup_version: nil,
        # Information for connecting to the containerd instance that is used by the
        # daemon. This is included for debugging purposes only.
        containerd: nil,
        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        containerd_commit: nil,
        # Total number of containers on the host.
        containers: nil,
        # Number of containers with status `"paused"`.
        containers_paused: nil,
        # Number of containers with status `"running"`.
        containers_running: nil,
        # Number of containers with status `"stopped"`.
        containers_stopped: nil,
        # Indicates if CPU CFS(Completely Fair Scheduler) period is supported by the host.
        cpu_cfs_period: nil,
        # Indicates if CPU CFS(Completely Fair Scheduler) quota is supported by the host.
        cpu_cfs_quota: nil,
        # Indicates if CPUsets (cpuset.cpus, cpuset.mems) are supported by the host.
        #
        # See [cpuset(7)](https://www.kernel.org/doc/Documentation/cgroup-v1/cpusets.txt)
        cpu_set: nil,
        # Indicates if CPU Shares limiting is supported by the host.
        cpu_shares: nil,
        # Indicates if the daemon is running in debug-mode / with debug-level logging
        # enabled.
        debug: nil,
        # List of custom default address pools for local networks, which can be specified
        # in the daemon.json file or dockerd option.
        #
        # Example: a Base "10.10.0.0/16" with Size 24 will define the set of 256
        # 10.10.[0-255].0/24 address pools.
        default_address_pools: nil,
        # Name of the default OCI runtime that is used when starting containers.
        #
        # The default can be overridden per-container at create time.
        default_runtime: nil,
        # List of devices discovered by device drivers.
        #
        # Each device includes information about its source driver, kind, name, and
        # additional driver-specific attributes.
        discovered_devices: nil,
        # Root directory of persistent Docker state.
        #
        # Defaults to `/var/lib/docker` on Linux, and `C:\ProgramData\docker` on Windows.
        docker_root_dir: nil,
        # Name of the storage driver in use.
        driver: nil,
        # Information specific to the storage driver, provided as "label" / "value" pairs.
        #
        # This information is provided by the storage driver, and formatted in a way
        # consistent with the output of `docker info` on the command line.
        #
        # <p><br /></p>
        #
        # > **Note**: The information returned in this field, including the formatting of
        # > values and labels, should not be considered stable, and may change without
        # > notice.
        driver_status: nil,
        # Indicates if experimental features are enabled on the daemon.
        experimental_build: nil,
        # Information about the daemon's firewalling configuration.
        #
        # This field is currently only used on Linux, and omitted on other platforms.
        firewall_backend: nil,
        # User-defined resources can be either Integer resources (e.g, `SSD=3`) or String
        # resources (e.g, `GPU=UUID1`).
        generic_resources: nil,
        # HTTP-proxy configured for the daemon. This value is obtained from the
        # [`HTTP_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
        # environment variable. Credentials
        # ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
        # the proxy URL are masked in the API response.
        #
        # Containers do not automatically inherit this configuration.
        http_proxy: nil,
        # HTTPS-proxy configured for the daemon. This value is obtained from the
        # [`HTTPS_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
        # environment variable. Credentials
        # ([user info component](https://tools.ietf.org/html/rfc3986#section-3.2.1)) in
        # the proxy URL are masked in the API response.
        #
        # Containers do not automatically inherit this configuration.
        https_proxy: nil,
        # Unique identifier of the daemon.
        #
        # <p><br /></p>
        #
        # > **Note**: The format of the ID itself is not part of the API, and should not
        # > be considered stable.
        id: nil,
        # Total number of images on the host.
        #
        # Both _tagged_ and _untagged_ (dangling) images are counted.
        images: nil,
        # Address / URL of the index server that is used for image search, and as a
        # default for user authentication for Docker Hub and Docker Cloud.
        index_server_address: nil,
        # Name and, optional, path of the `docker-init` binary.
        #
        # If the path is omitted, the daemon searches the host's `$PATH` for the binary
        # and uses the first result.
        init_binary: nil,
        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        init_commit: nil,
        # Indicates IPv4 forwarding is enabled.
        i_pv4_forwarding: nil,
        # Represents the isolation technology to use as a default for containers. The
        # supported values are platform-specific.
        #
        # If no isolation value is specified on daemon start, on Windows client, the
        # default is `hyperv`, and on Windows server, the default is `process`.
        #
        # This option is currently not used on other platforms.
        isolation: nil,
        # Kernel version of the host.
        #
        # On Linux, this information obtained from `uname`. On Windows this information is
        # queried from the <kbd>HKEY*LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows
        # NT\\CurrentVersion\\</kbd> registry value, for example *"10.0 14393
        # (14393.1198.amd64fre.rs1*release_sec.170427-1353)"*.
        kernel_version: nil,
        # User-defined labels (key/value metadata) as set on the daemon.
        #
        # <p><br /></p>
        #
        # > **Note**: When part of a Swarm, nodes can both have _daemon_ labels, set
        # > through the daemon configuration, and _node_ labels, set from a manager node
        # > in the Swarm. Node labels are not included in this field. Node labels can be
        # > retrieved using the `/nodes/(id)` endpoint on a manager node in the Swarm.
        labels: nil,
        # Indicates if live restore is enabled.
        #
        # If enabled, containers are kept running when the daemon is shutdown or upon
        # daemon start if running containers are detected.
        live_restore_enabled: nil,
        # The logging driver to use as a default for new containers.
        logging_driver: nil,
        # Indicates if the host has memory limit support enabled.
        memory_limit: nil,
        # Total amount of physical memory available on the host, in bytes.
        mem_total: nil,
        # Hostname of the host.
        name: nil,
        # The number of logical CPUs usable by the daemon.
        #
        # The number of available CPUs is checked by querying the operating system when
        # the daemon starts. Changes to operating system CPU allocation after the daemon
        # is started are not reflected.
        ncpu: nil,
        # Number of event listeners subscribed.
        n_events_listener: nil,
        # The total number of file Descriptors in use by the daemon process.
        #
        # This information is only returned if debug-mode is enabled.
        n_fd: nil,
        # The number of goroutines that currently exist.
        #
        # This information is only returned if debug-mode is enabled.
        n_goroutines: nil,
        # Comma-separated list of domain extensions for which no proxy should be used.
        # This value is obtained from the
        # [`NO_PROXY`](https://www.gnu.org/software/wget/manual/html_node/Proxies.html)
        # environment variable.
        #
        # Containers do not automatically inherit this configuration.
        no_proxy: nil,
        # Information about the Node Resource Interface (NRI).
        #
        # This field is only present if NRI is enabled.
        nri: nil,
        # Indicates if OOM killer disable is supported on the host.
        oom_kill_disable: nil,
        # Name of the host's operating system, for example: "Ubuntu 24.04 LTS" or "Windows
        # Server 2016 Datacenter"
        operating_system: nil,
        # Generic type of the operating system of the host, as returned by the Go runtime
        # (`GOOS`).
        #
        # Currently returned values are "linux" and "windows". A full list of possible
        # values can be found in the
        # [Go documentation](https://go.dev/doc/install/source#environment).
        os_type: nil,
        # Version of the host's operating system
        #
        # <p><br /></p>
        #
        # > **Note**: The information returned in this field, including its very
        # > existence, and the formatting of values, should not be considered stable, and
        # > may change without notice.
        os_version: nil,
        # Indicates if the host kernel has PID limit support enabled.
        pids_limit: nil,
        # Available plugins per type.
        #
        # <p><br /></p>
        #
        # > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
        # > are "lazily" loaded, and are not returned in this list if there is no resource
        # > using the plugin.
        plugins: nil,
        # Reports a summary of the product license on the daemon.
        #
        # If a commercial license has been applied to the daemon, information such as
        # number of nodes, and expiration are included.
        product_license: nil,
        # RegistryServiceConfig stores daemon registry services configuration.
        registry_config: nil,
        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        runc_commit: nil,
        # List of [OCI compliant](https://github.com/opencontainers/runtime-spec) runtimes
        # configured on the daemon. Keys hold the "name" used to reference the runtime.
        #
        # The Docker daemon relies on an OCI compliant runtime (invoked via the
        # `containerd` daemon) as its interface to the Linux kernel namespaces, cgroups,
        # and SELinux.
        #
        # The default runtime is `runc`, and automatically configured. Additional runtimes
        # can be configured by the user and will be listed here.
        runtimes: nil,
        # List of security features that are enabled on the daemon, such as apparmor,
        # seccomp, SELinux, user-namespaces (userns), rootless and no-new-privileges.
        #
        # Additional configuration options for each security feature may be present, and
        # are included as a comma-separated list of key/value pairs.
        security_options: nil,
        # Version string of the daemon.
        server_version: nil,
        # Indicates if the host has memory swap limit support enabled.
        swap_limit: nil,
        # Represents generic information about swarm.
        swarm: nil,
        # Current system-time in [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format
        # with nano-seconds.
        system_time: nil,
        # List of warnings / informational messages about missing features, or issues
        # related to the daemon configuration.
        #
        # These messages can be printed by the client as information to the user.
        warnings: nil
      )
      end

      sig do
        override.returns(
          {
            architecture: String,
            cdi_spec_dirs: T::Array[String],
            cgroup_driver:
              Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol,
            cgroup_version:
              Docker::Models::SystemInfoResponse::CgroupVersion::TaggedSymbol,
            containerd:
              T.nilable(Docker::Models::SystemInfoResponse::Containerd),
            containerd_commit:
              Docker::Models::SystemInfoResponse::ContainerdCommit,
            containers: Integer,
            containers_paused: Integer,
            containers_running: Integer,
            containers_stopped: Integer,
            cpu_cfs_period: T::Boolean,
            cpu_cfs_quota: T::Boolean,
            cpu_set: T::Boolean,
            cpu_shares: T::Boolean,
            debug: T::Boolean,
            default_address_pools:
              T::Array[Docker::Models::SystemInfoResponse::DefaultAddressPool],
            default_runtime: String,
            discovered_devices:
              T::Array[Docker::Models::SystemInfoResponse::DiscoveredDevice],
            docker_root_dir: String,
            driver: String,
            driver_status: T::Array[T::Array[String]],
            experimental_build: T::Boolean,
            firewall_backend:
              T.nilable(Docker::Models::SystemInfoResponse::FirewallBackend),
            generic_resources:
              T::Array[Docker::Models::SystemInfoResponse::GenericResource],
            http_proxy: String,
            https_proxy: String,
            id: String,
            images: Integer,
            index_server_address: String,
            init_binary: String,
            init_commit: Docker::Models::SystemInfoResponse::InitCommit,
            i_pv4_forwarding: T::Boolean,
            isolation:
              Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol,
            kernel_version: String,
            labels: T::Array[String],
            live_restore_enabled: T::Boolean,
            logging_driver: String,
            memory_limit: T::Boolean,
            mem_total: Integer,
            name: String,
            ncpu: Integer,
            n_events_listener: Integer,
            n_fd: Integer,
            n_goroutines: Integer,
            no_proxy: String,
            nri: T.nilable(Docker::Models::SystemInfoResponse::Nri),
            oom_kill_disable: T::Boolean,
            operating_system: String,
            os_type: String,
            os_version: String,
            pids_limit: T::Boolean,
            plugins: Docker::Models::SystemInfoResponse::Plugins,
            product_license: String,
            registry_config:
              T.nilable(Docker::Models::SystemInfoResponse::RegistryConfig),
            runc_commit: Docker::Models::SystemInfoResponse::RuncCommit,
            runtimes:
              T::Hash[Symbol, Docker::Models::SystemInfoResponse::Runtime],
            security_options: T::Array[String],
            server_version: String,
            swap_limit: T::Boolean,
            swarm: Docker::Models::SystemInfoResponse::Swarm,
            system_time: String,
            warnings: T::Array[String]
          }
        )
      end
      def to_hash
      end

      # The driver to use for managing cgroups.
      module CgroupDriver
        extend Docker::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Docker::Models::SystemInfoResponse::CgroupDriver)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CGROUPFS =
          T.let(
            :cgroupfs,
            Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol
          )
        SYSTEMD =
          T.let(
            :systemd,
            Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol
          )
        NONE =
          T.let(
            :none,
            Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Docker::Models::SystemInfoResponse::CgroupDriver::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The version of the cgroup.
      module CgroupVersion
        extend Docker::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Docker::Models::SystemInfoResponse::CgroupVersion)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CGROUP_VERSION_1 =
          T.let(
            :"1",
            Docker::Models::SystemInfoResponse::CgroupVersion::TaggedSymbol
          )
        CGROUP_VERSION_2 =
          T.let(
            :"2",
            Docker::Models::SystemInfoResponse::CgroupVersion::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Docker::Models::SystemInfoResponse::CgroupVersion::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Containerd < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::Containerd,
              Docker::Internal::AnyHash
            )
          end

        # The address of the containerd socket.
        sig { returns(T.nilable(String)) }
        attr_reader :address

        sig { params(address: String).void }
        attr_writer :address

        # The namespaces that the daemon uses for running containers and plugins in
        # containerd. These namespaces can be configured in the daemon configuration, and
        # are considered to be used exclusively by the daemon, Tampering with the
        # containerd instance may cause unexpected behavior.
        #
        # As these namespaces are considered to be exclusively accessed by the daemon, it
        # is not recommended to change these values, or to change them to a value that is
        # used by other systems, such as cri-containerd.
        sig do
          returns(
            T.nilable(
              Docker::Models::SystemInfoResponse::Containerd::Namespaces
            )
          )
        end
        attr_reader :namespaces

        sig do
          params(
            namespaces:
              Docker::Models::SystemInfoResponse::Containerd::Namespaces::OrHash
          ).void
        end
        attr_writer :namespaces

        # Information for connecting to the containerd instance that is used by the
        # daemon. This is included for debugging purposes only.
        sig do
          params(
            address: String,
            namespaces:
              Docker::Models::SystemInfoResponse::Containerd::Namespaces::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The address of the containerd socket.
          address: nil,
          # The namespaces that the daemon uses for running containers and plugins in
          # containerd. These namespaces can be configured in the daemon configuration, and
          # are considered to be used exclusively by the daemon, Tampering with the
          # containerd instance may cause unexpected behavior.
          #
          # As these namespaces are considered to be exclusively accessed by the daemon, it
          # is not recommended to change these values, or to change them to a value that is
          # used by other systems, such as cri-containerd.
          namespaces: nil
        )
        end

        sig do
          override.returns(
            {
              address: String,
              namespaces:
                Docker::Models::SystemInfoResponse::Containerd::Namespaces
            }
          )
        end
        def to_hash
        end

        class Namespaces < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::Containerd::Namespaces,
                Docker::Internal::AnyHash
              )
            end

          # The default containerd namespace used for containers managed by the daemon.
          #
          # The default namespace for containers is "moby", but will be suffixed with the
          # `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
          # containerd image-store is used.
          sig { returns(T.nilable(String)) }
          attr_reader :containers

          sig { params(containers: String).void }
          attr_writer :containers

          # The default containerd namespace used for plugins managed by the daemon.
          #
          # The default namespace for plugins is "plugins.moby", but will be suffixed with
          # the `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
          # containerd image-store is used.
          sig { returns(T.nilable(String)) }
          attr_reader :plugins

          sig { params(plugins: String).void }
          attr_writer :plugins

          # The namespaces that the daemon uses for running containers and plugins in
          # containerd. These namespaces can be configured in the daemon configuration, and
          # are considered to be used exclusively by the daemon, Tampering with the
          # containerd instance may cause unexpected behavior.
          #
          # As these namespaces are considered to be exclusively accessed by the daemon, it
          # is not recommended to change these values, or to change them to a value that is
          # used by other systems, such as cri-containerd.
          sig do
            params(containers: String, plugins: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The default containerd namespace used for containers managed by the daemon.
            #
            # The default namespace for containers is "moby", but will be suffixed with the
            # `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
            # containerd image-store is used.
            containers: nil,
            # The default containerd namespace used for plugins managed by the daemon.
            #
            # The default namespace for plugins is "plugins.moby", but will be suffixed with
            # the `<uid>.<gid>` of the remapped `root` if user-namespaces are enabled and the
            # containerd image-store is used.
            plugins: nil
          )
          end

          sig { override.returns({ containers: String, plugins: String }) }
          def to_hash
          end
        end
      end

      class ContainerdCommit < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::ContainerdCommit,
              Docker::Internal::AnyHash
            )
          end

        # Actual commit ID of external tool.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Actual commit ID of external tool.
          id: nil
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      class DefaultAddressPool < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::DefaultAddressPool,
              Docker::Internal::AnyHash
            )
          end

        # The network address in CIDR format
        sig { returns(T.nilable(String)) }
        attr_reader :base

        sig { params(base: String).void }
        attr_writer :base

        # The network pool size
        sig { returns(T.nilable(Integer)) }
        attr_reader :size

        sig { params(size: Integer).void }
        attr_writer :size

        sig { params(base: String, size: Integer).returns(T.attached_class) }
        def self.new(
          # The network address in CIDR format
          base: nil,
          # The network pool size
          size: nil
        )
        end

        sig { override.returns({ base: String, size: Integer }) }
        def to_hash
        end
      end

      class DiscoveredDevice < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::DiscoveredDevice,
              Docker::Internal::AnyHash
            )
          end

        # The unique identifier for the device within its source driver. For CDI devices,
        # this would be an FQDN like "vendor.com/gpu=0".
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # The origin device driver.
        sig { returns(T.nilable(String)) }
        attr_reader :source

        sig { params(source: String).void }
        attr_writer :source

        # DeviceInfo represents a device that can be used by a container.
        sig { params(id: String, source: String).returns(T.attached_class) }
        def self.new(
          # The unique identifier for the device within its source driver. For CDI devices,
          # this would be an FQDN like "vendor.com/gpu=0".
          id: nil,
          # The origin device driver.
          source: nil
        )
        end

        sig { override.returns({ id: String, source: String }) }
        def to_hash
        end
      end

      class FirewallBackend < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::FirewallBackend,
              Docker::Internal::AnyHash
            )
          end

        # The name of the firewall backend driver.
        sig { returns(T.nilable(String)) }
        attr_reader :driver

        sig { params(driver: String).void }
        attr_writer :driver

        # Information about the firewall backend, provided as "label" / "value" pairs.
        #
        # <p><br /></p>
        #
        # > **Note**: The information returned in this field, including the formatting of
        # > values and labels, should not be considered stable, and may change without
        # > notice.
        sig { returns(T.nilable(T::Array[T::Array[String]])) }
        attr_reader :info

        sig { params(info: T::Array[T::Array[String]]).void }
        attr_writer :info

        # Information about the daemon's firewalling configuration.
        #
        # This field is currently only used on Linux, and omitted on other platforms.
        sig do
          params(driver: String, info: T::Array[T::Array[String]]).returns(
            T.attached_class
          )
        end
        def self.new(
          # The name of the firewall backend driver.
          driver: nil,
          # Information about the firewall backend, provided as "label" / "value" pairs.
          #
          # <p><br /></p>
          #
          # > **Note**: The information returned in this field, including the formatting of
          # > values and labels, should not be considered stable, and may change without
          # > notice.
          info: nil
        )
        end

        sig do
          override.returns({ driver: String, info: T::Array[T::Array[String]] })
        end
        def to_hash
        end
      end

      class GenericResource < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::GenericResource,
              Docker::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec
            )
          )
        end
        attr_reader :discrete_resource_spec

        sig do
          params(
            discrete_resource_spec:
              Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec::OrHash
          ).void
        end
        attr_writer :discrete_resource_spec

        sig do
          returns(
            T.nilable(
              Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec
            )
          )
        end
        attr_reader :named_resource_spec

        sig do
          params(
            named_resource_spec:
              Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec::OrHash
          ).void
        end
        attr_writer :named_resource_spec

        sig do
          params(
            discrete_resource_spec:
              Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec::OrHash,
            named_resource_spec:
              Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec::OrHash
          ).returns(T.attached_class)
        end
        def self.new(discrete_resource_spec: nil, named_resource_spec: nil)
        end

        sig do
          override.returns(
            {
              discrete_resource_spec:
                Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec,
              named_resource_spec:
                Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec
            }
          )
        end
        def to_hash
        end

        class DiscreteResourceSpec < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::GenericResource::DiscreteResourceSpec,
                Docker::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :kind

          sig { params(kind: String).void }
          attr_writer :kind

          sig { returns(T.nilable(Integer)) }
          attr_reader :value

          sig { params(value: Integer).void }
          attr_writer :value

          sig { params(kind: String, value: Integer).returns(T.attached_class) }
          def self.new(kind: nil, value: nil)
          end

          sig { override.returns({ kind: String, value: Integer }) }
          def to_hash
          end
        end

        class NamedResourceSpec < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::GenericResource::NamedResourceSpec,
                Docker::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :kind

          sig { params(kind: String).void }
          attr_writer :kind

          sig { returns(T.nilable(String)) }
          attr_reader :value

          sig { params(value: String).void }
          attr_writer :value

          sig { params(kind: String, value: String).returns(T.attached_class) }
          def self.new(kind: nil, value: nil)
          end

          sig { override.returns({ kind: String, value: String }) }
          def to_hash
          end
        end
      end

      class InitCommit < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::InitCommit,
              Docker::Internal::AnyHash
            )
          end

        # Actual commit ID of external tool.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Actual commit ID of external tool.
          id: nil
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      # Represents the isolation technology to use as a default for containers. The
      # supported values are platform-specific.
      #
      # If no isolation value is specified on daemon start, on Windows client, the
      # default is `hyperv`, and on Windows server, the default is `process`.
      #
      # This option is currently not used on other platforms.
      module Isolation
        extend Docker::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Docker::Models::SystemInfoResponse::Isolation)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DEFAULT =
          T.let(
            :default,
            Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol
          )
        HYPERV =
          T.let(
            :hyperv,
            Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol
          )
        PROCESS =
          T.let(
            :process,
            Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol
          )
        EMPTY =
          T.let(
            :"",
            Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Docker::Models::SystemInfoResponse::Isolation::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Nri < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::Nri,
              Docker::Internal::AnyHash
            )
          end

        # Information about NRI, provided as "label" / "value" pairs.
        #
        # <p><br /></p>
        #
        # > **Note**: The information returned in this field, including the formatting of
        # > values and labels, should not be considered stable, and may change without
        # > notice.
        sig { returns(T.nilable(T::Array[T::Array[String]])) }
        attr_reader :info

        sig { params(info: T::Array[T::Array[String]]).void }
        attr_writer :info

        # Information about the Node Resource Interface (NRI).
        #
        # This field is only present if NRI is enabled.
        sig do
          params(info: T::Array[T::Array[String]]).returns(T.attached_class)
        end
        def self.new(
          # Information about NRI, provided as "label" / "value" pairs.
          #
          # <p><br /></p>
          #
          # > **Note**: The information returned in this field, including the formatting of
          # > values and labels, should not be considered stable, and may change without
          # > notice.
          info: nil
        )
        end

        sig { override.returns({ info: T::Array[T::Array[String]] }) }
        def to_hash
        end
      end

      class Plugins < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::Plugins,
              Docker::Internal::AnyHash
            )
          end

        # Names of available authorization plugins.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :authorization

        sig { params(authorization: T::Array[String]).void }
        attr_writer :authorization

        # Names of available logging-drivers, and logging-driver plugins.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :log

        sig { params(log: T::Array[String]).void }
        attr_writer :log

        # Names of available network-drivers, and network-driver plugins.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :network

        sig { params(network: T::Array[String]).void }
        attr_writer :network

        # Names of available volume-drivers, and network-driver plugins.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :volume

        sig { params(volume: T::Array[String]).void }
        attr_writer :volume

        # Available plugins per type.
        #
        # <p><br /></p>
        #
        # > **Note**: Only unmanaged (V1) plugins are included in this list. V1 plugins
        # > are "lazily" loaded, and are not returned in this list if there is no resource
        # > using the plugin.
        sig do
          params(
            authorization: T::Array[String],
            log: T::Array[String],
            network: T::Array[String],
            volume: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Names of available authorization plugins.
          authorization: nil,
          # Names of available logging-drivers, and logging-driver plugins.
          log: nil,
          # Names of available network-drivers, and network-driver plugins.
          network: nil,
          # Names of available volume-drivers, and network-driver plugins.
          volume: nil
        )
        end

        sig do
          override.returns(
            {
              authorization: T::Array[String],
              log: T::Array[String],
              network: T::Array[String],
              volume: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end

      class RegistryConfig < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::RegistryConfig,
              Docker::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(
                  Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig
                )
              ]
            )
          )
        end
        attr_reader :index_configs

        sig do
          params(
            index_configs:
              T::Hash[
                Symbol,
                T.nilable(
                  Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig::OrHash
                )
              ]
          ).void
        end
        attr_writer :index_configs

        # List of IP ranges of insecure registries, using the CIDR syntax
        # ([RFC 4632](https://tools.ietf.org/html/4632)). Insecure registries accept
        # un-encrypted (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
        # communication.
        #
        # By default, local registries (`::1/128` and `127.0.0.0/8`) are configured as
        # insecure. All other registries are secure. Communicating with an insecure
        # registry is not possible if the daemon assumes that registry is secure.
        #
        # This configuration override this behavior, insecure communication with
        # registries whose resolved IP address is within the subnet described by the CIDR
        # syntax.
        #
        # Registries can also be marked insecure by hostname. Those registries are listed
        # under `IndexConfigs` and have their `Secure` field set to `false`.
        #
        # > **Warning**: Using this option can be useful when running a local registry,
        # > but introduces security vulnerabilities. This option should therefore ONLY be
        # > used for testing purposes. For increased security, users should add their CA
        # > to their system's list of trusted CAs instead of enabling this option.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :insecure_registry_cid_rs

        sig { params(insecure_registry_cid_rs: T::Array[String]).void }
        attr_writer :insecure_registry_cid_rs

        # List of registry URLs that act as a mirror for the official (`docker.io`)
        # registry.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :mirrors

        sig { params(mirrors: T::Array[String]).void }
        attr_writer :mirrors

        # RegistryServiceConfig stores daemon registry services configuration.
        sig do
          params(
            index_configs:
              T::Hash[
                Symbol,
                T.nilable(
                  Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig::OrHash
                )
              ],
            insecure_registry_cid_rs: T::Array[String],
            mirrors: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          index_configs: nil,
          # List of IP ranges of insecure registries, using the CIDR syntax
          # ([RFC 4632](https://tools.ietf.org/html/4632)). Insecure registries accept
          # un-encrypted (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
          # communication.
          #
          # By default, local registries (`::1/128` and `127.0.0.0/8`) are configured as
          # insecure. All other registries are secure. Communicating with an insecure
          # registry is not possible if the daemon assumes that registry is secure.
          #
          # This configuration override this behavior, insecure communication with
          # registries whose resolved IP address is within the subnet described by the CIDR
          # syntax.
          #
          # Registries can also be marked insecure by hostname. Those registries are listed
          # under `IndexConfigs` and have their `Secure` field set to `false`.
          #
          # > **Warning**: Using this option can be useful when running a local registry,
          # > but introduces security vulnerabilities. This option should therefore ONLY be
          # > used for testing purposes. For increased security, users should add their CA
          # > to their system's list of trusted CAs instead of enabling this option.
          insecure_registry_cid_rs: nil,
          # List of registry URLs that act as a mirror for the official (`docker.io`)
          # registry.
          mirrors: nil
        )
        end

        sig do
          override.returns(
            {
              index_configs:
                T::Hash[
                  Symbol,
                  T.nilable(
                    Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig
                  )
                ],
              insecure_registry_cid_rs: T::Array[String],
              mirrors: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class IndexConfig < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::RegistryConfig::IndexConfig,
                Docker::Internal::AnyHash
              )
            end

          # List of mirrors, expressed as URIs.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :mirrors

          sig { params(mirrors: T::Array[String]).void }
          attr_writer :mirrors

          # Name of the registry, such as "docker.io".
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Indicates whether this is an official registry (i.e., Docker Hub / docker.io)
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :official

          sig { params(official: T::Boolean).void }
          attr_writer :official

          # Indicates if the registry is part of the list of insecure registries.
          #
          # If `false`, the registry is insecure. Insecure registries accept un-encrypted
          # (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
          # communication.
          #
          # > **Warning**: Insecure registries can be useful when running a local registry.
          # > However, because its use creates security vulnerabilities it should ONLY be
          # > enabled for testing purposes. For increased security, users should add their
          # > CA to their system's list of trusted CAs instead of enabling this option.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :secure

          sig { params(secure: T::Boolean).void }
          attr_writer :secure

          # IndexInfo contains information about a registry.
          sig do
            params(
              mirrors: T::Array[String],
              name: String,
              official: T::Boolean,
              secure: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # List of mirrors, expressed as URIs.
            mirrors: nil,
            # Name of the registry, such as "docker.io".
            name: nil,
            # Indicates whether this is an official registry (i.e., Docker Hub / docker.io)
            official: nil,
            # Indicates if the registry is part of the list of insecure registries.
            #
            # If `false`, the registry is insecure. Insecure registries accept un-encrypted
            # (HTTP) and/or untrusted (HTTPS with certificates from unknown CAs)
            # communication.
            #
            # > **Warning**: Insecure registries can be useful when running a local registry.
            # > However, because its use creates security vulnerabilities it should ONLY be
            # > enabled for testing purposes. For increased security, users should add their
            # > CA to their system's list of trusted CAs instead of enabling this option.
            secure: nil
          )
          end

          sig do
            override.returns(
              {
                mirrors: T::Array[String],
                name: String,
                official: T::Boolean,
                secure: T::Boolean
              }
            )
          end
          def to_hash
          end
        end
      end

      class RuncCommit < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::RuncCommit,
              Docker::Internal::AnyHash
            )
          end

        # Actual commit ID of external tool.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Commit holds the Git-commit (SHA1) that a binary was built from, as reported in
        # the version-string of external tools, such as `containerd`, or `runC`.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Actual commit ID of external tool.
          id: nil
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      class Runtime < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::Runtime,
              Docker::Internal::AnyHash
            )
          end

        # Name and, optional, path, of the OCI executable binary.
        #
        # If the path is omitted, the daemon searches the host's `$PATH` for the binary
        # and uses the first result.
        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        # List of command-line arguments to pass to the runtime when invoked.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :runtime_args

        # Information specific to the runtime.
        #
        # While this API specification does not define data provided by runtimes, the
        # following well-known properties may be provided by runtimes:
        #
        # `org.opencontainers.runtime-spec.features`: features structure as defined in the
        # [OCI Runtime Specification](https://github.com/opencontainers/runtime-spec/blob/main/features.md),
        # in a JSON string representation.
        #
        # <p><br /></p>
        #
        # > **Note**: The information returned in this field, including the formatting of
        # > values and labels, should not be considered stable, and may change without
        # > notice.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :status

        # Runtime describes an
        # [OCI compliant](https://github.com/opencontainers/runtime-spec) runtime.
        #
        # The runtime is invoked by the daemon via the `containerd` daemon. OCI runtimes
        # act as an interface to the Linux kernel namespaces, cgroups, and SELinux.
        sig do
          params(
            path: String,
            runtime_args: T.nilable(T::Array[String]),
            status: T.nilable(T::Hash[Symbol, String])
          ).returns(T.attached_class)
        end
        def self.new(
          # Name and, optional, path, of the OCI executable binary.
          #
          # If the path is omitted, the daemon searches the host's `$PATH` for the binary
          # and uses the first result.
          path: nil,
          # List of command-line arguments to pass to the runtime when invoked.
          runtime_args: nil,
          # Information specific to the runtime.
          #
          # While this API specification does not define data provided by runtimes, the
          # following well-known properties may be provided by runtimes:
          #
          # `org.opencontainers.runtime-spec.features`: features structure as defined in the
          # [OCI Runtime Specification](https://github.com/opencontainers/runtime-spec/blob/main/features.md),
          # in a JSON string representation.
          #
          # <p><br /></p>
          #
          # > **Note**: The information returned in this field, including the formatting of
          # > values and labels, should not be considered stable, and may change without
          # > notice.
          status: nil
        )
        end

        sig do
          override.returns(
            {
              path: String,
              runtime_args: T.nilable(T::Array[String]),
              status: T.nilable(T::Hash[Symbol, String])
            }
          )
        end
        def to_hash
        end
      end

      class Swarm < Docker::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Docker::Models::SystemInfoResponse::Swarm,
              Docker::Internal::AnyHash
            )
          end

        # ClusterInfo represents information about the swarm as is returned by the "/info"
        # endpoint. Join-tokens are not included.
        sig do
          returns(T.nilable(Docker::Models::SystemInfoResponse::Swarm::Cluster))
        end
        attr_reader :cluster

        sig do
          params(
            cluster:
              T.nilable(
                Docker::Models::SystemInfoResponse::Swarm::Cluster::OrHash
              )
          ).void
        end
        attr_writer :cluster

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :control_available

        sig { params(control_available: T::Boolean).void }
        attr_writer :control_available

        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # Current local status of this node.
        sig do
          returns(
            T.nilable(
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          )
        end
        attr_reader :local_node_state

        sig do
          params(
            local_node_state:
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::OrSymbol
          ).void
        end
        attr_writer :local_node_state

        # Total number of managers in the swarm.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :managers

        # IP address at which this node can be reached by other nodes in the swarm.
        sig { returns(T.nilable(String)) }
        attr_reader :node_addr

        sig { params(node_addr: String).void }
        attr_writer :node_addr

        # Unique identifier of for this node in the swarm.
        sig { returns(T.nilable(String)) }
        attr_reader :node_id

        sig { params(node_id: String).void }
        attr_writer :node_id

        # Total number of nodes in the swarm.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :nodes

        # List of ID's and addresses of other managers in the swarm.
        sig do
          returns(
            T.nilable(
              T::Array[Docker::Models::SystemInfoResponse::Swarm::RemoteManager]
            )
          )
        end
        attr_accessor :remote_managers

        # Represents generic information about swarm.
        sig do
          params(
            cluster:
              T.nilable(
                Docker::Models::SystemInfoResponse::Swarm::Cluster::OrHash
              ),
            control_available: T::Boolean,
            error: String,
            local_node_state:
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::OrSymbol,
            managers: T.nilable(Integer),
            node_addr: String,
            node_id: String,
            nodes: T.nilable(Integer),
            remote_managers:
              T.nilable(
                T::Array[
                  Docker::Models::SystemInfoResponse::Swarm::RemoteManager::OrHash
                ]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # ClusterInfo represents information about the swarm as is returned by the "/info"
          # endpoint. Join-tokens are not included.
          cluster: nil,
          control_available: nil,
          error: nil,
          # Current local status of this node.
          local_node_state: nil,
          # Total number of managers in the swarm.
          managers: nil,
          # IP address at which this node can be reached by other nodes in the swarm.
          node_addr: nil,
          # Unique identifier of for this node in the swarm.
          node_id: nil,
          # Total number of nodes in the swarm.
          nodes: nil,
          # List of ID's and addresses of other managers in the swarm.
          remote_managers: nil
        )
        end

        sig do
          override.returns(
            {
              cluster:
                T.nilable(Docker::Models::SystemInfoResponse::Swarm::Cluster),
              control_available: T::Boolean,
              error: String,
              local_node_state:
                Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol,
              managers: T.nilable(Integer),
              node_addr: String,
              node_id: String,
              nodes: T.nilable(Integer),
              remote_managers:
                T.nilable(
                  T::Array[
                    Docker::Models::SystemInfoResponse::Swarm::RemoteManager
                  ]
                )
            }
          )
        end
        def to_hash
        end

        class Cluster < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::Swarm::Cluster,
                Docker::Internal::AnyHash
              )
            end

          # Date and time at which the swarm was initialised in
          # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          # DataPathPort specifies the data path port number for data traffic. Acceptable
          # port range is 1024 to 49151. If no port is set or is set to 0, the default port
          # (4789) is used.
          sig { returns(T.nilable(Integer)) }
          attr_reader :data_path_port

          sig { params(data_path_port: Integer).void }
          attr_writer :data_path_port

          # Default Address Pool specifies default subnet pools for global scope networks.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :default_addr_pool

          sig { params(default_addr_pool: T::Array[String]).void }
          attr_writer :default_addr_pool

          # The ID of the swarm.
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # Whether there is currently a root CA rotation in progress for the swarm
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :root_rotation_in_progress

          sig { params(root_rotation_in_progress: T::Boolean).void }
          attr_writer :root_rotation_in_progress

          # User modifiable swarm configuration.
          sig do
            returns(
              T.nilable(
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec
              )
            )
          end
          attr_reader :spec

          sig do
            params(
              spec:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::OrHash
            ).void
          end
          attr_writer :spec

          # SubnetSize specifies the subnet size of the networks created from the default
          # subnet pool.
          sig { returns(T.nilable(Integer)) }
          attr_reader :subnet_size

          sig { params(subnet_size: Integer).void }
          attr_writer :subnet_size

          # Information about the issuer of leaf TLS certificates and the trusted root CA
          # certificate.
          sig do
            returns(
              T.nilable(
                Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo
              )
            )
          end
          attr_reader :tls_info

          sig do
            params(
              tls_info:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo::OrHash
            ).void
          end
          attr_writer :tls_info

          # Date and time at which the swarm was last updated in
          # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
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
          sig do
            returns(
              T.nilable(
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Version
              )
            )
          end
          attr_reader :version

          sig do
            params(
              version:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Version::OrHash
            ).void
          end
          attr_writer :version

          # ClusterInfo represents information about the swarm as is returned by the "/info"
          # endpoint. Join-tokens are not included.
          sig do
            params(
              created_at: String,
              data_path_port: Integer,
              default_addr_pool: T::Array[String],
              id: String,
              root_rotation_in_progress: T::Boolean,
              spec:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::OrHash,
              subnet_size: Integer,
              tls_info:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo::OrHash,
              updated_at: String,
              version:
                Docker::Models::SystemInfoResponse::Swarm::Cluster::Version::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Date and time at which the swarm was initialised in
            # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
            created_at: nil,
            # DataPathPort specifies the data path port number for data traffic. Acceptable
            # port range is 1024 to 49151. If no port is set or is set to 0, the default port
            # (4789) is used.
            data_path_port: nil,
            # Default Address Pool specifies default subnet pools for global scope networks.
            default_addr_pool: nil,
            # The ID of the swarm.
            id: nil,
            # Whether there is currently a root CA rotation in progress for the swarm
            root_rotation_in_progress: nil,
            # User modifiable swarm configuration.
            spec: nil,
            # SubnetSize specifies the subnet size of the networks created from the default
            # subnet pool.
            subnet_size: nil,
            # Information about the issuer of leaf TLS certificates and the trusted root CA
            # certificate.
            tls_info: nil,
            # Date and time at which the swarm was last updated in
            # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
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
                data_path_port: Integer,
                default_addr_pool: T::Array[String],
                id: String,
                root_rotation_in_progress: T::Boolean,
                spec: Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec,
                subnet_size: Integer,
                tls_info:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo,
                updated_at: String,
                version:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Version
              }
            )
          end
          def to_hash
          end

          class Spec < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec,
                  Docker::Internal::AnyHash
                )
              end

            # CA configuration.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig
                )
              )
            end
            attr_reader :ca_config

            sig do
              params(
                ca_config:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::OrHash
                  )
              ).void
            end
            attr_writer :ca_config

            # Dispatcher configuration.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher
                )
              )
            end
            attr_reader :dispatcher

            sig do
              params(
                dispatcher:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher::OrHash
                  )
              ).void
            end
            attr_writer :dispatcher

            # Parameters related to encryption-at-rest.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig
                )
              )
            end
            attr_reader :encryption_config

            sig do
              params(
                encryption_config:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig::OrHash
              ).void
            end
            attr_writer :encryption_config

            # User-defined key/value metadata.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :labels

            sig { params(labels: T::Hash[Symbol, String]).void }
            attr_writer :labels

            # Name of the swarm.
            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            # Orchestration configuration.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration
                )
              )
            end
            attr_reader :orchestration

            sig do
              params(
                orchestration:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration::OrHash
                  )
              ).void
            end
            attr_writer :orchestration

            # Raft configuration.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft
                )
              )
            end
            attr_reader :raft

            sig do
              params(
                raft:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft::OrHash
              ).void
            end
            attr_writer :raft

            # Defaults for creating tasks in this cluster.
            sig do
              returns(
                T.nilable(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults
                )
              )
            end
            attr_reader :task_defaults

            sig do
              params(
                task_defaults:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::OrHash
              ).void
            end
            attr_writer :task_defaults

            # User modifiable swarm configuration.
            sig do
              params(
                ca_config:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::OrHash
                  ),
                dispatcher:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher::OrHash
                  ),
                encryption_config:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig::OrHash,
                labels: T::Hash[Symbol, String],
                name: String,
                orchestration:
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration::OrHash
                  ),
                raft:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft::OrHash,
                task_defaults:
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # CA configuration.
              ca_config: nil,
              # Dispatcher configuration.
              dispatcher: nil,
              # Parameters related to encryption-at-rest.
              encryption_config: nil,
              # User-defined key/value metadata.
              labels: nil,
              # Name of the swarm.
              name: nil,
              # Orchestration configuration.
              orchestration: nil,
              # Raft configuration.
              raft: nil,
              # Defaults for creating tasks in this cluster.
              task_defaults: nil
            )
            end

            sig do
              override.returns(
                {
                  ca_config:
                    T.nilable(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig
                    ),
                  dispatcher:
                    T.nilable(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher
                    ),
                  encryption_config:
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig,
                  labels: T::Hash[Symbol, String],
                  name: String,
                  orchestration:
                    T.nilable(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration
                    ),
                  raft:
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft,
                  task_defaults:
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults
                }
              )
            end
            def to_hash
            end

            class CaConfig < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig,
                    Docker::Internal::AnyHash
                  )
                end

              # Configuration for forwarding signing requests to an external certificate
              # authority.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA
                    ]
                  )
                )
              end
              attr_reader :external_c_as

              sig do
                params(
                  external_c_as:
                    T::Array[
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::OrHash
                    ]
                ).void
              end
              attr_writer :external_c_as

              # An integer whose purpose is to force swarm to generate a new signing CA
              # certificate and key, if none have been specified in `SigningCACert` and
              # `SigningCAKey`
              sig { returns(T.nilable(Integer)) }
              attr_reader :force_rotate

              sig { params(force_rotate: Integer).void }
              attr_writer :force_rotate

              # The duration node certificates are issued for.
              sig { returns(T.nilable(Integer)) }
              attr_reader :node_cert_expiry

              sig { params(node_cert_expiry: Integer).void }
              attr_writer :node_cert_expiry

              # The desired signing CA certificate for all swarm node TLS leaf certificates, in
              # PEM format.
              sig { returns(T.nilable(String)) }
              attr_reader :signing_ca_cert

              sig { params(signing_ca_cert: String).void }
              attr_writer :signing_ca_cert

              # The desired signing CA key for all swarm node TLS leaf certificates, in PEM
              # format.
              sig { returns(T.nilable(String)) }
              attr_reader :signing_ca_key

              sig { params(signing_ca_key: String).void }
              attr_writer :signing_ca_key

              # CA configuration.
              sig do
                params(
                  external_c_as:
                    T::Array[
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::OrHash
                    ],
                  force_rotate: Integer,
                  node_cert_expiry: Integer,
                  signing_ca_cert: String,
                  signing_ca_key: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Configuration for forwarding signing requests to an external certificate
                # authority.
                external_c_as: nil,
                # An integer whose purpose is to force swarm to generate a new signing CA
                # certificate and key, if none have been specified in `SigningCACert` and
                # `SigningCAKey`
                force_rotate: nil,
                # The duration node certificates are issued for.
                node_cert_expiry: nil,
                # The desired signing CA certificate for all swarm node TLS leaf certificates, in
                # PEM format.
                signing_ca_cert: nil,
                # The desired signing CA key for all swarm node TLS leaf certificates, in PEM
                # format.
                signing_ca_key: nil
              )
              end

              sig do
                override.returns(
                  {
                    external_c_as:
                      T::Array[
                        Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA
                      ],
                    force_rotate: Integer,
                    node_cert_expiry: Integer,
                    signing_ca_cert: String,
                    signing_ca_key: String
                  }
                )
              end
              def to_hash
              end

              class ExternalCA < Docker::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA,
                      Docker::Internal::AnyHash
                    )
                  end

                # The root CA certificate (in PEM format) this external CA uses to issue TLS
                # certificates (assumed to be to the current swarm root CA certificate if not
                # provided).
                sig { returns(T.nilable(String)) }
                attr_reader :ca_cert

                sig { params(ca_cert: String).void }
                attr_writer :ca_cert

                # An object with key/value pairs that are interpreted as protocol-specific options
                # for the external CA driver.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :options

                sig { params(options: T::Hash[Symbol, String]).void }
                attr_writer :options

                # Protocol for communication with the external CA (currently only `cfssl` is
                # supported).
                sig do
                  returns(
                    T.nilable(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::TaggedSymbol
                    )
                  )
                end
                attr_reader :protocol

                sig do
                  params(
                    protocol:
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::OrSymbol
                  ).void
                end
                attr_writer :protocol

                # URL where certificate signing requests should be sent.
                sig { returns(T.nilable(String)) }
                attr_reader :url

                sig { params(url: String).void }
                attr_writer :url

                sig do
                  params(
                    ca_cert: String,
                    options: T::Hash[Symbol, String],
                    protocol:
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::OrSymbol,
                    url: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The root CA certificate (in PEM format) this external CA uses to issue TLS
                  # certificates (assumed to be to the current swarm root CA certificate if not
                  # provided).
                  ca_cert: nil,
                  # An object with key/value pairs that are interpreted as protocol-specific options
                  # for the external CA driver.
                  options: nil,
                  # Protocol for communication with the external CA (currently only `cfssl` is
                  # supported).
                  protocol: nil,
                  # URL where certificate signing requests should be sent.
                  url: nil
                )
                end

                sig do
                  override.returns(
                    {
                      ca_cert: String,
                      options: T::Hash[Symbol, String],
                      protocol:
                        Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::TaggedSymbol,
                      url: String
                    }
                  )
                end
                def to_hash
                end

                # Protocol for communication with the external CA (currently only `cfssl` is
                # supported).
                module Protocol
                  extend Docker::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  CFSSL =
                    T.let(
                      :cfssl,
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::CaConfig::ExternalCA::Protocol::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class Dispatcher < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Dispatcher,
                    Docker::Internal::AnyHash
                  )
                end

              # The delay for an agent to send a heartbeat to the dispatcher.
              sig { returns(T.nilable(Integer)) }
              attr_reader :heartbeat_period

              sig { params(heartbeat_period: Integer).void }
              attr_writer :heartbeat_period

              # Dispatcher configuration.
              sig do
                params(heartbeat_period: Integer).returns(T.attached_class)
              end
              def self.new(
                # The delay for an agent to send a heartbeat to the dispatcher.
                heartbeat_period: nil
              )
              end

              sig { override.returns({ heartbeat_period: Integer }) }
              def to_hash
              end
            end

            class EncryptionConfig < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::EncryptionConfig,
                    Docker::Internal::AnyHash
                  )
                end

              # If set, generate a key and use it to lock data stored on the managers.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :auto_lock_managers

              sig { params(auto_lock_managers: T::Boolean).void }
              attr_writer :auto_lock_managers

              # Parameters related to encryption-at-rest.
              sig do
                params(auto_lock_managers: T::Boolean).returns(T.attached_class)
              end
              def self.new(
                # If set, generate a key and use it to lock data stored on the managers.
                auto_lock_managers: nil
              )
              end

              sig { override.returns({ auto_lock_managers: T::Boolean }) }
              def to_hash
              end
            end

            class Orchestration < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Orchestration,
                    Docker::Internal::AnyHash
                  )
                end

              # The number of historic tasks to keep per instance or node. If negative, never
              # remove completed or failed tasks.
              sig { returns(T.nilable(Integer)) }
              attr_reader :task_history_retention_limit

              sig { params(task_history_retention_limit: Integer).void }
              attr_writer :task_history_retention_limit

              # Orchestration configuration.
              sig do
                params(task_history_retention_limit: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The number of historic tasks to keep per instance or node. If negative, never
                # remove completed or failed tasks.
                task_history_retention_limit: nil
              )
              end

              sig do
                override.returns({ task_history_retention_limit: Integer })
              end
              def to_hash
              end
            end

            class Raft < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::Raft,
                    Docker::Internal::AnyHash
                  )
                end

              # The number of ticks that a follower will wait for a message from the leader
              # before becoming a candidate and starting an election. `ElectionTick` must be
              # greater than `HeartbeatTick`.
              #
              # A tick currently defaults to one second, so these translate directly to seconds
              # currently, but this is NOT guaranteed.
              sig { returns(T.nilable(Integer)) }
              attr_reader :election_tick

              sig { params(election_tick: Integer).void }
              attr_writer :election_tick

              # The number of ticks between heartbeats. Every HeartbeatTick ticks, the leader
              # will send a heartbeat to the followers.
              #
              # A tick currently defaults to one second, so these translate directly to seconds
              # currently, but this is NOT guaranteed.
              sig { returns(T.nilable(Integer)) }
              attr_reader :heartbeat_tick

              sig { params(heartbeat_tick: Integer).void }
              attr_writer :heartbeat_tick

              # The number of snapshots to keep beyond the current snapshot.
              sig { returns(T.nilable(Integer)) }
              attr_reader :keep_old_snapshots

              sig { params(keep_old_snapshots: Integer).void }
              attr_writer :keep_old_snapshots

              # The number of log entries to keep around to sync up slow followers after a
              # snapshot is created.
              sig { returns(T.nilable(Integer)) }
              attr_reader :log_entries_for_slow_followers

              sig { params(log_entries_for_slow_followers: Integer).void }
              attr_writer :log_entries_for_slow_followers

              # The number of log entries between snapshots.
              sig { returns(T.nilable(Integer)) }
              attr_reader :snapshot_interval

              sig { params(snapshot_interval: Integer).void }
              attr_writer :snapshot_interval

              # Raft configuration.
              sig do
                params(
                  election_tick: Integer,
                  heartbeat_tick: Integer,
                  keep_old_snapshots: Integer,
                  log_entries_for_slow_followers: Integer,
                  snapshot_interval: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # The number of ticks that a follower will wait for a message from the leader
                # before becoming a candidate and starting an election. `ElectionTick` must be
                # greater than `HeartbeatTick`.
                #
                # A tick currently defaults to one second, so these translate directly to seconds
                # currently, but this is NOT guaranteed.
                election_tick: nil,
                # The number of ticks between heartbeats. Every HeartbeatTick ticks, the leader
                # will send a heartbeat to the followers.
                #
                # A tick currently defaults to one second, so these translate directly to seconds
                # currently, but this is NOT guaranteed.
                heartbeat_tick: nil,
                # The number of snapshots to keep beyond the current snapshot.
                keep_old_snapshots: nil,
                # The number of log entries to keep around to sync up slow followers after a
                # snapshot is created.
                log_entries_for_slow_followers: nil,
                # The number of log entries between snapshots.
                snapshot_interval: nil
              )
              end

              sig do
                override.returns(
                  {
                    election_tick: Integer,
                    heartbeat_tick: Integer,
                    keep_old_snapshots: Integer,
                    log_entries_for_slow_followers: Integer,
                    snapshot_interval: Integer
                  }
                )
              end
              def to_hash
              end
            end

            class TaskDefaults < Docker::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults,
                    Docker::Internal::AnyHash
                  )
                end

              # The log driver to use for tasks created in the orchestrator if unspecified by a
              # service.
              #
              # Updating this value only affects new tasks. Existing tasks continue to use their
              # previously configured log driver until recreated.
              sig do
                returns(
                  T.nilable(
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver
                  )
                )
              end
              attr_reader :log_driver

              sig do
                params(
                  log_driver:
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver::OrHash
                ).void
              end
              attr_writer :log_driver

              # Defaults for creating tasks in this cluster.
              sig do
                params(
                  log_driver:
                    Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # The log driver to use for tasks created in the orchestrator if unspecified by a
                # service.
                #
                # Updating this value only affects new tasks. Existing tasks continue to use their
                # previously configured log driver until recreated.
                log_driver: nil
              )
              end

              sig do
                override.returns(
                  {
                    log_driver:
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver
                  }
                )
              end
              def to_hash
              end

              class LogDriver < Docker::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Docker::Models::SystemInfoResponse::Swarm::Cluster::Spec::TaskDefaults::LogDriver,
                      Docker::Internal::AnyHash
                    )
                  end

                # The log driver to use as a default for new tasks.
                sig { returns(T.nilable(String)) }
                attr_reader :name

                sig { params(name: String).void }
                attr_writer :name

                # Driver-specific options for the selected log driver, specified as key/value
                # pairs.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :options

                sig { params(options: T::Hash[Symbol, String]).void }
                attr_writer :options

                # The log driver to use for tasks created in the orchestrator if unspecified by a
                # service.
                #
                # Updating this value only affects new tasks. Existing tasks continue to use their
                # previously configured log driver until recreated.
                sig do
                  params(
                    name: String,
                    options: T::Hash[Symbol, String]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The log driver to use as a default for new tasks.
                  name: nil,
                  # Driver-specific options for the selected log driver, specified as key/value
                  # pairs.
                  options: nil
                )
                end

                sig do
                  override.returns(
                    { name: String, options: T::Hash[Symbol, String] }
                  )
                end
                def to_hash
                end
              end
            end
          end

          class TlsInfo < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::TlsInfo,
                  Docker::Internal::AnyHash
                )
              end

            # The base64-url-safe-encoded raw public key bytes of the issuer.
            sig { returns(T.nilable(String)) }
            attr_reader :cert_issuer_public_key

            sig { params(cert_issuer_public_key: String).void }
            attr_writer :cert_issuer_public_key

            # The base64-url-safe-encoded raw subject bytes of the issuer.
            sig { returns(T.nilable(String)) }
            attr_reader :cert_issuer_subject

            sig { params(cert_issuer_subject: String).void }
            attr_writer :cert_issuer_subject

            # The root CA certificate(s) that are used to validate leaf TLS certificates.
            sig { returns(T.nilable(String)) }
            attr_reader :trust_root

            sig { params(trust_root: String).void }
            attr_writer :trust_root

            # Information about the issuer of leaf TLS certificates and the trusted root CA
            # certificate.
            sig do
              params(
                cert_issuer_public_key: String,
                cert_issuer_subject: String,
                trust_root: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The base64-url-safe-encoded raw public key bytes of the issuer.
              cert_issuer_public_key: nil,
              # The base64-url-safe-encoded raw subject bytes of the issuer.
              cert_issuer_subject: nil,
              # The root CA certificate(s) that are used to validate leaf TLS certificates.
              trust_root: nil
            )
            end

            sig do
              override.returns(
                {
                  cert_issuer_public_key: String,
                  cert_issuer_subject: String,
                  trust_root: String
                }
              )
            end
            def to_hash
            end
          end

          class Version < Docker::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Docker::Models::SystemInfoResponse::Swarm::Cluster::Version,
                  Docker::Internal::AnyHash
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

        # Current local status of this node.
        module LocalNodeState
          extend Docker::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Docker::Models::SystemInfoResponse::Swarm::LocalNodeState
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EMPTY =
            T.let(
              :"",
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          INACTIVE =
            T.let(
              :inactive,
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          ERROR =
            T.let(
              :error,
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )
          LOCKED =
            T.let(
              :locked,
              Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Docker::Models::SystemInfoResponse::Swarm::LocalNodeState::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class RemoteManager < Docker::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Docker::Models::SystemInfoResponse::Swarm::RemoteManager,
                Docker::Internal::AnyHash
              )
            end

          # IP address and ports at which this node can be reached.
          sig { returns(T.nilable(String)) }
          attr_reader :addr

          sig { params(addr: String).void }
          attr_writer :addr

          # Unique identifier of for this node in the swarm.
          sig { returns(T.nilable(String)) }
          attr_reader :node_id

          sig { params(node_id: String).void }
          attr_writer :node_id

          # Represents a peer-node in the swarm
          sig do
            params(addr: String, node_id: String).returns(T.attached_class)
          end
          def self.new(
            # IP address and ports at which this node can be reached.
            addr: nil,
            # Unique identifier of for this node in the swarm.
            node_id: nil
          )
          end

          sig { override.returns({ addr: String, node_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
