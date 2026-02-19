# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#update
    class ContainerUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute blkio_device_read_bps
      #   Limit read rate (bytes per second) from a device, in the form:
      #
      #   ```
      #   [{"Path": "device_path", "Rate": rate}]
      #   ```
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadBp>, nil]
      optional :blkio_device_read_bps,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::BlkioDeviceReadBp]
               },
               api_name: :BlkioDeviceReadBps

      # @!attribute blkio_device_read_i_ops
      #   Limit read rate (IO per second) from a device, in the form:
      #
      #   ```
      #   [{"Path": "device_path", "Rate": rate}]
      #   ```
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadIOp>, nil]
      optional :blkio_device_read_i_ops,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::BlkioDeviceReadIOp]
               },
               api_name: :BlkioDeviceReadIOps

      # @!attribute blkio_device_write_bps
      #   Limit write rate (bytes per second) to a device, in the form:
      #
      #   ```
      #   [{"Path": "device_path", "Rate": rate}]
      #   ```
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteBp>, nil]
      optional :blkio_device_write_bps,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::BlkioDeviceWriteBp]
               },
               api_name: :BlkioDeviceWriteBps

      # @!attribute blkio_device_write_i_ops
      #   Limit write rate (IO per second) to a device, in the form:
      #
      #   ```
      #   [{"Path": "device_path", "Rate": rate}]
      #   ```
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteIOp>, nil]
      optional :blkio_device_write_i_ops,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::BlkioDeviceWriteIOp]
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
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioWeightDevice>, nil]
      optional :blkio_weight_device,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::BlkioWeightDevice]
               },
               api_name: :BlkioWeightDevice

      # @!attribute cgroup_parent
      #   Path to `cgroups` under which the container's `cgroup` is created. If the path
      #   is not absolute, the path is considered to be relative to the `cgroups` path of
      #   the init process. Cgroups are created if they do not already exist.
      #
      #   @return [String, nil]
      optional :cgroup_parent, String, api_name: :CgroupParent

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
      optional :device_cgroup_rules,
               DockerEngineRuby::Internal::Type::ArrayOf[String],
               api_name: :DeviceCgroupRules

      # @!attribute device_requests
      #   A list of requests for devices to be sent to device drivers.
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::DeviceRequest>, nil]
      optional :device_requests,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::DeviceRequest]
               },
               api_name: :DeviceRequests

      # @!attribute devices
      #   A list of devices to add to the container.
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::Device>, nil]
      optional :devices,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::Device]
               },
               api_name: :Devices

      # @!attribute init
      #   Run an init inside the container that forwards signals and reaps processes. This
      #   field is omitted if empty, and the default (as configured on the daemon) is
      #   used.
      #
      #   @return [Boolean, nil]
      optional :init, DockerEngineRuby::Internal::Type::Boolean, api_name: :Init, nil?: true

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

      # @!attribute nano_cpus
      #   CPU quota in units of 10<sup>-9</sup> CPUs.
      #
      #   @return [Integer, nil]
      optional :nano_cpus, Integer, api_name: :NanoCpus

      # @!attribute oom_kill_disable
      #   Disable OOM Killer for the container.
      #
      #   @return [Boolean, nil]
      optional :oom_kill_disable, DockerEngineRuby::Internal::Type::Boolean, api_name: :OomKillDisable

      # @!attribute pids_limit
      #   Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null` to not
      #   change.
      #
      #   @return [Integer, nil]
      optional :pids_limit, Integer, api_name: :PidsLimit, nil?: true

      # @!attribute ulimits
      #   A list of resource limits to set in the container. For example:
      #
      #   ```
      #   {"Name": "nofile", "Soft": 1024, "Hard": 2048}
      #   ```
      #
      #   @return [Array<DockerEngineRuby::Models::ContainerUpdateParams::Ulimit>, nil]
      optional :ulimits,
               -> {
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::ContainerUpdateParams::Ulimit]
               },
               api_name: :Ulimits

      # @!method initialize(blkio_device_read_bps: nil, blkio_device_read_i_ops: nil, blkio_device_write_bps: nil, blkio_device_write_i_ops: nil, blkio_weight: nil, blkio_weight_device: nil, cgroup_parent: nil, cpu_count: nil, cpu_percent: nil, cpu_period: nil, cpu_quota: nil, cpu_realtime_period: nil, cpu_realtime_runtime: nil, cpuset_cpus: nil, cpuset_mems: nil, cpu_shares: nil, device_cgroup_rules: nil, device_requests: nil, devices: nil, init: nil, io_maximum_bandwidth: nil, io_maximum_i_ops: nil, memory: nil, memory_reservation: nil, memory_swap: nil, memory_swappiness: nil, nano_cpus: nil, oom_kill_disable: nil, pids_limit: nil, ulimits: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ContainerUpdateParams} for more details.
      #
      #   @param blkio_device_read_bps [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadBp>] Limit read rate (bytes per second) from a device, in the form:
      #
      #   @param blkio_device_read_i_ops [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadIOp>] Limit read rate (IO per second) from a device, in the form:
      #
      #   @param blkio_device_write_bps [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteBp>] Limit write rate (bytes per second) to a device, in the form:
      #
      #   @param blkio_device_write_i_ops [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteIOp>] Limit write rate (IO per second) to a device, in the form:
      #
      #   @param blkio_weight [Integer] Block IO weight (relative weight).
      #
      #   @param blkio_weight_device [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioWeightDevice>] Block IO weight (relative device weight) in the form:
      #
      #   @param cgroup_parent [String] Path to `cgroups` under which the container's `cgroup` is created. If
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
      #   @param device_requests [Array<DockerEngineRuby::Models::ContainerUpdateParams::DeviceRequest>] A list of requests for devices to be sent to device drivers.
      #
      #   @param devices [Array<DockerEngineRuby::Models::ContainerUpdateParams::Device>] A list of devices to add to the container.
      #
      #   @param init [Boolean, nil] Run an init inside the container that forwards signals and reaps
      #
      #   @param io_maximum_bandwidth [Integer] Maximum IO in bytes per second for the container system drive
      #
      #   @param io_maximum_i_ops [Integer] Maximum IOps for the container system drive (Windows only)
      #
      #   @param memory [Integer] Memory limit in bytes.
      #
      #   @param memory_reservation [Integer] Memory soft limit in bytes.
      #
      #   @param memory_swap [Integer] Total memory limit (memory + swap). Set as `-1` to enable unlimited
      #
      #   @param memory_swappiness [Integer] Tune a container's memory swappiness behavior. Accepts an integer
      #
      #   @param nano_cpus [Integer] CPU quota in units of 10<sup>-9</sup> CPUs.
      #
      #   @param oom_kill_disable [Boolean] Disable OOM Killer for the container.
      #
      #   @param pids_limit [Integer, nil] Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null`
      #
      #   @param ulimits [Array<DockerEngineRuby::Models::ContainerUpdateParams::Ulimit>] A list of resource limits to set in the container. For example:
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      class BlkioDeviceReadBp < DockerEngineRuby::Internal::Type::BaseModel
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

      class BlkioDeviceReadIOp < DockerEngineRuby::Internal::Type::BaseModel
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

      class BlkioDeviceWriteBp < DockerEngineRuby::Internal::Type::BaseModel
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

      class BlkioDeviceWriteIOp < DockerEngineRuby::Internal::Type::BaseModel
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

      class BlkioWeightDevice < DockerEngineRuby::Internal::Type::BaseModel
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

      class DeviceRequest < DockerEngineRuby::Internal::Type::BaseModel
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
                 DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Internal::Type::ArrayOf[String]],
                 api_name: :Capabilities

        # @!attribute count
        #
        #   @return [Integer, nil]
        optional :count, Integer, api_name: :Count

        # @!attribute device_ids
        #
        #   @return [Array<String>, nil]
        optional :device_ids, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :DeviceIDs

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
        #   @return [Object, nil]
        optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

        # @!method initialize(capabilities: nil, count: nil, device_ids: nil, driver: nil, options: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::ContainerUpdateParams::DeviceRequest} for more
        #   details.
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
        #   @param options [Object] Driver-specific options, specified as a key/value pairs. These options
      end

      class Device < DockerEngineRuby::Internal::Type::BaseModel
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
  end
end
