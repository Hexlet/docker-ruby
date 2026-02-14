# typed: strong

module DockerEngineRuby
  module Resources
    class Containers
      # Create a container
      sig do
        params(
          config: DockerEngineRuby::Config::OrHash,
          name: String,
          platform: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::CreateResponse)
      end
      def create(
        # Body param: Configuration for a container that is portable between hosts.
        config:,
        # Query param
        name: nil,
        # Query param
        platform: nil,
        request_options: {}
      )
      end

      # Update a container
      sig do
        params(
          id: String,
          blkio_device_read_bps:
            T::Array[
              DockerEngineRuby::ContainerUpdateParams::BlkioDeviceReadBp::OrHash
            ],
          blkio_device_read_i_ops:
            T::Array[
              DockerEngineRuby::ContainerUpdateParams::BlkioDeviceReadIOp::OrHash
            ],
          blkio_device_write_bps:
            T::Array[
              DockerEngineRuby::ContainerUpdateParams::BlkioDeviceWriteBp::OrHash
            ],
          blkio_device_write_i_ops:
            T::Array[
              DockerEngineRuby::ContainerUpdateParams::BlkioDeviceWriteIOp::OrHash
            ],
          blkio_weight: Integer,
          blkio_weight_device:
            T::Array[
              DockerEngineRuby::ContainerUpdateParams::BlkioWeightDevice::OrHash
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
              DockerEngineRuby::ContainerUpdateParams::DeviceRequest::OrHash
            ],
          devices:
            T::Array[DockerEngineRuby::ContainerUpdateParams::Device::OrHash],
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
          ulimits:
            T::Array[DockerEngineRuby::ContainerUpdateParams::Ulimit::OrHash],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::UpdateResponse)
      end
      def update(
        id,
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
        # A list of resource limits to set in the container. For example:
        #
        # ```
        # {"Name": "nofile", "Soft": 1024, "Hard": 2048}
        # ```
        ulimits: nil,
        request_options: {}
      )
      end

      # List containers
      sig do
        params(
          all: T::Boolean,
          filters: String,
          limit: Integer,
          size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Summary])
      end
      def list(
        all: nil,
        filters: nil,
        limit: nil,
        size: nil,
        request_options: {}
      )
      end

      # Remove a container
      sig do
        params(
          id: String,
          force: T::Boolean,
          link: T::Boolean,
          v: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, force: nil, link: nil, v: nil, request_options: {})
      end

      # Get an archive of a filesystem resource in a container
      sig do
        params(
          id: String,
          path: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def archive(id, path:, request_options: {})
      end

      # Attach to a container
      sig do
        params(
          id: String,
          detach_keys: String,
          logs: T::Boolean,
          stderr: T::Boolean,
          stdin: T::Boolean,
          stdout: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def attach(
        id,
        detach_keys: nil,
        logs: nil,
        stderr: nil,
        stdin: nil,
        stdout: nil,
        stream: nil,
        request_options: {}
      )
      end

      # Get changes on a container’s filesystem
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::FilesystemChange])
      end
      def changes(id, request_options: {})
      end

      # Create an exec instance
      sig do
        params(
          id: String,
          attach_stderr: T::Boolean,
          attach_stdin: T::Boolean,
          attach_stdout: T::Boolean,
          cmd: T::Array[String],
          console_size: T.nilable(T::Array[Integer]),
          detach_keys: String,
          env: T::Array[String],
          privileged: T::Boolean,
          tty: T::Boolean,
          user: String,
          working_dir: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ContainerExecResponse)
      end
      def exec_(
        id,
        attach_stderr: nil,
        attach_stdin: nil,
        attach_stdout: nil,
        cmd: nil,
        console_size: nil,
        detach_keys: nil,
        env: nil,
        privileged: nil,
        tty: nil,
        user: nil,
        working_dir: nil,
        request_options: {}
      )
      end

      # Export a container
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def export(id, request_options: {})
      end

      # Inspect a container
      sig do
        params(
          id: String,
          size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Container)
      end
      def inspect_(id, size: nil, request_options: {})
      end

      # Kill a container
      sig do
        params(
          id: String,
          signal: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def kill(id, signal: nil, request_options: {})
      end

      # Get container logs
      sig do
        params(
          id: String,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          until_: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def logs(
        id,
        follow: nil,
        since: nil,
        stderr: nil,
        stdout: nil,
        tail: nil,
        timestamps: nil,
        until_: nil,
        request_options: {}
      )
      end

      # Pause a container
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def pause(id, request_options: {})
      end

      # Delete stopped containers
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ContainerPruneResponse)
      end
      def prune(filters: nil, request_options: {})
      end

      # Rename a container
      sig do
        params(
          id: String,
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def rename(id, name:, request_options: {})
      end

      # Resize a container TTY
      sig do
        params(
          id: String,
          h: Integer,
          w: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def resize(id, h:, w:, request_options: {})
      end

      # Restart a container
      sig do
        params(
          id: String,
          signal: String,
          t: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def restart(id, signal: nil, t: nil, request_options: {})
      end

      # Start a container
      sig do
        params(
          id: String,
          detach_keys: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def start(id, detach_keys: nil, request_options: {})
      end

      # Get container stats based on resource usage
      sig do
        params(
          id: String,
          one_shot: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::StatsResponse)
      end
      def stats(id, one_shot: nil, stream: nil, request_options: {})
      end

      # Stop a container
      sig do
        params(
          id: String,
          signal: String,
          t: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def stop(id, signal: nil, t: nil, request_options: {})
      end

      # List processes running inside a container
      sig do
        params(
          id: String,
          ps_args: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::TopResponse)
      end
      def top(id, ps_args: nil, request_options: {})
      end

      # Unpause a container
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def unpause(id, request_options: {})
      end

      # Wait for a container
      sig do
        params(
          id: String,
          condition: DockerEngineRuby::ContainerWaitParams::Condition::OrSymbol,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::WaitResponse)
      end
      def wait(id, condition: nil, request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
