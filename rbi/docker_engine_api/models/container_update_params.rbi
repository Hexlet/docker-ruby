# typed: strong

module DockerEngineAPI
  module Models
    class ContainerUpdateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerUpdateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Limit read rate (bytes per second) from a device, in the form:
      #
      # ```
      # [{"Path": "device_path", "Rate": rate}]
      # ```
      sig do
        returns(
          T.nilable(
            T::Array[DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadBp]
          )
        )
      end
      attr_reader :blkio_device_read_bps

      sig do
        params(
          blkio_device_read_bps:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadBp::OrHash
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
            T::Array[DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadIOp]
          )
        )
      end
      attr_reader :blkio_device_read_i_ops

      sig do
        params(
          blkio_device_read_i_ops:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadIOp::OrHash
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
            T::Array[DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteBp]
          )
        )
      end
      attr_reader :blkio_device_write_bps

      sig do
        params(
          blkio_device_write_bps:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteBp::OrHash
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
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteIOp
            ]
          )
        )
      end
      attr_reader :blkio_device_write_i_ops

      sig do
        params(
          blkio_device_write_i_ops:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteIOp::OrHash
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
            T::Array[DockerEngineAPI::ContainerUpdateParams::BlkioWeightDevice]
          )
        )
      end
      attr_reader :blkio_weight_device

      sig do
        params(
          blkio_weight_device:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioWeightDevice::OrHash
            ]
        ).void
      end
      attr_writer :blkio_weight_device

      # Path to `cgroups` under which the container's `cgroup` is created. If the path
      # is not absolute, the path is considered to be relative to the `cgroups` path of
      # the init process. Cgroups are created if they do not already exist.
      sig { returns(T.nilable(String)) }
      attr_reader :cgroup_parent

      sig { params(cgroup_parent: String).void }
      attr_writer :cgroup_parent

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
            T::Array[DockerEngineAPI::ContainerUpdateParams::DeviceRequest]
          )
        )
      end
      attr_reader :device_requests

      sig do
        params(
          device_requests:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::DeviceRequest::OrHash
            ]
        ).void
      end
      attr_writer :device_requests

      # A list of devices to add to the container.
      sig do
        returns(
          T.nilable(T::Array[DockerEngineAPI::ContainerUpdateParams::Device])
        )
      end
      attr_reader :devices

      sig do
        params(
          devices:
            T::Array[DockerEngineAPI::ContainerUpdateParams::Device::OrHash]
        ).void
      end
      attr_writer :devices

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

      # CPU quota in units of 10<sup>-9</sup> CPUs.
      sig { returns(T.nilable(Integer)) }
      attr_reader :nano_cpus

      sig { params(nano_cpus: Integer).void }
      attr_writer :nano_cpus

      # Disable OOM Killer for the container.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :oom_kill_disable

      sig { params(oom_kill_disable: T::Boolean).void }
      attr_writer :oom_kill_disable

      # Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
      # change.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :pids_limit

      # The behavior to apply when the container exits. The default is not to restart.
      #
      # An ever increasing delay (double the previous delay, starting at 100ms) is added
      # before each restart to prevent flooding the server.
      sig do
        returns(
          T.nilable(DockerEngineAPI::ContainerUpdateParams::RestartPolicy)
        )
      end
      attr_reader :restart_policy

      sig do
        params(
          restart_policy:
            DockerEngineAPI::ContainerUpdateParams::RestartPolicy::OrHash
        ).void
      end
      attr_writer :restart_policy

      # A list of resource limits to set in the container. For example:
      #
      # ```
      # {"Name": "nofile", "Soft": 1024, "Hard": 2048}
      # ```
      sig do
        returns(
          T.nilable(T::Array[DockerEngineAPI::ContainerUpdateParams::Ulimit])
        )
      end
      attr_reader :ulimits

      sig do
        params(
          ulimits:
            T::Array[DockerEngineAPI::ContainerUpdateParams::Ulimit::OrHash]
        ).void
      end
      attr_writer :ulimits

      sig do
        params(
          blkio_device_read_bps:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadBp::OrHash
            ],
          blkio_device_read_i_ops:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadIOp::OrHash
            ],
          blkio_device_write_bps:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteBp::OrHash
            ],
          blkio_device_write_i_ops:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteIOp::OrHash
            ],
          blkio_weight: Integer,
          blkio_weight_device:
            T::Array[
              DockerEngineAPI::ContainerUpdateParams::BlkioWeightDevice::OrHash
            ],
          cgroup_parent: String,
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
              DockerEngineAPI::ContainerUpdateParams::DeviceRequest::OrHash
            ],
          devices:
            T::Array[DockerEngineAPI::ContainerUpdateParams::Device::OrHash],
          init: T.nilable(T::Boolean),
          io_maximum_bandwidth: Integer,
          io_maximum_i_ops: Integer,
          memory: Integer,
          memory_reservation: Integer,
          memory_swap: Integer,
          memory_swappiness: Integer,
          nano_cpus: Integer,
          oom_kill_disable: T::Boolean,
          pids_limit: T.nilable(Integer),
          restart_policy:
            DockerEngineAPI::ContainerUpdateParams::RestartPolicy::OrHash,
          ulimits:
            T::Array[DockerEngineAPI::ContainerUpdateParams::Ulimit::OrHash],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        # Path to `cgroups` under which the container's `cgroup` is created. If the path
        # is not absolute, the path is considered to be relative to the `cgroups` path of
        # the init process. Cgroups are created if they do not already exist.
        cgroup_parent: nil,
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
        # Run an init inside the container that forwards signals and reaps processes. This
        # field is omitted if empty, and the default (as configured on the daemon) is
        # used.
        init: nil,
        # Maximum IO in bytes per second for the container system drive (Windows only).
        io_maximum_bandwidth: nil,
        # Maximum IOps for the container system drive (Windows only)
        io_maximum_i_ops: nil,
        # Memory limit in bytes.
        memory: nil,
        # Memory soft limit in bytes.
        memory_reservation: nil,
        # Total memory limit (memory + swap). Set as `-1` to enable unlimited swap.
        memory_swap: nil,
        # Tune a container's memory swappiness behavior. Accepts an integer between 0
        # and 100.
        memory_swappiness: nil,
        # CPU quota in units of 10<sup>-9</sup> CPUs.
        nano_cpus: nil,
        # Disable OOM Killer for the container.
        oom_kill_disable: nil,
        # Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
        # change.
        pids_limit: nil,
        # The behavior to apply when the container exits. The default is not to restart.
        #
        # An ever increasing delay (double the previous delay, starting at 100ms) is added
        # before each restart to prevent flooding the server.
        restart_policy: nil,
        # A list of resource limits to set in the container. For example:
        #
        # ```
        # {"Name": "nofile", "Soft": 1024, "Hard": 2048}
        # ```
        ulimits: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            blkio_device_read_bps:
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadBp
              ],
            blkio_device_read_i_ops:
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadIOp
              ],
            blkio_device_write_bps:
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteBp
              ],
            blkio_device_write_i_ops:
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteIOp
              ],
            blkio_weight: Integer,
            blkio_weight_device:
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::BlkioWeightDevice
              ],
            cgroup_parent: String,
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
              T::Array[DockerEngineAPI::ContainerUpdateParams::DeviceRequest],
            devices: T::Array[DockerEngineAPI::ContainerUpdateParams::Device],
            init: T.nilable(T::Boolean),
            io_maximum_bandwidth: Integer,
            io_maximum_i_ops: Integer,
            memory: Integer,
            memory_reservation: Integer,
            memory_swap: Integer,
            memory_swappiness: Integer,
            nano_cpus: Integer,
            oom_kill_disable: T::Boolean,
            pids_limit: T.nilable(Integer),
            restart_policy:
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy,
            ulimits: T::Array[DockerEngineAPI::ContainerUpdateParams::Ulimit],
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class BlkioDeviceReadBp < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadBp,
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

        sig { params(path: String, rate: Integer).returns(T.attached_class) }
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
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceReadIOp,
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

        sig { params(path: String, rate: Integer).returns(T.attached_class) }
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
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteBp,
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

        sig { params(path: String, rate: Integer).returns(T.attached_class) }
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
              DockerEngineAPI::ContainerUpdateParams::BlkioDeviceWriteIOp,
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

        sig { params(path: String, rate: Integer).returns(T.attached_class) }
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
              DockerEngineAPI::ContainerUpdateParams::BlkioWeightDevice,
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

        sig { params(path: String, weight: Integer).returns(T.attached_class) }
        def self.new(path: nil, weight: nil)
        end

        sig { override.returns({ path: String, weight: Integer }) }
        def to_hash
        end
      end

      class DeviceRequest < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::ContainerUpdateParams::DeviceRequest,
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
              DockerEngineAPI::ContainerUpdateParams::Device,
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

      class RestartPolicy < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy,
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
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::OrSymbol
            )
          )
        end
        attr_reader :name

        sig do
          params(
            name:
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::OrSymbol
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
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::OrSymbol
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
                DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::OrSymbol
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
                DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EMPTY =
            T.let(
              :"",
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
            )
          NO =
            T.let(
              :no,
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
            )
          ALWAYS =
            T.let(
              :always,
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
            )
          UNLESS_STOPPED =
            T.let(
              :"unless-stopped",
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
            )
          ON_FAILURE =
            T.let(
              :"on-failure",
              DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineAPI::ContainerUpdateParams::RestartPolicy::Name::TaggedSymbol
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
              DockerEngineAPI::ContainerUpdateParams::Ulimit,
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

        sig { override.returns({ hard: Integer, name: String, soft: Integer }) }
        def to_hash
        end
      end
    end
  end
end
