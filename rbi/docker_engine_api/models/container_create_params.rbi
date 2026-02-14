# typed: strong

module DockerEngineAPI
  module Models
    class ContainerCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerCreateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Configuration for a container that is portable between hosts.
      sig { returns(DockerEngineAPI::ContainerCreateParams::Config) }
      attr_reader :config

      sig do
        params(
          config: DockerEngineAPI::ContainerCreateParams::Config::OrHash
        ).void
      end
      attr_writer :config

      # Assign the specified name to the container. Must match
      # `/?[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Platform in the format `os[/arch[/variant]]` used for image lookup.
      #
      # When specified, the daemon checks if the requested image is present in the local
      # image cache with the given OS and Architecture, and otherwise returns a `404`
      # status.
      #
      # If the option is not set, the host's native OS and Architecture are used to look
      # up the image in the image cache. However, if no platform is passed and the given
      # image does exist in the local image cache, but its OS or architecture does not
      # match, the container is created with the available image, and a warning is added
      # to the `Warnings` field in the response, for example;
      #
      #     WARNING: The requested image's platform (linux/arm64/v8) does not
      #              match the detected host platform (linux/amd64) and no
      #              specific platform was requested
      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig do
        params(
          config: DockerEngineAPI::ContainerCreateParams::Config::OrHash,
          name: String,
          platform: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Configuration for a container that is portable between hosts.
        config:,
        # Assign the specified name to the container. Must match
        # `/?[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
        name: nil,
        # Platform in the format `os[/arch[/variant]]` used for image lookup.
        #
        # When specified, the daemon checks if the requested image is present in the local
        # image cache with the given OS and Architecture, and otherwise returns a `404`
        # status.
        #
        # If the option is not set, the host's native OS and Architecture are used to look
        # up the image in the image cache. However, if no platform is passed and the given
        # image does exist in the local image cache, but its OS or architecture does not
        # match, the container is created with the available image, and a warning is added
        # to the `Warnings` field in the response, for example;
        #
        #     WARNING: The requested image's platform (linux/arm64/v8) does not
        #              match the detected host platform (linux/amd64) and no
        #              specific platform was requested
        platform: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            config: DockerEngineAPI::ContainerCreateParams::Config,
            name: String,
            platform: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Config < DockerEngineAPI::Models::Config
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::ContainerCreateParams::Config,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Container configuration that depends on the host we are running on
        sig do
          returns(
            T.nilable(
              DockerEngineAPI::ContainerCreateParams::Config::HostConfig
            )
          )
        end
        attr_reader :host_config

        sig do
          params(
            host_config:
              DockerEngineAPI::ContainerCreateParams::Config::HostConfig::OrHash
          ).void
        end
        attr_writer :host_config

        # NetworkingConfig represents the container's networking configuration for each of
        # its interfaces. It is used for the networking configs specified in the
        # `docker create` and `docker network connect` commands.
        sig do
          returns(
            T.nilable(
              DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig
            )
          )
        end
        attr_reader :networking_config

        sig do
          params(
            networking_config:
              DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::OrHash
          ).void
        end
        attr_writer :networking_config

        # Configuration for a container that is portable between hosts.
        sig do
          params(
            host_config:
              DockerEngineAPI::ContainerCreateParams::Config::HostConfig::OrHash,
            networking_config:
              DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Container configuration that depends on the host we are running on
          host_config: nil,
          # NetworkingConfig represents the container's networking configuration for each of
          # its interfaces. It is used for the networking configs specified in the
          # `docker create` and `docker network connect` commands.
          networking_config: nil
        )
        end

        sig do
          override.returns(
            {
              host_config:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig,
              networking_config:
                DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig
            }
          )
        end
        def to_hash
        end

        class HostConfig < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # Arbitrary non-identifying metadata attached to container and provided to the
          # runtime when the container is started.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :annotations

          sig { params(annotations: T::Hash[Symbol, String]).void }
          attr_writer :annotations

          # Automatically remove the container when the container's process exits. This has
          # no effect if `RestartPolicy` is set.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :auto_remove

          sig { params(auto_remove: T::Boolean).void }
          attr_writer :auto_remove

          # A list of volume bindings for this container. Each volume binding is a string in
          # one of these forms:
          #
          # - `host-src:container-dest[:options]` to bind-mount a host path into the
          #   container. Both `host-src`, and `container-dest` must be an _absolute_ path.
          # - `volume-name:container-dest[:options]` to bind-mount a volume managed by a
          #   volume driver into the container. `container-dest` must be an _absolute_ path.
          #
          # `options` is an optional, comma-delimited list of:
          #
          # - `nocopy` disables automatic copying of data from the container path to the
          #   volume. The `nocopy` flag only applies to named volumes.
          # - `[ro|rw]` mounts a volume read-only or read-write, respectively. If omitted or
          #   set to `rw`, volumes are mounted read-write.
          # - `[z|Z]` applies SELinux labels to allow or deny multiple containers to read
          #   and write to the same volume.
          #   - `z`: a _shared_ content label is applied to the content. This label
          #     indicates that multiple containers can share the volume content, for both
          #     reading and writing.
          #   - `Z`: a _private unshared_ label is applied to the content. This label
          #     indicates that only the current container can use a private volume. Labeling
          #     systems such as SELinux require proper labels to be placed on volume content
          #     that is mounted into a container. Without a label, the security system can
          #     prevent a container's processes from using the content. By default, the
          #     labels set by the host operating system are not modified.
          # - `[[r]shared|[r]slave|[r]private]` specifies mount
          #   [propagation behavior](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt).
          #   This only applies to bind-mounted volumes, not internal volumes or named
          #   volumes. Mount propagation requires the source mount point (the location where
          #   the source directory is mounted in the host operating system) to have the
          #   correct propagation properties. For shared volumes, the source mount point
          #   must be set to `shared`. For slave volumes, the mount must be set to either
          #   `shared` or `slave`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :binds

          sig { params(binds: T::Array[String]).void }
          attr_writer :binds

          # Limit read rate (bytes per second) from a device, in the form:
          #
          # ```
          # [{"Path": "device_path", "Rate": rate}]
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp
                ]
              )
            )
          end
          attr_reader :blkio_device_read_bps

          sig do
            params(
              blkio_device_read_bps:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp::OrHash
                ]
            ).void
          end
          attr_writer :blkio_device_read_bps

          # Limit read rate (IO per second) from a device, in the form:
          #
          # ```
          # [{"Path": "device_path", "Rate": rate}]
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp
                ]
              )
            )
          end
          attr_reader :blkio_device_read_i_ops

          sig do
            params(
              blkio_device_read_i_ops:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp::OrHash
                ]
            ).void
          end
          attr_writer :blkio_device_read_i_ops

          # Limit write rate (bytes per second) to a device, in the form:
          #
          # ```
          # [{"Path": "device_path", "Rate": rate}]
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp
                ]
              )
            )
          end
          attr_reader :blkio_device_write_bps

          sig do
            params(
              blkio_device_write_bps:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp::OrHash
                ]
            ).void
          end
          attr_writer :blkio_device_write_bps

          # Limit write rate (IO per second) to a device, in the form:
          #
          # ```
          # [{"Path": "device_path", "Rate": rate}]
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp
                ]
              )
            )
          end
          attr_reader :blkio_device_write_i_ops

          sig do
            params(
              blkio_device_write_i_ops:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp::OrHash
                ]
            ).void
          end
          attr_writer :blkio_device_write_i_ops

          # Block IO weight (relative weight).
          sig { returns(T.nilable(Integer)) }
          attr_reader :blkio_weight

          sig { params(blkio_weight: Integer).void }
          attr_writer :blkio_weight

          # Block IO weight (relative device weight) in the form:
          #
          # ```
          # [{"Path": "device_path", "Weight": weight}]
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice
                ]
              )
            )
          end
          attr_reader :blkio_weight_device

          sig do
            params(
              blkio_weight_device:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice::OrHash
                ]
            ).void
          end
          attr_writer :blkio_weight_device

          # A list of kernel capabilities to add to the container. Conflicts with option
          # 'Capabilities'.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :cap_add

          sig { params(cap_add: T::Array[String]).void }
          attr_writer :cap_add

          # A list of kernel capabilities to drop from the container. Conflicts with option
          # 'Capabilities'.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :cap_drop

          sig { params(cap_drop: T::Array[String]).void }
          attr_writer :cap_drop

          # Cgroup to use for the container.
          sig { returns(T.nilable(String)) }
          attr_reader :cgroup

          sig { params(cgroup: String).void }
          attr_writer :cgroup

          # cgroup namespace mode for the container. Possible values are:
          #
          # - `"private"`: the container runs in its own private cgroup namespace
          # - `"host"`: use the host system's cgroup namespace
          #
          # If not specified, the daemon default is used, which can either be `"private"` or
          # `"host"`, depending on daemon version, kernel support and configuration.
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::OrSymbol
              )
            )
          end
          attr_reader :cgroupns_mode

          sig do
            params(
              cgroupns_mode:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::OrSymbol
            ).void
          end
          attr_writer :cgroupns_mode

          # Path to `cgroups` under which the container's `cgroup` is created. If the path
          # is not absolute, the path is considered to be relative to the `cgroups` path of
          # the init process. Cgroups are created if they do not already exist.
          sig { returns(T.nilable(String)) }
          attr_reader :cgroup_parent

          sig { params(cgroup_parent: String).void }
          attr_writer :cgroup_parent

          # Initial console size, as an `[height, width]` array.
          sig { returns(T.nilable(T::Array[Integer])) }
          attr_accessor :console_size

          # Path to a file where the container ID is written
          sig { returns(T.nilable(String)) }
          attr_reader :container_id_file

          sig { params(container_id_file: String).void }
          attr_writer :container_id_file

          # The number of usable CPUs (Windows only).
          #
          # On Windows Server containers, the processor resource controls are mutually
          # exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
          # `CPUPercent` last.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_count

          sig { params(cpu_count: Integer).void }
          attr_writer :cpu_count

          # The usable percentage of the available CPUs (Windows only).
          #
          # On Windows Server containers, the processor resource controls are mutually
          # exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
          # `CPUPercent` last.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_percent

          sig { params(cpu_percent: Integer).void }
          attr_writer :cpu_percent

          # The length of a CPU period in microseconds.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_period

          sig { params(cpu_period: Integer).void }
          attr_writer :cpu_period

          # Microseconds of CPU time that the container can get in a CPU period.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_quota

          sig { params(cpu_quota: Integer).void }
          attr_writer :cpu_quota

          # The length of a CPU real-time period in microseconds. Set to 0 to allocate no
          # time allocated to real-time tasks.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_realtime_period

          sig { params(cpu_realtime_period: Integer).void }
          attr_writer :cpu_realtime_period

          # The length of a CPU real-time runtime in microseconds. Set to 0 to allocate no
          # time allocated to real-time tasks.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_realtime_runtime

          sig { params(cpu_realtime_runtime: Integer).void }
          attr_writer :cpu_realtime_runtime

          # CPUs in which to allow execution (e.g., `0-3`, `0,1`).
          sig { returns(T.nilable(String)) }
          attr_reader :cpuset_cpus

          sig { params(cpuset_cpus: String).void }
          attr_writer :cpuset_cpus

          # Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on
          # NUMA systems.
          sig { returns(T.nilable(String)) }
          attr_reader :cpuset_mems

          sig { params(cpuset_mems: String).void }
          attr_writer :cpuset_mems

          # An integer value representing this container's relative CPU weight versus other
          # containers.
          sig { returns(T.nilable(Integer)) }
          attr_reader :cpu_shares

          sig { params(cpu_shares: Integer).void }
          attr_writer :cpu_shares

          # a list of cgroup rules to apply to the container
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :device_cgroup_rules

          sig { params(device_cgroup_rules: T::Array[String]).void }
          attr_writer :device_cgroup_rules

          # A list of requests for devices to be sent to device drivers.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::DeviceRequest
                ]
              )
            )
          end
          attr_reader :device_requests

          sig do
            params(
              device_requests:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::DeviceRequest::OrHash
                ]
            ).void
          end
          attr_writer :device_requests

          # A list of devices to add to the container.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Device
                ]
              )
            )
          end
          attr_reader :devices

          sig do
            params(
              devices:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Device::OrHash
                ]
            ).void
          end
          attr_writer :devices

          # A list of DNS servers for the container to use.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :dns

          sig { params(dns: T::Array[String]).void }
          attr_writer :dns

          # A list of DNS options.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :dns_options

          sig { params(dns_options: T::Array[String]).void }
          attr_writer :dns_options

          # A list of DNS search domains.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :dns_search

          sig { params(dns_search: T::Array[String]).void }
          attr_writer :dns_search

          # A list of hostnames/IP mappings to add to the container's `/etc/hosts` file.
          # Specified in the form `["hostname:IP"]`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :extra_hosts

          sig { params(extra_hosts: T::Array[String]).void }
          attr_writer :extra_hosts

          # A list of additional groups that the container process will run as.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :group_add

          sig { params(group_add: T::Array[String]).void }
          attr_writer :group_add

          # Run an init inside the container that forwards signals and reaps processes. This
          # field is omitted if empty, and the default (as configured on the daemon) is
          # used.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :init

          # Maximum IO in bytes per second for the container system drive (Windows only).
          sig { returns(T.nilable(Integer)) }
          attr_reader :io_maximum_bandwidth

          sig { params(io_maximum_bandwidth: Integer).void }
          attr_writer :io_maximum_bandwidth

          # Maximum IOps for the container system drive (Windows only)
          sig { returns(T.nilable(Integer)) }
          attr_reader :io_maximum_i_ops

          sig { params(io_maximum_i_ops: Integer).void }
          attr_writer :io_maximum_i_ops

          # IPC sharing mode for the container. Possible values are:
          #
          # - `"none"`: own private IPC namespace, with /dev/shm not mounted
          # - `"private"`: own private IPC namespace
          # - `"shareable"`: own private IPC namespace, with a possibility to share it with
          #   other containers
          # - `"container:<name|id>"`: join another (shareable) container's IPC namespace
          # - `"host"`: use the host system's IPC namespace
          #
          # If not specified, daemon default is used, which can either be `"private"` or
          # `"shareable"`, depending on daemon version and configuration.
          sig { returns(T.nilable(String)) }
          attr_reader :ipc_mode

          sig { params(ipc_mode: String).void }
          attr_writer :ipc_mode

          # Isolation technology of the container. (Windows only)
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::OrSymbol
              )
            )
          end
          attr_reader :isolation

          sig do
            params(
              isolation:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::OrSymbol
            ).void
          end
          attr_writer :isolation

          # A list of links for the container in the form `container_name:alias`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :links

          sig { params(links: T::Array[String]).void }
          attr_writer :links

          # The logging configuration for this container
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig
              )
            )
          end
          attr_reader :log_config

          sig do
            params(
              log_config:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::OrHash
            ).void
          end
          attr_writer :log_config

          # The list of paths to be masked inside the container (this overrides the default
          # set of paths).
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :masked_paths

          sig { params(masked_paths: T::Array[String]).void }
          attr_writer :masked_paths

          # Memory limit in bytes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :memory

          sig { params(memory: Integer).void }
          attr_writer :memory

          # Memory soft limit in bytes.
          sig { returns(T.nilable(Integer)) }
          attr_reader :memory_reservation

          sig { params(memory_reservation: Integer).void }
          attr_writer :memory_reservation

          # Total memory limit (memory + swap). Set as `-1` to enable unlimited swap.
          sig { returns(T.nilable(Integer)) }
          attr_reader :memory_swap

          sig { params(memory_swap: Integer).void }
          attr_writer :memory_swap

          # Tune a container's memory swappiness behavior. Accepts an integer between 0
          # and 100.
          sig { returns(T.nilable(Integer)) }
          attr_reader :memory_swappiness

          sig { params(memory_swappiness: Integer).void }
          attr_writer :memory_swappiness

          # Specification for mounts to be added to the container.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount
                ]
              )
            )
          end
          attr_reader :mounts

          sig do
            params(
              mounts:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::OrHash
                ]
            ).void
          end
          attr_writer :mounts

          # CPU quota in units of 10<sup>-9</sup> CPUs.
          sig { returns(T.nilable(Integer)) }
          attr_reader :nano_cpus

          sig { params(nano_cpus: Integer).void }
          attr_writer :nano_cpus

          # Network mode to use for this container. Supported standard values are: `bridge`,
          # `host`, `none`, and `container:<name|id>`. Any other value is taken as a custom
          # network's name to which this container should connect to.
          sig { returns(T.nilable(String)) }
          attr_reader :network_mode

          sig { params(network_mode: String).void }
          attr_writer :network_mode

          # Disable OOM Killer for the container.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :oom_kill_disable

          sig { params(oom_kill_disable: T::Boolean).void }
          attr_writer :oom_kill_disable

          # An integer value containing the score given to the container in order to tune
          # OOM killer preferences.
          sig { returns(T.nilable(Integer)) }
          attr_reader :oom_score_adj

          sig { params(oom_score_adj: Integer).void }
          attr_writer :oom_score_adj

          # Set the PID (Process) Namespace mode for the container. It can be either:
          #
          # - `"container:<name|id>"`: joins another container's PID namespace
          # - `"host"`: use the host's PID namespace inside the container
          sig { returns(T.nilable(String)) }
          attr_reader :pid_mode

          sig { params(pid_mode: String).void }
          attr_writer :pid_mode

          # Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
          # change.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :pids_limit

          # PortMap describes the mapping of container ports to host ports, using the
          # container's port-number and protocol as key in the format `<port>/<protocol>`,
          # for example, `80/udp`.
          #
          # If a container's port is mapped for multiple protocols, separate entries are
          # added to the mapping table.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::PortBinding
                  ]
                ]
              )
            )
          end
          attr_reader :port_bindings

          sig do
            params(
              port_bindings:
                T::Hash[
                  Symbol,
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::PortBinding::OrHash
                  ]
                ]
            ).void
          end
          attr_writer :port_bindings

          # Gives the container full access to the host.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :privileged

          sig { params(privileged: T::Boolean).void }
          attr_writer :privileged

          # Allocates an ephemeral host port for all of a container's exposed ports.
          #
          # Ports are de-allocated when the container stops and allocated when the container
          # starts. The allocated port might be changed when restarting the container.
          #
          # The port is selected from the ephemeral port range that depends on the kernel.
          # For example, on Linux the range is defined by
          # `/proc/sys/net/ipv4/ip_local_port_range`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :publish_all_ports

          sig { params(publish_all_ports: T::Boolean).void }
          attr_writer :publish_all_ports

          # The list of paths to be set as read-only inside the container (this overrides
          # the default set of paths).
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :readonly_paths

          sig { params(readonly_paths: T::Array[String]).void }
          attr_writer :readonly_paths

          # Mount the container's root filesystem as read only.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :readonly_rootfs

          sig { params(readonly_rootfs: T::Boolean).void }
          attr_writer :readonly_rootfs

          # The behavior to apply when the container exits. The default is not to restart.
          #
          # An ever increasing delay (double the previous delay, starting at 100ms) is added
          # before each restart to prevent flooding the server.
          sig do
            returns(
              T.nilable(
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy
              )
            )
          end
          attr_reader :restart_policy

          sig do
            params(
              restart_policy:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::OrHash
            ).void
          end
          attr_writer :restart_policy

          # Runtime to use with this container.
          sig { returns(T.nilable(String)) }
          attr_accessor :runtime

          # A list of string values to customize labels for MLS systems, such as SELinux.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :security_opt

          sig { params(security_opt: T::Array[String]).void }
          attr_writer :security_opt

          # Size of `/dev/shm` in bytes. If omitted, the system uses 64MB.
          sig { returns(T.nilable(Integer)) }
          attr_reader :shm_size

          sig { params(shm_size: Integer).void }
          attr_writer :shm_size

          # Storage driver options for this container, in the form `{"size": "120G"}`.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :storage_opt

          sig { params(storage_opt: T::Hash[Symbol, String]).void }
          attr_writer :storage_opt

          # A list of kernel parameters (sysctls) to set in the container.
          #
          # This field is omitted if not set.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_accessor :sysctls

          # A map of container directories which should be replaced by tmpfs mounts, and
          # their corresponding mount options. For example:
          #
          # ```
          # { "/run": "rw,noexec,nosuid,size=65536k" }
          # ```
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :tmpfs

          sig { params(tmpfs: T::Hash[Symbol, String]).void }
          attr_writer :tmpfs

          # A list of resource limits to set in the container. For example:
          #
          # ```
          # {"Name": "nofile", "Soft": 1024, "Hard": 2048}
          # ```
          sig do
            returns(
              T.nilable(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Ulimit
                ]
              )
            )
          end
          attr_reader :ulimits

          sig do
            params(
              ulimits:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Ulimit::OrHash
                ]
            ).void
          end
          attr_writer :ulimits

          # Sets the usernamespace mode for the container when usernamespace remapping
          # option is enabled.
          sig { returns(T.nilable(String)) }
          attr_reader :userns_mode

          sig { params(userns_mode: String).void }
          attr_writer :userns_mode

          # UTS namespace to use for the container.
          sig { returns(T.nilable(String)) }
          attr_reader :uts_mode

          sig { params(uts_mode: String).void }
          attr_writer :uts_mode

          # Driver that this container uses to mount volumes.
          sig { returns(T.nilable(String)) }
          attr_reader :volume_driver

          sig { params(volume_driver: String).void }
          attr_writer :volume_driver

          # A list of volumes to inherit from another container, specified in the form
          # `<container name>[:<ro|rw>]`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :volumes_from

          sig { params(volumes_from: T::Array[String]).void }
          attr_writer :volumes_from

          # Container configuration that depends on the host we are running on
          sig do
            params(
              annotations: T::Hash[Symbol, String],
              auto_remove: T::Boolean,
              binds: T::Array[String],
              blkio_device_read_bps:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp::OrHash
                ],
              blkio_device_read_i_ops:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp::OrHash
                ],
              blkio_device_write_bps:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp::OrHash
                ],
              blkio_device_write_i_ops:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp::OrHash
                ],
              blkio_weight: Integer,
              blkio_weight_device:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice::OrHash
                ],
              cap_add: T::Array[String],
              cap_drop: T::Array[String],
              cgroup: String,
              cgroupns_mode:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::OrSymbol,
              cgroup_parent: String,
              console_size: T.nilable(T::Array[Integer]),
              container_id_file: String,
              cpu_count: Integer,
              cpu_percent: Integer,
              cpu_period: Integer,
              cpu_quota: Integer,
              cpu_realtime_period: Integer,
              cpu_realtime_runtime: Integer,
              cpuset_cpus: String,
              cpuset_mems: String,
              cpu_shares: Integer,
              device_cgroup_rules: T::Array[String],
              device_requests:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::DeviceRequest::OrHash
                ],
              devices:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Device::OrHash
                ],
              dns: T::Array[String],
              dns_options: T::Array[String],
              dns_search: T::Array[String],
              extra_hosts: T::Array[String],
              group_add: T::Array[String],
              init: T.nilable(T::Boolean),
              io_maximum_bandwidth: Integer,
              io_maximum_i_ops: Integer,
              ipc_mode: String,
              isolation:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::OrSymbol,
              links: T::Array[String],
              log_config:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::OrHash,
              masked_paths: T::Array[String],
              memory: Integer,
              memory_reservation: Integer,
              memory_swap: Integer,
              memory_swappiness: Integer,
              mounts:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::OrHash
                ],
              nano_cpus: Integer,
              network_mode: String,
              oom_kill_disable: T::Boolean,
              oom_score_adj: Integer,
              pid_mode: String,
              pids_limit: T.nilable(Integer),
              port_bindings:
                T::Hash[
                  Symbol,
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::PortBinding::OrHash
                  ]
                ],
              privileged: T::Boolean,
              publish_all_ports: T::Boolean,
              readonly_paths: T::Array[String],
              readonly_rootfs: T::Boolean,
              restart_policy:
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::OrHash,
              runtime: T.nilable(String),
              security_opt: T::Array[String],
              shm_size: Integer,
              storage_opt: T::Hash[Symbol, String],
              sysctls: T.nilable(T::Hash[Symbol, String]),
              tmpfs: T::Hash[Symbol, String],
              ulimits:
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Ulimit::OrHash
                ],
              userns_mode: String,
              uts_mode: String,
              volume_driver: String,
              volumes_from: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # Arbitrary non-identifying metadata attached to container and provided to the
            # runtime when the container is started.
            annotations: nil,
            # Automatically remove the container when the container's process exits. This has
            # no effect if `RestartPolicy` is set.
            auto_remove: nil,
            # A list of volume bindings for this container. Each volume binding is a string in
            # one of these forms:
            #
            # - `host-src:container-dest[:options]` to bind-mount a host path into the
            #   container. Both `host-src`, and `container-dest` must be an _absolute_ path.
            # - `volume-name:container-dest[:options]` to bind-mount a volume managed by a
            #   volume driver into the container. `container-dest` must be an _absolute_ path.
            #
            # `options` is an optional, comma-delimited list of:
            #
            # - `nocopy` disables automatic copying of data from the container path to the
            #   volume. The `nocopy` flag only applies to named volumes.
            # - `[ro|rw]` mounts a volume read-only or read-write, respectively. If omitted or
            #   set to `rw`, volumes are mounted read-write.
            # - `[z|Z]` applies SELinux labels to allow or deny multiple containers to read
            #   and write to the same volume.
            #   - `z`: a _shared_ content label is applied to the content. This label
            #     indicates that multiple containers can share the volume content, for both
            #     reading and writing.
            #   - `Z`: a _private unshared_ label is applied to the content. This label
            #     indicates that only the current container can use a private volume. Labeling
            #     systems such as SELinux require proper labels to be placed on volume content
            #     that is mounted into a container. Without a label, the security system can
            #     prevent a container's processes from using the content. By default, the
            #     labels set by the host operating system are not modified.
            # - `[[r]shared|[r]slave|[r]private]` specifies mount
            #   [propagation behavior](https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt).
            #   This only applies to bind-mounted volumes, not internal volumes or named
            #   volumes. Mount propagation requires the source mount point (the location where
            #   the source directory is mounted in the host operating system) to have the
            #   correct propagation properties. For shared volumes, the source mount point
            #   must be set to `shared`. For slave volumes, the mount must be set to either
            #   `shared` or `slave`.
            binds: nil,
            # Limit read rate (bytes per second) from a device, in the form:
            #
            # ```
            # [{"Path": "device_path", "Rate": rate}]
            # ```
            blkio_device_read_bps: nil,
            # Limit read rate (IO per second) from a device, in the form:
            #
            # ```
            # [{"Path": "device_path", "Rate": rate}]
            # ```
            blkio_device_read_i_ops: nil,
            # Limit write rate (bytes per second) to a device, in the form:
            #
            # ```
            # [{"Path": "device_path", "Rate": rate}]
            # ```
            blkio_device_write_bps: nil,
            # Limit write rate (IO per second) to a device, in the form:
            #
            # ```
            # [{"Path": "device_path", "Rate": rate}]
            # ```
            blkio_device_write_i_ops: nil,
            # Block IO weight (relative weight).
            blkio_weight: nil,
            # Block IO weight (relative device weight) in the form:
            #
            # ```
            # [{"Path": "device_path", "Weight": weight}]
            # ```
            blkio_weight_device: nil,
            # A list of kernel capabilities to add to the container. Conflicts with option
            # 'Capabilities'.
            cap_add: nil,
            # A list of kernel capabilities to drop from the container. Conflicts with option
            # 'Capabilities'.
            cap_drop: nil,
            # Cgroup to use for the container.
            cgroup: nil,
            # cgroup namespace mode for the container. Possible values are:
            #
            # - `"private"`: the container runs in its own private cgroup namespace
            # - `"host"`: use the host system's cgroup namespace
            #
            # If not specified, the daemon default is used, which can either be `"private"` or
            # `"host"`, depending on daemon version, kernel support and configuration.
            cgroupns_mode: nil,
            # Path to `cgroups` under which the container's `cgroup` is created. If the path
            # is not absolute, the path is considered to be relative to the `cgroups` path of
            # the init process. Cgroups are created if they do not already exist.
            cgroup_parent: nil,
            # Initial console size, as an `[height, width]` array.
            console_size: nil,
            # Path to a file where the container ID is written
            container_id_file: nil,
            # The number of usable CPUs (Windows only).
            #
            # On Windows Server containers, the processor resource controls are mutually
            # exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
            # `CPUPercent` last.
            cpu_count: nil,
            # The usable percentage of the available CPUs (Windows only).
            #
            # On Windows Server containers, the processor resource controls are mutually
            # exclusive. The order of precedence is `CPUCount` first, then `CPUShares`, and
            # `CPUPercent` last.
            cpu_percent: nil,
            # The length of a CPU period in microseconds.
            cpu_period: nil,
            # Microseconds of CPU time that the container can get in a CPU period.
            cpu_quota: nil,
            # The length of a CPU real-time period in microseconds. Set to 0 to allocate no
            # time allocated to real-time tasks.
            cpu_realtime_period: nil,
            # The length of a CPU real-time runtime in microseconds. Set to 0 to allocate no
            # time allocated to real-time tasks.
            cpu_realtime_runtime: nil,
            # CPUs in which to allow execution (e.g., `0-3`, `0,1`).
            cpuset_cpus: nil,
            # Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only effective on
            # NUMA systems.
            cpuset_mems: nil,
            # An integer value representing this container's relative CPU weight versus other
            # containers.
            cpu_shares: nil,
            # a list of cgroup rules to apply to the container
            device_cgroup_rules: nil,
            # A list of requests for devices to be sent to device drivers.
            device_requests: nil,
            # A list of devices to add to the container.
            devices: nil,
            # A list of DNS servers for the container to use.
            dns: nil,
            # A list of DNS options.
            dns_options: nil,
            # A list of DNS search domains.
            dns_search: nil,
            # A list of hostnames/IP mappings to add to the container's `/etc/hosts` file.
            # Specified in the form `["hostname:IP"]`.
            extra_hosts: nil,
            # A list of additional groups that the container process will run as.
            group_add: nil,
            # Run an init inside the container that forwards signals and reaps processes. This
            # field is omitted if empty, and the default (as configured on the daemon) is
            # used.
            init: nil,
            # Maximum IO in bytes per second for the container system drive (Windows only).
            io_maximum_bandwidth: nil,
            # Maximum IOps for the container system drive (Windows only)
            io_maximum_i_ops: nil,
            # IPC sharing mode for the container. Possible values are:
            #
            # - `"none"`: own private IPC namespace, with /dev/shm not mounted
            # - `"private"`: own private IPC namespace
            # - `"shareable"`: own private IPC namespace, with a possibility to share it with
            #   other containers
            # - `"container:<name|id>"`: join another (shareable) container's IPC namespace
            # - `"host"`: use the host system's IPC namespace
            #
            # If not specified, daemon default is used, which can either be `"private"` or
            # `"shareable"`, depending on daemon version and configuration.
            ipc_mode: nil,
            # Isolation technology of the container. (Windows only)
            isolation: nil,
            # A list of links for the container in the form `container_name:alias`.
            links: nil,
            # The logging configuration for this container
            log_config: nil,
            # The list of paths to be masked inside the container (this overrides the default
            # set of paths).
            masked_paths: nil,
            # Memory limit in bytes.
            memory: nil,
            # Memory soft limit in bytes.
            memory_reservation: nil,
            # Total memory limit (memory + swap). Set as `-1` to enable unlimited swap.
            memory_swap: nil,
            # Tune a container's memory swappiness behavior. Accepts an integer between 0
            # and 100.
            memory_swappiness: nil,
            # Specification for mounts to be added to the container.
            mounts: nil,
            # CPU quota in units of 10<sup>-9</sup> CPUs.
            nano_cpus: nil,
            # Network mode to use for this container. Supported standard values are: `bridge`,
            # `host`, `none`, and `container:<name|id>`. Any other value is taken as a custom
            # network's name to which this container should connect to.
            network_mode: nil,
            # Disable OOM Killer for the container.
            oom_kill_disable: nil,
            # An integer value containing the score given to the container in order to tune
            # OOM killer preferences.
            oom_score_adj: nil,
            # Set the PID (Process) Namespace mode for the container. It can be either:
            #
            # - `"container:<name|id>"`: joins another container's PID namespace
            # - `"host"`: use the host's PID namespace inside the container
            pid_mode: nil,
            # Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
            # change.
            pids_limit: nil,
            # PortMap describes the mapping of container ports to host ports, using the
            # container's port-number and protocol as key in the format `<port>/<protocol>`,
            # for example, `80/udp`.
            #
            # If a container's port is mapped for multiple protocols, separate entries are
            # added to the mapping table.
            port_bindings: nil,
            # Gives the container full access to the host.
            privileged: nil,
            # Allocates an ephemeral host port for all of a container's exposed ports.
            #
            # Ports are de-allocated when the container stops and allocated when the container
            # starts. The allocated port might be changed when restarting the container.
            #
            # The port is selected from the ephemeral port range that depends on the kernel.
            # For example, on Linux the range is defined by
            # `/proc/sys/net/ipv4/ip_local_port_range`.
            publish_all_ports: nil,
            # The list of paths to be set as read-only inside the container (this overrides
            # the default set of paths).
            readonly_paths: nil,
            # Mount the container's root filesystem as read only.
            readonly_rootfs: nil,
            # The behavior to apply when the container exits. The default is not to restart.
            #
            # An ever increasing delay (double the previous delay, starting at 100ms) is added
            # before each restart to prevent flooding the server.
            restart_policy: nil,
            # Runtime to use with this container.
            runtime: nil,
            # A list of string values to customize labels for MLS systems, such as SELinux.
            security_opt: nil,
            # Size of `/dev/shm` in bytes. If omitted, the system uses 64MB.
            shm_size: nil,
            # Storage driver options for this container, in the form `{"size": "120G"}`.
            storage_opt: nil,
            # A list of kernel parameters (sysctls) to set in the container.
            #
            # This field is omitted if not set.
            sysctls: nil,
            # A map of container directories which should be replaced by tmpfs mounts, and
            # their corresponding mount options. For example:
            #
            # ```
            # { "/run": "rw,noexec,nosuid,size=65536k" }
            # ```
            tmpfs: nil,
            # A list of resource limits to set in the container. For example:
            #
            # ```
            # {"Name": "nofile", "Soft": 1024, "Hard": 2048}
            # ```
            ulimits: nil,
            # Sets the usernamespace mode for the container when usernamespace remapping
            # option is enabled.
            userns_mode: nil,
            # UTS namespace to use for the container.
            uts_mode: nil,
            # Driver that this container uses to mount volumes.
            volume_driver: nil,
            # A list of volumes to inherit from another container, specified in the form
            # `<container name>[:<ro|rw>]`.
            volumes_from: nil
          )
          end

          sig do
            override.returns(
              {
                annotations: T::Hash[Symbol, String],
                auto_remove: T::Boolean,
                binds: T::Array[String],
                blkio_device_read_bps:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp
                  ],
                blkio_device_read_i_ops:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp
                  ],
                blkio_device_write_bps:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp
                  ],
                blkio_device_write_i_ops:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp
                  ],
                blkio_weight: Integer,
                blkio_weight_device:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice
                  ],
                cap_add: T::Array[String],
                cap_drop: T::Array[String],
                cgroup: String,
                cgroupns_mode:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::OrSymbol,
                cgroup_parent: String,
                console_size: T.nilable(T::Array[Integer]),
                container_id_file: String,
                cpu_count: Integer,
                cpu_percent: Integer,
                cpu_period: Integer,
                cpu_quota: Integer,
                cpu_realtime_period: Integer,
                cpu_realtime_runtime: Integer,
                cpuset_cpus: String,
                cpuset_mems: String,
                cpu_shares: Integer,
                device_cgroup_rules: T::Array[String],
                device_requests:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::DeviceRequest
                  ],
                devices:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Device
                  ],
                dns: T::Array[String],
                dns_options: T::Array[String],
                dns_search: T::Array[String],
                extra_hosts: T::Array[String],
                group_add: T::Array[String],
                init: T.nilable(T::Boolean),
                io_maximum_bandwidth: Integer,
                io_maximum_i_ops: Integer,
                ipc_mode: String,
                isolation:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::OrSymbol,
                links: T::Array[String],
                log_config:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig,
                masked_paths: T::Array[String],
                memory: Integer,
                memory_reservation: Integer,
                memory_swap: Integer,
                memory_swappiness: Integer,
                mounts:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount
                  ],
                nano_cpus: Integer,
                network_mode: String,
                oom_kill_disable: T::Boolean,
                oom_score_adj: Integer,
                pid_mode: String,
                pids_limit: T.nilable(Integer),
                port_bindings:
                  T::Hash[
                    Symbol,
                    T::Array[
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::PortBinding
                    ]
                  ],
                privileged: T::Boolean,
                publish_all_ports: T::Boolean,
                readonly_paths: T::Array[String],
                readonly_rootfs: T::Boolean,
                restart_policy:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy,
                runtime: T.nilable(String),
                security_opt: T::Array[String],
                shm_size: Integer,
                storage_opt: T::Hash[Symbol, String],
                sysctls: T.nilable(T::Hash[Symbol, String]),
                tmpfs: T::Hash[Symbol, String],
                ulimits:
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Ulimit
                  ],
                userns_mode: String,
                uts_mode: String,
                volume_driver: String,
                volumes_from: T::Array[String]
              }
            )
          end
          def to_hash
          end

          class BlkioDeviceReadBp < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadBp,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Device path
            sig { returns(T.nilable(String)) }
            attr_reader :path

            sig { params(path: String).void }
            attr_writer :path

            # Rate
            sig { returns(T.nilable(Integer)) }
            attr_reader :rate

            sig { params(rate: Integer).void }
            attr_writer :rate

            sig do
              params(path: String, rate: Integer).returns(T.attached_class)
            end
            def self.new(
              # Device path
              path: nil,
              # Rate
              rate: nil
            )
            end

            sig { override.returns({ path: String, rate: Integer }) }
            def to_hash
            end
          end

          class BlkioDeviceReadIOp < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceReadIOp,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Device path
            sig { returns(T.nilable(String)) }
            attr_reader :path

            sig { params(path: String).void }
            attr_writer :path

            # Rate
            sig { returns(T.nilable(Integer)) }
            attr_reader :rate

            sig { params(rate: Integer).void }
            attr_writer :rate

            sig do
              params(path: String, rate: Integer).returns(T.attached_class)
            end
            def self.new(
              # Device path
              path: nil,
              # Rate
              rate: nil
            )
            end

            sig { override.returns({ path: String, rate: Integer }) }
            def to_hash
            end
          end

          class BlkioDeviceWriteBp < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteBp,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Device path
            sig { returns(T.nilable(String)) }
            attr_reader :path

            sig { params(path: String).void }
            attr_writer :path

            # Rate
            sig { returns(T.nilable(Integer)) }
            attr_reader :rate

            sig { params(rate: Integer).void }
            attr_writer :rate

            sig do
              params(path: String, rate: Integer).returns(T.attached_class)
            end
            def self.new(
              # Device path
              path: nil,
              # Rate
              rate: nil
            )
            end

            sig { override.returns({ path: String, rate: Integer }) }
            def to_hash
            end
          end

          class BlkioDeviceWriteIOp < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioDeviceWriteIOp,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Device path
            sig { returns(T.nilable(String)) }
            attr_reader :path

            sig { params(path: String).void }
            attr_writer :path

            # Rate
            sig { returns(T.nilable(Integer)) }
            attr_reader :rate

            sig { params(rate: Integer).void }
            attr_writer :rate

            sig do
              params(path: String, rate: Integer).returns(T.attached_class)
            end
            def self.new(
              # Device path
              path: nil,
              # Rate
              rate: nil
            )
            end

            sig { override.returns({ path: String, rate: Integer }) }
            def to_hash
            end
          end

          class BlkioWeightDevice < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::BlkioWeightDevice,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :path

            sig { params(path: String).void }
            attr_writer :path

            sig { returns(T.nilable(Integer)) }
            attr_reader :weight

            sig { params(weight: Integer).void }
            attr_writer :weight

            sig do
              params(path: String, weight: Integer).returns(T.attached_class)
            end
            def self.new(path: nil, weight: nil)
            end

            sig { override.returns({ path: String, weight: Integer }) }
            def to_hash
            end
          end

          # cgroup namespace mode for the container. Possible values are:
          #
          # - `"private"`: the container runs in its own private cgroup namespace
          # - `"host"`: use the host system's cgroup namespace
          #
          # If not specified, the daemon default is used, which can either be `"private"` or
          # `"host"`, depending on daemon version, kernel support and configuration.
          module CgroupnsMode
            extend DockerEngineAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PRIVATE =
              T.let(
                :private,
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::TaggedSymbol
              )
            HOST =
              T.let(
                :host,
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::CgroupnsMode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class DeviceRequest < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::DeviceRequest,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # A list of capabilities; an OR list of AND lists of capabilities.
            #
            # Note that if a driver is specified the capabilities have no effect on selecting
            # a driver as the driver name is used directly.
            #
            # Note that if no driver is specified the capabilities are used to select a driver
            # with the required capabilities.
            sig { returns(T.nilable(T::Array[T::Array[String]])) }
            attr_reader :capabilities

            sig { params(capabilities: T::Array[T::Array[String]]).void }
            attr_writer :capabilities

            sig { returns(T.nilable(Integer)) }
            attr_reader :count

            sig { params(count: Integer).void }
            attr_writer :count

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :device_ids

            sig { params(device_ids: T::Array[String]).void }
            attr_writer :device_ids

            # The name of the device driver to use for this request.
            #
            # Note that if this is specified the capabilities are ignored when selecting a
            # device driver.
            sig { returns(T.nilable(String)) }
            attr_reader :driver

            sig { params(driver: String).void }
            attr_writer :driver

            # Driver-specific options, specified as a key/value pairs. These options are
            # passed directly to the driver.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :options

            sig { params(options: T::Hash[Symbol, String]).void }
            attr_writer :options

            # A request for devices to be sent to device drivers
            sig do
              params(
                capabilities: T::Array[T::Array[String]],
                count: Integer,
                device_ids: T::Array[String],
                driver: String,
                options: T::Hash[Symbol, String]
              ).returns(T.attached_class)
            end
            def self.new(
              # A list of capabilities; an OR list of AND lists of capabilities.
              #
              # Note that if a driver is specified the capabilities have no effect on selecting
              # a driver as the driver name is used directly.
              #
              # Note that if no driver is specified the capabilities are used to select a driver
              # with the required capabilities.
              capabilities: nil,
              count: nil,
              device_ids: nil,
              # The name of the device driver to use for this request.
              #
              # Note that if this is specified the capabilities are ignored when selecting a
              # device driver.
              driver: nil,
              # Driver-specific options, specified as a key/value pairs. These options are
              # passed directly to the driver.
              options: nil
            )
            end

            sig do
              override.returns(
                {
                  capabilities: T::Array[T::Array[String]],
                  count: Integer,
                  device_ids: T::Array[String],
                  driver: String,
                  options: T::Hash[Symbol, String]
                }
              )
            end
            def to_hash
            end
          end

          class Device < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Device,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :cgroup_permissions

            sig { params(cgroup_permissions: String).void }
            attr_writer :cgroup_permissions

            sig { returns(T.nilable(String)) }
            attr_reader :path_in_container

            sig { params(path_in_container: String).void }
            attr_writer :path_in_container

            sig { returns(T.nilable(String)) }
            attr_reader :path_on_host

            sig { params(path_on_host: String).void }
            attr_writer :path_on_host

            # A device mapping between the host and container
            sig do
              params(
                cgroup_permissions: String,
                path_in_container: String,
                path_on_host: String
              ).returns(T.attached_class)
            end
            def self.new(
              cgroup_permissions: nil,
              path_in_container: nil,
              path_on_host: nil
            )
            end

            sig do
              override.returns(
                {
                  cgroup_permissions: String,
                  path_in_container: String,
                  path_on_host: String
                }
              )
            end
            def to_hash
            end
          end

          # Isolation technology of the container. (Windows only)
          module Isolation
            extend DockerEngineAPI::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DEFAULT =
              T.let(
                :default,
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::TaggedSymbol
              )
            PROCESS =
              T.let(
                :process,
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::TaggedSymbol
              )
            HYPERV =
              T.let(
                :hyperv,
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::TaggedSymbol
              )
            EMPTY =
              T.let(
                :"",
                DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Isolation::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class LogConfig < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Driver-specific configuration options for the logging driver.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :config

            sig { params(config: T::Hash[Symbol, String]).void }
            attr_writer :config

            # Name of the logging driver used for the container or "none" if logging is
            # disabled.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::OrSymbol
              ).void
            end
            attr_writer :type

            # The logging configuration for this container
            sig do
              params(
                config: T::Hash[Symbol, String],
                type:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Driver-specific configuration options for the logging driver.
              config: nil,
              # Name of the logging driver used for the container or "none" if logging is
              # disabled.
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  config: T::Hash[Symbol, String],
                  type:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Name of the logging driver used for the container or "none" if logging is
            # disabled.
            module Type
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              LOCAL =
                T.let(
                  :local,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              JSON_FILE =
                T.let(
                  :"json-file",
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              SYSLOG =
                T.let(
                  :syslog,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              JOURNALD =
                T.let(
                  :journald,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              GELF =
                T.let(
                  :gelf,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              FLUENTD =
                T.let(
                  :fluentd,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              AWSLOGS =
                T.let(
                  :awslogs,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              SPLUNK =
                T.let(
                  :splunk,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              ETWLOGS =
                T.let(
                  :etwlogs,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )
              NONE =
                T.let(
                  :none,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::LogConfig::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Mount < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Optional configuration for the `bind` type.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions
                )
              )
            end
            attr_reader :bind_options

            sig do
              params(
                bind_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::OrHash
              ).void
            end
            attr_writer :bind_options

            # The consistency requirement for the mount: `default`, `consistent`, `cached`, or
            # `delegated`.
            sig { returns(T.nilable(String)) }
            attr_reader :consistency

            sig { params(consistency: String).void }
            attr_writer :consistency

            # Optional configuration for the `image` type.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions
                )
              )
            end
            attr_reader :image_options

            sig do
              params(
                image_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions::OrHash
              ).void
            end
            attr_writer :image_options

            # Whether the mount should be read-only.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :read_only

            sig { params(read_only: T::Boolean).void }
            attr_writer :read_only

            # Mount source (e.g. a volume name, a host path). The source cannot be specified
            # when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
            # the `CreateMountpoint` must be set to `true` to create the source path on the
            # host if missing.
            #
            # For `Type=npipe`, the pipe must exist prior to creating the container.
            sig { returns(T.nilable(String)) }
            attr_reader :source

            sig { params(source: String).void }
            attr_writer :source

            # Container path.
            sig { returns(T.nilable(String)) }
            attr_reader :target

            sig { params(target: String).void }
            attr_writer :target

            # Optional configuration for the `tmpfs` type.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions
                )
              )
            end
            attr_reader :tmpfs_options

            sig do
              params(
                tmpfs_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions::OrHash
              ).void
            end
            attr_writer :tmpfs_options

            # The mount type. Available types:
            #
            # - `bind` a mount of a file or directory from the host into the container.
            # - `cluster` a Swarm cluster volume.
            # - `image` an OCI image.
            # - `npipe` a named pipe from the host into the container.
            # - `tmpfs` a `tmpfs`.
            # - `volume` a docker volume with the given `Name`.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::OrSymbol
              ).void
            end
            attr_writer :type

            # Optional configuration for the `volume` type.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions
                )
              )
            end
            attr_reader :volume_options

            sig do
              params(
                volume_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::OrHash
              ).void
            end
            attr_writer :volume_options

            sig do
              params(
                bind_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::OrHash,
                consistency: String,
                image_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions::OrHash,
                read_only: T::Boolean,
                source: String,
                target: String,
                tmpfs_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions::OrHash,
                type:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::OrSymbol,
                volume_options:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Optional configuration for the `bind` type.
              bind_options: nil,
              # The consistency requirement for the mount: `default`, `consistent`, `cached`, or
              # `delegated`.
              consistency: nil,
              # Optional configuration for the `image` type.
              image_options: nil,
              # Whether the mount should be read-only.
              read_only: nil,
              # Mount source (e.g. a volume name, a host path). The source cannot be specified
              # when using `Type=tmpfs`. For `Type=bind`, the source path must either exist, or
              # the `CreateMountpoint` must be set to `true` to create the source path on the
              # host if missing.
              #
              # For `Type=npipe`, the pipe must exist prior to creating the container.
              source: nil,
              # Container path.
              target: nil,
              # Optional configuration for the `tmpfs` type.
              tmpfs_options: nil,
              # The mount type. Available types:
              #
              # - `bind` a mount of a file or directory from the host into the container.
              # - `cluster` a Swarm cluster volume.
              # - `image` an OCI image.
              # - `npipe` a named pipe from the host into the container.
              # - `tmpfs` a `tmpfs`.
              # - `volume` a docker volume with the given `Name`.
              type: nil,
              # Optional configuration for the `volume` type.
              volume_options: nil
            )
            end

            sig do
              override.returns(
                {
                  bind_options:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions,
                  consistency: String,
                  image_options:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions,
                  read_only: T::Boolean,
                  source: String,
                  target: String,
                  tmpfs_options:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions,
                  type:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::OrSymbol,
                  volume_options:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions
                }
              )
            end
            def to_hash
            end

            class BindOptions < DockerEngineAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions,
                    DockerEngineAPI::Internal::AnyHash
                  )
                end

              # Create mount point on host if missing
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :create_mountpoint

              sig { params(create_mountpoint: T::Boolean).void }
              attr_writer :create_mountpoint

              # Disable recursive bind mount.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :non_recursive

              sig { params(non_recursive: T::Boolean).void }
              attr_writer :non_recursive

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              sig do
                returns(
                  T.nilable(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::OrSymbol
                  )
                )
              end
              attr_reader :propagation

              sig do
                params(
                  propagation:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::OrSymbol
                ).void
              end
              attr_writer :propagation

              # Raise an error if the mount cannot be made recursively read-only.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :read_only_force_recursive

              sig { params(read_only_force_recursive: T::Boolean).void }
              attr_writer :read_only_force_recursive

              # Make the mount non-recursively read-only, but still leave the mount recursive
              # (unless NonRecursive is set to `true` in conjunction).
              #
              # Added in v1.44, before that version all read-only mounts were non-recursive by
              # default. To match the previous behaviour this will default to `true` for clients
              # on versions prior to v1.44.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :read_only_non_recursive

              sig { params(read_only_non_recursive: T::Boolean).void }
              attr_writer :read_only_non_recursive

              # Optional configuration for the `bind` type.
              sig do
                params(
                  create_mountpoint: T::Boolean,
                  non_recursive: T::Boolean,
                  propagation:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::OrSymbol,
                  read_only_force_recursive: T::Boolean,
                  read_only_non_recursive: T::Boolean
                ).returns(T.attached_class)
              end
              def self.new(
                # Create mount point on host if missing
                create_mountpoint: nil,
                # Disable recursive bind mount.
                non_recursive: nil,
                # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
                propagation: nil,
                # Raise an error if the mount cannot be made recursively read-only.
                read_only_force_recursive: nil,
                # Make the mount non-recursively read-only, but still leave the mount recursive
                # (unless NonRecursive is set to `true` in conjunction).
                #
                # Added in v1.44, before that version all read-only mounts were non-recursive by
                # default. To match the previous behaviour this will default to `true` for clients
                # on versions prior to v1.44.
                read_only_non_recursive: nil
              )
              end

              sig do
                override.returns(
                  {
                    create_mountpoint: T::Boolean,
                    non_recursive: T::Boolean,
                    propagation:
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::OrSymbol,
                    read_only_force_recursive: T::Boolean,
                    read_only_non_recursive: T::Boolean
                  }
                )
              end
              def to_hash
              end

              # A propagation mode with the value `[r]private`, `[r]shared`, or `[r]slave`.
              module Propagation
                extend DockerEngineAPI::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                PRIVATE =
                  T.let(
                    :private,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RPRIVATE =
                  T.let(
                    :rprivate,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                SHARED =
                  T.let(
                    :shared,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RSHARED =
                  T.let(
                    :rshared,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                SLAVE =
                  T.let(
                    :slave,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )
                RSLAVE =
                  T.let(
                    :rslave,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::BindOptions::Propagation::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class ImageOptions < DockerEngineAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::ImageOptions,
                    DockerEngineAPI::Internal::AnyHash
                  )
                end

              # Source path inside the image. Must be relative without any back traversals.
              sig { returns(T.nilable(String)) }
              attr_reader :subpath

              sig { params(subpath: String).void }
              attr_writer :subpath

              # Optional configuration for the `image` type.
              sig { params(subpath: String).returns(T.attached_class) }
              def self.new(
                # Source path inside the image. Must be relative without any back traversals.
                subpath: nil
              )
              end

              sig { override.returns({ subpath: String }) }
              def to_hash
              end
            end

            class TmpfsOptions < DockerEngineAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::TmpfsOptions,
                    DockerEngineAPI::Internal::AnyHash
                  )
                end

              # The permission mode for the tmpfs mount in an integer. The value must not be in
              # octal format (e.g. 755) but rather the decimal representation of the octal value
              # (e.g. 493).
              sig { returns(T.nilable(Integer)) }
              attr_reader :mode

              sig { params(mode: Integer).void }
              attr_writer :mode

              # The options to be passed to the tmpfs mount. An array of arrays. Flag options
              # should be provided as 1-length arrays. Other types should be provided as as
              # 2-length arrays, where the first item is the key and the second the value.
              sig { returns(T.nilable(T::Array[T::Array[String]])) }
              attr_reader :options

              sig { params(options: T::Array[T::Array[String]]).void }
              attr_writer :options

              # The size for the tmpfs mount in bytes.
              sig { returns(T.nilable(Integer)) }
              attr_reader :size_bytes

              sig { params(size_bytes: Integer).void }
              attr_writer :size_bytes

              # Optional configuration for the `tmpfs` type.
              sig do
                params(
                  mode: Integer,
                  options: T::Array[T::Array[String]],
                  size_bytes: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # The permission mode for the tmpfs mount in an integer. The value must not be in
                # octal format (e.g. 755) but rather the decimal representation of the octal value
                # (e.g. 493).
                mode: nil,
                # The options to be passed to the tmpfs mount. An array of arrays. Flag options
                # should be provided as 1-length arrays. Other types should be provided as as
                # 2-length arrays, where the first item is the key and the second the value.
                options: nil,
                # The size for the tmpfs mount in bytes.
                size_bytes: nil
              )
              end

              sig do
                override.returns(
                  {
                    mode: Integer,
                    options: T::Array[T::Array[String]],
                    size_bytes: Integer
                  }
                )
              end
              def to_hash
              end
            end

            # The mount type. Available types:
            #
            # - `bind` a mount of a file or directory from the host into the container.
            # - `cluster` a Swarm cluster volume.
            # - `image` an OCI image.
            # - `npipe` a named pipe from the host into the container.
            # - `tmpfs` a `tmpfs`.
            # - `volume` a docker volume with the given `Name`.
            module Type
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BIND =
                T.let(
                  :bind,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )
              CLUSTER =
                T.let(
                  :cluster,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )
              IMAGE =
                T.let(
                  :image,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )
              NPIPE =
                T.let(
                  :npipe,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )
              TMPFS =
                T.let(
                  :tmpfs,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )
              VOLUME =
                T.let(
                  :volume,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class VolumeOptions < DockerEngineAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions,
                    DockerEngineAPI::Internal::AnyHash
                  )
                end

              # Map of driver specific options
              sig do
                returns(
                  T.nilable(
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig
                  )
                )
              end
              attr_reader :driver_config

              sig do
                params(
                  driver_config:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig::OrHash
                ).void
              end
              attr_writer :driver_config

              # User-defined key/value metadata.
              sig { returns(T.nilable(T::Hash[Symbol, String])) }
              attr_reader :labels

              sig { params(labels: T::Hash[Symbol, String]).void }
              attr_writer :labels

              # Populate volume with data from the target.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :no_copy

              sig { params(no_copy: T::Boolean).void }
              attr_writer :no_copy

              # Source path inside the volume. Must be relative without any back traversals.
              sig { returns(T.nilable(String)) }
              attr_reader :subpath

              sig { params(subpath: String).void }
              attr_writer :subpath

              # Optional configuration for the `volume` type.
              sig do
                params(
                  driver_config:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig::OrHash,
                  labels: T::Hash[Symbol, String],
                  no_copy: T::Boolean,
                  subpath: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Map of driver specific options
                driver_config: nil,
                # User-defined key/value metadata.
                labels: nil,
                # Populate volume with data from the target.
                no_copy: nil,
                # Source path inside the volume. Must be relative without any back traversals.
                subpath: nil
              )
              end

              sig do
                override.returns(
                  {
                    driver_config:
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig,
                    labels: T::Hash[Symbol, String],
                    no_copy: T::Boolean,
                    subpath: String
                  }
                )
              end
              def to_hash
              end

              class DriverConfig < DockerEngineAPI::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Mount::VolumeOptions::DriverConfig,
                      DockerEngineAPI::Internal::AnyHash
                    )
                  end

                # Name of the driver to use to create the volume.
                sig { returns(T.nilable(String)) }
                attr_reader :name

                sig { params(name: String).void }
                attr_writer :name

                # key/value map of driver specific options.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :options

                sig { params(options: T::Hash[Symbol, String]).void }
                attr_writer :options

                # Map of driver specific options
                sig do
                  params(
                    name: String,
                    options: T::Hash[Symbol, String]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Name of the driver to use to create the volume.
                  name: nil,
                  # key/value map of driver specific options.
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

          class PortBinding < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::PortBinding,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Host IP address that the container's port is mapped to.
            sig { returns(T.nilable(String)) }
            attr_reader :host_ip

            sig { params(host_ip: String).void }
            attr_writer :host_ip

            # Host port number that the container's port is mapped to.
            sig { returns(T.nilable(String)) }
            attr_reader :host_port

            sig { params(host_port: String).void }
            attr_writer :host_port

            # PortBinding represents a binding between a host IP address and a host port.
            sig do
              params(host_ip: String, host_port: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # Host IP address that the container's port is mapped to.
              host_ip: nil,
              # Host port number that the container's port is mapped to.
              host_port: nil
            )
            end

            sig { override.returns({ host_ip: String, host_port: String }) }
            def to_hash
            end
          end

          class RestartPolicy < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # If `on-failure` is used, the number of times to retry before giving up.
            sig { returns(T.nilable(Integer)) }
            attr_reader :maximum_retry_count

            sig { params(maximum_retry_count: Integer).void }
            attr_writer :maximum_retry_count

            # - Empty string means not to restart
            # - `no` Do not automatically restart
            # - `always` Always restart
            # - `unless-stopped` Restart always except when the user has manually stopped the
            #   container
            # - `on-failure` Restart only when the container exit code is non-zero
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::OrSymbol
                )
              )
            end
            attr_reader :name

            sig do
              params(
                name:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::OrSymbol
              ).void
            end
            attr_writer :name

            # The behavior to apply when the container exits. The default is not to restart.
            #
            # An ever increasing delay (double the previous delay, starting at 100ms) is added
            # before each restart to prevent flooding the server.
            sig do
              params(
                maximum_retry_count: Integer,
                name:
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # If `on-failure` is used, the number of times to retry before giving up.
              maximum_retry_count: nil,
              # - Empty string means not to restart
              # - `no` Do not automatically restart
              # - `always` Always restart
              # - `unless-stopped` Restart always except when the user has manually stopped the
              #   container
              # - `on-failure` Restart only when the container exit code is non-zero
              name: nil
            )
            end

            sig do
              override.returns(
                {
                  maximum_retry_count: Integer,
                  name:
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::OrSymbol
                }
              )
            end
            def to_hash
            end

            # - Empty string means not to restart
            # - `no` Do not automatically restart
            # - `always` Always restart
            # - `unless-stopped` Restart always except when the user has manually stopped the
            #   container
            # - `on-failure` Restart only when the container exit code is non-zero
            module Name
              extend DockerEngineAPI::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              EMPTY =
                T.let(
                  :"",
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                )
              NO =
                T.let(
                  :no,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                )
              ALWAYS =
                T.let(
                  :always,
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                )
              UNLESS_STOPPED =
                T.let(
                  :"unless-stopped",
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                )
              ON_FAILURE =
                T.let(
                  :"on-failure",
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    DockerEngineAPI::ContainerCreateParams::Config::HostConfig::RestartPolicy::Name::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Ulimit < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::HostConfig::Ulimit,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Hard limit
            sig { returns(T.nilable(Integer)) }
            attr_reader :hard

            sig { params(hard: Integer).void }
            attr_writer :hard

            # Name of ulimit
            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            # Soft limit
            sig { returns(T.nilable(Integer)) }
            attr_reader :soft

            sig { params(soft: Integer).void }
            attr_writer :soft

            sig do
              params(hard: Integer, name: String, soft: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # Hard limit
              hard: nil,
              # Name of ulimit
              name: nil,
              # Soft limit
              soft: nil
            )
            end

            sig do
              override.returns({ hard: Integer, name: String, soft: Integer })
            end
            def to_hash
            end
          end
        end

        class NetworkingConfig < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          # A mapping of network name to endpoint configuration for that network. The
          # endpoint configuration can be left empty to connect to that network with no
          # particular endpoint configuration.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig
                ]
              )
            )
          end
          attr_reader :endpoints_config

          sig do
            params(
              endpoints_config:
                T::Hash[
                  Symbol,
                  DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::OrHash
                ]
            ).void
          end
          attr_writer :endpoints_config

          # NetworkingConfig represents the container's networking configuration for each of
          # its interfaces. It is used for the networking configs specified in the
          # `docker create` and `docker network connect` commands.
          sig do
            params(
              endpoints_config:
                T::Hash[
                  Symbol,
                  DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # A mapping of network name to endpoint configuration for that network. The
            # endpoint configuration can be left empty to connect to that network with no
            # particular endpoint configuration.
            endpoints_config: nil
          )
          end

          sig do
            override.returns(
              {
                endpoints_config:
                  T::Hash[
                    Symbol,
                    DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig
                  ]
              }
            )
          end
          def to_hash
          end

          class EndpointsConfig < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :aliases

            sig { params(aliases: T::Array[String]).void }
            attr_writer :aliases

            # List of all DNS names an endpoint has on a specific network. This list is based
            # on the container name, network aliases, container short ID, and hostname.
            #
            # These DNS names are non-fully qualified but can contain several dots. You can
            # get fully qualified DNS names by appending `.<network-name>`. For instance, if
            # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
            # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :dns_names

            sig { params(dns_names: T::Array[String]).void }
            attr_writer :dns_names

            # DriverOpts is a mapping of driver options and values. These options are passed
            # directly to the driver and are driver specific.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_accessor :driver_opts

            # Unique ID for the service endpoint in a Sandbox.
            sig { returns(T.nilable(String)) }
            attr_reader :endpoint_id

            sig { params(endpoint_id: String).void }
            attr_writer :endpoint_id

            # Gateway address for this network.
            sig { returns(T.nilable(String)) }
            attr_reader :gateway

            sig { params(gateway: String).void }
            attr_writer :gateway

            # Global IPv6 address.
            sig { returns(T.nilable(String)) }
            attr_reader :global_i_pv6_address

            sig { params(global_i_pv6_address: String).void }
            attr_writer :global_i_pv6_address

            # Mask length of the global IPv6 address.
            sig { returns(T.nilable(Integer)) }
            attr_reader :global_i_pv6_prefix_len

            sig { params(global_i_pv6_prefix_len: Integer).void }
            attr_writer :global_i_pv6_prefix_len

            # This property determines which endpoint will provide the default gateway for a
            # container. The endpoint with the highest priority will be used. If multiple
            # endpoints have the same priority, endpoints are lexicographically sorted based
            # on their network name, and the one that sorts first is picked.
            sig { returns(T.nilable(Integer)) }
            attr_reader :gw_priority

            sig { params(gw_priority: Integer).void }
            attr_writer :gw_priority

            # IPv4 address.
            sig { returns(T.nilable(String)) }
            attr_reader :ip_address

            sig { params(ip_address: String).void }
            attr_writer :ip_address

            # EndpointIPAMConfig represents an endpoint's IPAM configuration.
            sig do
              returns(
                T.nilable(
                  DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig
                )
              )
            end
            attr_reader :ipam_config

            sig do
              params(
                ipam_config:
                  T.nilable(
                    DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig::OrHash
                  )
              ).void
            end
            attr_writer :ipam_config

            # Mask length of the IPv4 address.
            sig { returns(T.nilable(Integer)) }
            attr_reader :ip_prefix_len

            sig { params(ip_prefix_len: Integer).void }
            attr_writer :ip_prefix_len

            # IPv6 gateway address.
            sig { returns(T.nilable(String)) }
            attr_reader :i_pv6_gateway

            sig { params(i_pv6_gateway: String).void }
            attr_writer :i_pv6_gateway

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :links

            sig { params(links: T::Array[String]).void }
            attr_writer :links

            # MAC address for the endpoint on this network. The network driver might ignore
            # this parameter.
            sig { returns(T.nilable(String)) }
            attr_reader :mac_address

            sig { params(mac_address: String).void }
            attr_writer :mac_address

            # Unique ID of the network.
            sig { returns(T.nilable(String)) }
            attr_reader :network_id

            sig { params(network_id: String).void }
            attr_writer :network_id

            # Configuration for a network endpoint.
            sig do
              params(
                aliases: T::Array[String],
                dns_names: T::Array[String],
                driver_opts: T.nilable(T::Hash[Symbol, String]),
                endpoint_id: String,
                gateway: String,
                global_i_pv6_address: String,
                global_i_pv6_prefix_len: Integer,
                gw_priority: Integer,
                ip_address: String,
                ipam_config:
                  T.nilable(
                    DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig::OrHash
                  ),
                ip_prefix_len: Integer,
                i_pv6_gateway: String,
                links: T::Array[String],
                mac_address: String,
                network_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              aliases: nil,
              # List of all DNS names an endpoint has on a specific network. This list is based
              # on the container name, network aliases, container short ID, and hostname.
              #
              # These DNS names are non-fully qualified but can contain several dots. You can
              # get fully qualified DNS names by appending `.<network-name>`. For instance, if
              # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
              # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
              dns_names: nil,
              # DriverOpts is a mapping of driver options and values. These options are passed
              # directly to the driver and are driver specific.
              driver_opts: nil,
              # Unique ID for the service endpoint in a Sandbox.
              endpoint_id: nil,
              # Gateway address for this network.
              gateway: nil,
              # Global IPv6 address.
              global_i_pv6_address: nil,
              # Mask length of the global IPv6 address.
              global_i_pv6_prefix_len: nil,
              # This property determines which endpoint will provide the default gateway for a
              # container. The endpoint with the highest priority will be used. If multiple
              # endpoints have the same priority, endpoints are lexicographically sorted based
              # on their network name, and the one that sorts first is picked.
              gw_priority: nil,
              # IPv4 address.
              ip_address: nil,
              # EndpointIPAMConfig represents an endpoint's IPAM configuration.
              ipam_config: nil,
              # Mask length of the IPv4 address.
              ip_prefix_len: nil,
              # IPv6 gateway address.
              i_pv6_gateway: nil,
              links: nil,
              # MAC address for the endpoint on this network. The network driver might ignore
              # this parameter.
              mac_address: nil,
              # Unique ID of the network.
              network_id: nil
            )
            end

            sig do
              override.returns(
                {
                  aliases: T::Array[String],
                  dns_names: T::Array[String],
                  driver_opts: T.nilable(T::Hash[Symbol, String]),
                  endpoint_id: String,
                  gateway: String,
                  global_i_pv6_address: String,
                  global_i_pv6_prefix_len: Integer,
                  gw_priority: Integer,
                  ip_address: String,
                  ipam_config:
                    T.nilable(
                      DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig
                    ),
                  ip_prefix_len: Integer,
                  i_pv6_gateway: String,
                  links: T::Array[String],
                  mac_address: String,
                  network_id: String
                }
              )
            end
            def to_hash
            end

            class IpamConfig < DockerEngineAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DockerEngineAPI::ContainerCreateParams::Config::NetworkingConfig::EndpointsConfig::IpamConfig,
                    DockerEngineAPI::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :i_pv4_address

              sig { params(i_pv4_address: String).void }
              attr_writer :i_pv4_address

              sig { returns(T.nilable(String)) }
              attr_reader :i_pv6_address

              sig { params(i_pv6_address: String).void }
              attr_writer :i_pv6_address

              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :link_local_ips

              sig { params(link_local_ips: T::Array[String]).void }
              attr_writer :link_local_ips

              # EndpointIPAMConfig represents an endpoint's IPAM configuration.
              sig do
                params(
                  i_pv4_address: String,
                  i_pv6_address: String,
                  link_local_ips: T::Array[String]
                ).returns(T.attached_class)
              end
              def self.new(
                i_pv4_address: nil,
                i_pv6_address: nil,
                link_local_ips: nil
              )
              end

              sig do
                override.returns(
                  {
                    i_pv4_address: String,
                    i_pv6_address: String,
                    link_local_ips: T::Array[String]
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
  end
end
