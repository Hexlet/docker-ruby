# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Containers
      # Create a container
      #
      # @overload create(config:, name: nil, platform: nil, request_options: {})
      #
      # @param config [DockerEngineRuby::Models::Config] Body param: Configuration for a container that is portable between hosts.
      #
      # @param name [String] Query param
      #
      # @param platform [String] Query param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::CreateResponse]
      #
      # @see DockerEngineRuby::Models::ContainerCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::ContainerCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "containers/create",
          query: parsed.except(:config),
          body: parsed[:config],
          model: DockerEngineRuby::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ContainerUpdateParams} for more details.
      #
      # Update a container
      #
      # @overload update(id, blkio_device_read_bps: nil, blkio_device_read_i_ops: nil, blkio_device_write_bps: nil, blkio_device_write_i_ops: nil, blkio_weight: nil, blkio_weight_device: nil, cgroup_parent: nil, cpu_count: nil, cpu_percent: nil, cpu_period: nil, cpu_quota: nil, cpu_realtime_period: nil, cpu_realtime_runtime: nil, cpuset_cpus: nil, cpuset_mems: nil, cpu_shares: nil, device_cgroup_rules: nil, device_requests: nil, devices: nil, init: nil, io_maximum_bandwidth: nil, io_maximum_i_ops: nil, memory: nil, memory_reservation: nil, memory_swap: nil, memory_swappiness: nil, nano_cpus: nil, oom_kill_disable: nil, pids_limit: nil, ulimits: nil, request_options: {})
      #
      # @param id [String]
      #
      # @param blkio_device_read_bps [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadBp>] Limit read rate (bytes per second) from a device, in the form:
      #
      # @param blkio_device_read_i_ops [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceReadIOp>] Limit read rate (IO per second) from a device, in the form:
      #
      # @param blkio_device_write_bps [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteBp>] Limit write rate (bytes per second) to a device, in the form:
      #
      # @param blkio_device_write_i_ops [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioDeviceWriteIOp>] Limit write rate (IO per second) to a device, in the form:
      #
      # @param blkio_weight [Integer] Block IO weight (relative weight).
      #
      # @param blkio_weight_device [Array<DockerEngineRuby::Models::ContainerUpdateParams::BlkioWeightDevice>] Block IO weight (relative device weight) in the form:
      #
      # @param cgroup_parent [String] Path to `cgroups` under which the container's `cgroup` is created. If
      #
      # @param cpu_count [Integer] The number of usable CPUs (Windows only).
      #
      # @param cpu_percent [Integer] The usable percentage of the available CPUs (Windows only).
      #
      # @param cpu_period [Integer] The length of a CPU period in microseconds.
      #
      # @param cpu_quota [Integer] Microseconds of CPU time that the container can get in a CPU period.
      #
      # @param cpu_realtime_period [Integer] The length of a CPU real-time period in microseconds. Set to 0 to
      #
      # @param cpu_realtime_runtime [Integer] The length of a CPU real-time runtime in microseconds. Set to 0 to
      #
      # @param cpuset_cpus [String] CPUs in which to allow execution (e.g., `0-3`, `0,1`).
      #
      # @param cpuset_mems [String] Memory nodes (MEMs) in which to allow execution (0-3, 0,1). Only
      #
      # @param cpu_shares [Integer] An integer value representing this container's relative CPU weight
      #
      # @param device_cgroup_rules [Array<String>] a list of cgroup rules to apply to the container
      #
      # @param device_requests [Array<DockerEngineRuby::Models::ContainerUpdateParams::DeviceRequest>] A list of requests for devices to be sent to device drivers.
      #
      # @param devices [Array<DockerEngineRuby::Models::ContainerUpdateParams::Device>] A list of devices to add to the container.
      #
      # @param init [Boolean, nil] Run an init inside the container that forwards signals and reaps
      #
      # @param io_maximum_bandwidth [Integer] Maximum IO in bytes per second for the container system drive
      #
      # @param io_maximum_i_ops [Integer] Maximum IOps for the container system drive (Windows only)
      #
      # @param memory [Integer] Memory limit in bytes.
      #
      # @param memory_reservation [Integer] Memory soft limit in bytes.
      #
      # @param memory_swap [Integer] Total memory limit (memory + swap). Set as `-1` to enable unlimited
      #
      # @param memory_swappiness [Integer] Tune a container's memory swappiness behavior. Accepts an integer
      #
      # @param nano_cpus [Integer] CPU quota in units of 10<sup>-9</sup> CPUs.
      #
      # @param oom_kill_disable [Boolean] Disable OOM Killer for the container.
      #
      # @param pids_limit [Integer, nil] Tune a container's PIDs limit. Set `0` or `-1` for unlimited, or `null`
      #
      # @param ulimits [Array<DockerEngineRuby::Models::ContainerUpdateParams::Ulimit>] A list of resource limits to set in the container. For example:
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::UpdateResponse]
      #
      # @see DockerEngineRuby::Models::ContainerUpdateParams
      def update(id, params = {})
        parsed, options = DockerEngineRuby::ContainerUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/update", id],
          body: parsed,
          model: DockerEngineRuby::UpdateResponse,
          options: options
        )
      end

      # List containers
      #
      # @overload list(all: nil, filters: nil, limit: nil, size: nil, request_options: {})
      #
      # @param all [Boolean]
      # @param filters [String]
      # @param limit [Integer]
      # @param size [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Summary>]
      #
      # @see DockerEngineRuby::Models::ContainerListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::ContainerListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "containers/json",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary],
          options: options
        )
      end

      # Remove a container
      #
      # @overload delete(id, force: nil, link: nil, v: nil, request_options: {})
      #
      # @param id [String]
      # @param force [Boolean]
      # @param link [Boolean]
      # @param v [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerDeleteParams
      def delete(id, params = {})
        parsed, options = DockerEngineRuby::ContainerDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["containers/%1$s", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Get an archive of a filesystem resource in a container
      #
      # @overload archive(id, path:, request_options: {})
      #
      # @param id [String]
      # @param path [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerArchiveParams
      def archive(id, params)
        parsed, options = DockerEngineRuby::ContainerArchiveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/archive", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Attach to a container
      #
      # @overload attach(id, detach_keys: nil, logs: nil, stderr: nil, stdin: nil, stdout: nil, stream: nil, request_options: {})
      #
      # @param id [String]
      # @param detach_keys [String]
      # @param logs [Boolean]
      # @param stderr [Boolean]
      # @param stdin [Boolean]
      # @param stdout [Boolean]
      # @param stream [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerAttachParams
      def attach(id, params = {})
        parsed, options = DockerEngineRuby::ContainerAttachParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/attach", id],
          query: parsed.transform_keys(detach_keys: "detachKeys"),
          model: NilClass,
          options: options
        )
      end

      # Get changes on a container’s filesystem
      #
      # @overload changes(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::FilesystemChange>]
      #
      # @see DockerEngineRuby::Models::ContainerChangesParams
      def changes(id, params = {})
        @client.request(
          method: :get,
          path: ["containers/%1$s/changes", id],
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::FilesystemChange],
          options: params[:request_options]
        )
      end

      # Create an exec instance
      #
      # @overload exec_(id, attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, console_size: nil, detach_keys: nil, env: nil, privileged: nil, tty: nil, user: nil, working_dir: nil, request_options: {})
      #
      # @param id [String]
      # @param attach_stderr [Boolean]
      # @param attach_stdin [Boolean]
      # @param attach_stdout [Boolean]
      # @param cmd [Array<String>]
      # @param console_size [Array<Integer>, nil]
      # @param detach_keys [String]
      # @param env [Array<String>]
      # @param privileged [Boolean]
      # @param tty [Boolean]
      # @param user [String]
      # @param working_dir [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ContainerExecResponse]
      #
      # @see DockerEngineRuby::Models::ContainerExecParams
      def exec_(id, params = {})
        parsed, options = DockerEngineRuby::ContainerExecParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/exec", id],
          body: parsed,
          model: DockerEngineRuby::Models::ContainerExecResponse,
          options: options
        )
      end

      # Export a container
      #
      # @overload export(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerExportParams
      def export(id, params = {})
        @client.request(
          method: :get,
          path: ["containers/%1$s/export", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Inspect a container
      #
      # @overload inspect_(id, size: nil, request_options: {})
      #
      # @param id [String]
      # @param size [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Container]
      #
      # @see DockerEngineRuby::Models::ContainerInspectParams
      def inspect_(id, params = {})
        parsed, options = DockerEngineRuby::ContainerInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/json", id],
          query: parsed,
          model: DockerEngineRuby::Container,
          options: options
        )
      end

      # Kill a container
      #
      # @overload kill(id, signal: nil, request_options: {})
      #
      # @param id [String]
      # @param signal [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerKillParams
      def kill(id, params = {})
        parsed, options = DockerEngineRuby::ContainerKillParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/kill", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Get container logs
      #
      # @overload logs(id, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, until_: nil, request_options: {})
      #
      # @param id [String]
      # @param follow [Boolean]
      # @param since [Integer]
      # @param stderr [Boolean]
      # @param stdout [Boolean]
      # @param tail [String]
      # @param timestamps [Boolean]
      # @param until_ [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineRuby::Models::ContainerLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngineRuby::ContainerLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/logs", id],
          query: parsed.transform_keys(until_: "until"),
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
        )
      end

      # Pause a container
      #
      # @overload pause(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerPauseParams
      def pause(id, params = {})
        @client.request(
          method: :post,
          path: ["containers/%1$s/pause", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Delete stopped containers
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ContainerPruneResponse]
      #
      # @see DockerEngineRuby::Models::ContainerPruneParams
      def prune(params = {})
        parsed, options = DockerEngineRuby::ContainerPruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "containers/prune",
          query: parsed,
          model: DockerEngineRuby::Models::ContainerPruneResponse,
          options: options
        )
      end

      # Rename a container
      #
      # @overload rename(id, name:, request_options: {})
      #
      # @param id [String]
      # @param name [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerRenameParams
      def rename(id, params)
        parsed, options = DockerEngineRuby::ContainerRenameParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/rename", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Resize a container TTY
      #
      # @overload resize(id, h:, w:, request_options: {})
      #
      # @param id [String]
      # @param h [Integer]
      # @param w [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerResizeParams
      def resize(id, params)
        parsed, options = DockerEngineRuby::ContainerResizeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/resize", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Restart a container
      #
      # @overload restart(id, signal: nil, t: nil, request_options: {})
      #
      # @param id [String]
      # @param signal [String]
      # @param t [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerRestartParams
      def restart(id, params = {})
        parsed, options = DockerEngineRuby::ContainerRestartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/restart", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Start a container
      #
      # @overload start(id, detach_keys: nil, request_options: {})
      #
      # @param id [String]
      # @param detach_keys [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerStartParams
      def start(id, params = {})
        parsed, options = DockerEngineRuby::ContainerStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/start", id],
          query: parsed.transform_keys(detach_keys: "detachKeys"),
          model: NilClass,
          options: options
        )
      rescue DockerEngineRuby::Errors::APIStatusError => e
        raise e unless e.status == 304
        nil
      end

      # Get container stats based on resource usage
      #
      # @overload stats(id, one_shot: nil, stream: nil, request_options: {})
      #
      # @param id [String]
      # @param one_shot [Boolean]
      # @param stream [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::StatsResponse]
      #
      # @see DockerEngineRuby::Models::ContainerStatsParams
      def stats(id, params = {})
        parsed, options = DockerEngineRuby::ContainerStatsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/stats", id],
          query: parsed.transform_keys(one_shot: "one-shot"),
          model: DockerEngineRuby::StatsResponse,
          options: options
        )
      end

      # Stop a container
      #
      # @overload stop(id, signal: nil, t: nil, request_options: {})
      #
      # @param id [String]
      # @param signal [String]
      # @param t [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerStopParams
      def stop(id, params = {})
        parsed, options = DockerEngineRuby::ContainerStopParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/stop", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      rescue DockerEngineRuby::Errors::APIStatusError => e
        raise e unless e.status == 304
        nil
      end

      # List processes running inside a container
      #
      # @overload top(id, ps_args: nil, request_options: {})
      #
      # @param id [String]
      # @param ps_args [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::TopResponse]
      #
      # @see DockerEngineRuby::Models::ContainerTopParams
      def top(id, params = {})
        parsed, options = DockerEngineRuby::ContainerTopParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/top", id],
          query: parsed,
          model: DockerEngineRuby::TopResponse,
          options: options
        )
      end

      # Unpause a container
      #
      # @overload unpause(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ContainerUnpauseParams
      def unpause(id, params = {})
        @client.request(
          method: :post,
          path: ["containers/%1$s/unpause", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Wait for a container
      #
      # @overload wait(id, condition: nil, request_options: {})
      #
      # @param id [String]
      # @param condition [Symbol, DockerEngineRuby::Models::ContainerWaitParams::Condition]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::WaitResponse]
      #
      # @see DockerEngineRuby::Models::ContainerWaitParams
      def wait(id, params = {})
        parsed, options = DockerEngineRuby::ContainerWaitParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/wait", id],
          query: parsed,
          model: DockerEngineRuby::WaitResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
