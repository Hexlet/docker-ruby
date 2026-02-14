# frozen_string_literal: true

module DockerEngine
  module Resources
    class Containers
      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerCreateParams} for more details.
      #
      # Create a container
      #
      # @overload create(config:, name: nil, platform: nil, request_options: {})
      #
      # @param config [DockerEngine::Models::ContainerCreateParams::Config] Body param: Configuration for a container that is portable between hosts.
      #
      # @param name [String] Query param: Assign the specified name to the container. Must match
      #
      # @param platform [String] Query param: Platform in the format `os[/arch[/variant]]` used for image lookup.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::CreateResponse]
      #
      # @see DockerEngine::Models::ContainerCreateParams
      def create(params)
        parsed, options = DockerEngine::ContainerCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "containers/create",
          query: parsed.except(:config),
          body: parsed[:config],
          model: DockerEngine::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerUpdateParams} for more details.
      #
      # Change various configuration options of a container without having to recreate
      # it.
      #
      # @overload update(id, blkio_device_read_bps: nil, blkio_device_read_i_ops: nil, blkio_device_write_bps: nil, blkio_device_write_i_ops: nil, blkio_weight: nil, blkio_weight_device: nil, cgroup_parent: nil, cpu_count: nil, cpu_percent: nil, cpu_period: nil, cpu_quota: nil, cpu_realtime_period: nil, cpu_realtime_runtime: nil, cpuset_cpus: nil, cpuset_mems: nil, cpu_shares: nil, device_cgroup_rules: nil, device_requests: nil, devices: nil, init: nil, io_maximum_bandwidth: nil, io_maximum_i_ops: nil, memory: nil, memory_reservation: nil, memory_swap: nil, memory_swappiness: nil, nano_cpus: nil, oom_kill_disable: nil, pids_limit: nil, restart_policy: nil, ulimits: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param blkio_device_read_bps [Array<DockerEngine::Models::ContainerUpdateParams::BlkioDeviceReadBp>] Limit read rate (bytes per second) from a device, in the form:
      #
      # @param blkio_device_read_i_ops [Array<DockerEngine::Models::ContainerUpdateParams::BlkioDeviceReadIOp>] Limit read rate (IO per second) from a device, in the form:
      #
      # @param blkio_device_write_bps [Array<DockerEngine::Models::ContainerUpdateParams::BlkioDeviceWriteBp>] Limit write rate (bytes per second) to a device, in the form:
      #
      # @param blkio_device_write_i_ops [Array<DockerEngine::Models::ContainerUpdateParams::BlkioDeviceWriteIOp>] Limit write rate (IO per second) to a device, in the form:
      #
      # @param blkio_weight [Integer] Block IO weight (relative weight).
      #
      # @param blkio_weight_device [Array<DockerEngine::Models::ContainerUpdateParams::BlkioWeightDevice>] Block IO weight (relative device weight) in the form:
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
      # @param device_requests [Array<DockerEngine::Models::ContainerUpdateParams::DeviceRequest>] A list of requests for devices to be sent to device drivers.
      #
      # @param devices [Array<DockerEngine::Models::ContainerUpdateParams::Device>] A list of devices to add to the container.
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
      # @param restart_policy [DockerEngine::Models::ContainerUpdateParams::RestartPolicy] The behavior to apply when the container exits. The default is not to
      #
      # @param ulimits [Array<DockerEngine::Models::ContainerUpdateParams::Ulimit>] A list of resource limits to set in the container. For example:
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::UpdateResponse]
      #
      # @see DockerEngine::Models::ContainerUpdateParams
      def update(id, params = {})
        parsed, options = DockerEngine::ContainerUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/update", id],
          body: parsed,
          model: DockerEngine::UpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerListParams} for more details.
      #
      # Returns a list of containers. For details on the format, see the
      # [inspect endpoint](#operation/ContainerInspect).
      #
      # Note that it uses a different, smaller representation of a container than
      # inspecting a single container. For example, the list of linked containers is not
      # propagated .
      #
      # @overload list(all: nil, filters: nil, limit: nil, size: nil, request_options: {})
      #
      # @param all [Boolean] Return all containers. By default, only running containers are shown.
      #
      # @param filters [String] Filters to process on the container list, encoded as JSON (a
      #
      # @param limit [Integer] Return this number of most recently created containers, including
      #
      # @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::Summary>]
      #
      # @see DockerEngine::Models::ContainerListParams
      def list(params = {})
        parsed, options = DockerEngine::ContainerListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "containers/json",
          query: parsed,
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary],
          options: options
        )
      end

      # Remove a container
      #
      # @overload delete(id, force: nil, link: nil, v: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param force [Boolean] If the container is running, kill it before removing it.
      #
      # @param link [Boolean] Remove the specified link associated with the container.
      #
      # @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerDeleteParams
      def delete(id, params = {})
        parsed, options = DockerEngine::ContainerDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["containers/%1$s", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Get a tar archive of a resource in the filesystem of container id.
      #
      # @overload archive(id, path:, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param path [String] Resource in the container’s filesystem to archive.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerArchiveParams
      def archive(id, params)
        parsed, options = DockerEngine::ContainerArchiveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/archive", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerAttachParams} for more details.
      #
      # Attach to a container to read its output or send it input. You can attach to the
      # same container multiple times and you can reattach to containers that have been
      # detached.
      #
      # Either the `stream` or `logs` parameter must be `true` for this endpoint to do
      # anything.
      #
      # See the
      # [documentation for the `docker attach` command](https://docs.docker.com/engine/reference/commandline/attach/)
      # for more details.
      #
      # ### Hijacking
      #
      # This endpoint hijacks the HTTP connection to transport `stdin`, `stdout`, and
      # `stderr` on the same socket.
      #
      # This is the response from the daemon for an attach request:
      #
      # ```
      # HTTP/1.1 200 OK
      # Content-Type: application/vnd.docker.raw-stream
      #
      # [STREAM]
      # ```
      #
      # After the headers and two new lines, the TCP connection can now be used for raw,
      # bidirectional communication between the client and server.
      #
      # To hint potential proxies about connection hijacking, the Docker client can also
      # optionally send connection upgrade headers.
      #
      # For example, the client sends this request to upgrade the connection:
      #
      # ```
      # POST /containers/16253994b7c4/attach?stream=1&stdout=1 HTTP/1.1
      # Upgrade: tcp
      # Connection: Upgrade
      # ```
      #
      # The Docker daemon will respond with a `101 UPGRADED` response, and will
      # similarly follow with the raw stream:
      #
      # ```
      # HTTP/1.1 101 UPGRADED
      # Content-Type: application/vnd.docker.raw-stream
      # Connection: Upgrade
      # Upgrade: tcp
      #
      # [STREAM]
      # ```
      #
      # ### Stream format
      #
      # When the TTY setting is disabled in
      # [`POST /containers/create`](#operation/ContainerCreate), the HTTP Content-Type
      # header is set to application/vnd.docker.multiplexed-stream and the stream over
      # the hijacked connected is multiplexed to separate out `stdout` and `stderr`. The
      # stream consists of a series of frames, each containing a header and a payload.
      #
      # The header contains the information which the stream writes (`stdout` or
      # `stderr`). It also contains the size of the associated frame encoded in the last
      # four bytes (`uint32`).
      #
      # It is encoded on the first eight bytes like this:
      #
      # ```go
      # header := [8]byte{STREAM_TYPE, 0, 0, 0, SIZE1, SIZE2, SIZE3, SIZE4}
      # ```
      #
      # `STREAM_TYPE` can be:
      #
      # - 0: `stdin` (is written on `stdout`)
      # - 1: `stdout`
      # - 2: `stderr`
      #
      # `SIZE1, SIZE2, SIZE3, SIZE4` are the four bytes of the `uint32` size encoded as
      # big endian.
      #
      # Following the header is the payload, which is the specified number of bytes of
      # `STREAM_TYPE`.
      #
      # The simplest way to implement this protocol is the following:
      #
      # 1. Read 8 bytes.
      # 2. Choose `stdout` or `stderr` depending on the first byte.
      # 3. Extract the frame size from the last four bytes.
      # 4. Read the extracted size and output it on the correct output.
      # 5. Goto 1.
      #
      # ### Stream format when using a TTY
      #
      # When the TTY setting is enabled in
      # [`POST /containers/create`](#operation/ContainerCreate), the stream is not
      # multiplexed. The data exchanged over the hijacked connection is simply the raw
      # data from the process PTY and client's `stdin`.
      #
      # @overload attach(id, detach_keys: nil, logs: nil, stderr: nil, stdin: nil, stdout: nil, stream: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param detach_keys [String] Override the key sequence for detaching a container.Format is a single
      #
      # @param logs [Boolean] Replay previous logs from the container.
      #
      # @param stderr [Boolean] Attach to `stderr`
      #
      # @param stdin [Boolean] Attach to `stdin`
      #
      # @param stdout [Boolean] Attach to `stdout`
      #
      # @param stream [Boolean] Stream attached streams from the time the request was made onwards.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerAttachParams
      def attach(id, params = {})
        parsed, options = DockerEngine::ContainerAttachParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/attach", id],
          query: parsed.transform_keys(detach_keys: "detachKeys"),
          model: NilClass,
          options: options
        )
      end

      # Returns which files in a container's filesystem have been added, deleted, or
      # modified. The `Kind` of modification can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      #
      # @overload changes(id, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::FilesystemChange>]
      #
      # @see DockerEngine::Models::ContainerChangesParams
      def changes(id, params = {})
        @client.request(
          method: :get,
          path: ["containers/%1$s/changes", id],
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::FilesystemChange],
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerExecParams} for more details.
      #
      # Run a command inside a running container.
      #
      # @overload exec_(id, attach_stderr: nil, attach_stdin: nil, attach_stdout: nil, cmd: nil, console_size: nil, detach_keys: nil, env: nil, privileged: nil, tty: nil, user: nil, working_dir: nil, request_options: {})
      #
      # @param id [String] ID or name of container
      #
      # @param attach_stderr [Boolean] Attach to `stderr` of the exec command.
      #
      # @param attach_stdin [Boolean] Attach to `stdin` of the exec command.
      #
      # @param attach_stdout [Boolean] Attach to `stdout` of the exec command.
      #
      # @param cmd [Array<String>] Command to run, as a string or array of strings.
      #
      # @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
      #
      # @param detach_keys [String] Override the key sequence for detaching a container. Format is
      #
      # @param env [Array<String>] A list of environment variables in the form `["VAR=value", ...]`.
      #
      # @param privileged [Boolean] Runs the exec process with extended privileges.
      #
      # @param tty [Boolean] Allocate a pseudo-TTY.
      #
      # @param user [String] The user, and optionally, group to run the exec process inside
      #
      # @param working_dir [String] The working directory for the exec process inside the container.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::ContainerExecResponse]
      #
      # @see DockerEngine::Models::ContainerExecParams
      def exec_(id, params = {})
        parsed, options = DockerEngine::ContainerExecParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/exec", id],
          body: parsed,
          model: DockerEngine::Models::ContainerExecResponse,
          options: options
        )
      end

      # Export the contents of a container as a tarball.
      #
      # @overload export(id, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerExportParams
      def export(id, params = {})
        @client.request(
          method: :get,
          path: ["containers/%1$s/export", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Return low-level information about a container.
      #
      # @overload inspect_(id, size: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::Container]
      #
      # @see DockerEngine::Models::ContainerInspectParams
      def inspect_(id, params = {})
        parsed, options = DockerEngine::ContainerInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/json", id],
          query: parsed,
          model: DockerEngine::Container,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerKillParams} for more details.
      #
      # Send a POSIX signal to a container, defaulting to killing to the container.
      #
      # @overload kill(id, signal: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerKillParams
      def kill(id, params = {})
        parsed, options = DockerEngine::ContainerKillParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/kill", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerLogsParams} for more details.
      #
      # Get `stdout` and `stderr` logs from a container.
      #
      # Note: This endpoint works only for containers with the `json-file` or `journald`
      # logging driver.
      #
      # @overload logs(id, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, until_: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param follow [Boolean] Keep connection after returning logs.
      #
      # @param since [Integer] Only return logs since this time, as a UNIX timestamp
      #
      # @param stderr [Boolean] Return logs from `stderr`
      #
      # @param stdout [Boolean] Return logs from `stdout`
      #
      # @param tail [String] Only return this number of log lines from the end of the logs.
      #
      # @param timestamps [Boolean] Add timestamps to every log line
      #
      # @param until_ [Integer] Only return logs before this time, as a UNIX timestamp
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngine::Models::ContainerLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngine::ContainerLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/logs", id],
          query: parsed.transform_keys(until_: "until"),
          headers: {"accept" => "application/vnd.docker.multiplexed-stream"},
          model: StringIO,
          options: options
        )
      end

      # Use the freezer cgroup to suspend all processes in a container.
      #
      # Traditionally, when suspending a process the `SIGSTOP` signal is used, which is
      # observable by the process being suspended. With the freezer cgroup the process
      # is unaware, and unable to capture, that it is being suspended, and subsequently
      # resumed.
      #
      # @overload pause(id, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerPauseParams
      def pause(id, params = {})
        @client.request(
          method: :post,
          path: ["containers/%1$s/pause", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerPruneParams} for more details.
      #
      # Delete stopped containers
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::ContainerPruneResponse]
      #
      # @see DockerEngine::Models::ContainerPruneParams
      def prune(params = {})
        parsed, options = DockerEngine::ContainerPruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "containers/prune",
          query: parsed,
          model: DockerEngine::Models::ContainerPruneResponse,
          options: options
        )
      end

      # Rename a container
      #
      # @overload rename(id, name:, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param name [String] New name for the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerRenameParams
      def rename(id, params)
        parsed, options = DockerEngine::ContainerRenameParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/rename", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Resize the TTY for a container.
      #
      # @overload resize(id, h:, w:, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param h [Integer] Height of the TTY session in characters
      #
      # @param w [Integer] Width of the TTY session in characters
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerResizeParams
      def resize(id, params)
        parsed, options = DockerEngine::ContainerResizeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/resize", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerRestartParams} for more details.
      #
      # Restart a container
      #
      # @overload restart(id, signal: nil, t: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      # @param t [Integer] Number of seconds to wait before killing the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerRestartParams
      def restart(id, params = {})
        parsed, options = DockerEngine::ContainerRestartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/restart", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerStartParams} for more details.
      #
      # Start a container
      #
      # @overload start(id, detach_keys: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param detach_keys [String] Override the key sequence for detaching a container. Format is a
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerStartParams
      def start(id, params = {})
        parsed, options = DockerEngine::ContainerStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/start", id],
          query: parsed.transform_keys(detach_keys: "detachKeys"),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerStatsParams} for more details.
      #
      # This endpoint returns a live stream of a container’s resource usage statistics.
      #
      # The `precpu_stats` is the CPU statistic of the _previous_ read, and is used to
      # calculate the CPU usage percentage. It is not an exact copy of the `cpu_stats`
      # field.
      #
      # If either `precpu_stats.online_cpus` or `cpu_stats.online_cpus` is nil then for
      # compatibility with older daemons the length of the corresponding
      # `cpu_usage.percpu_usage` array should be used.
      #
      # On a cgroup v2 host, the following fields are not set
      #
      # - `blkio_stats`: all fields other than `io_service_bytes_recursive`
      # - `cpu_stats`: `cpu_usage.percpu_usage`
      # - `memory_stats`: `max_usage` and `failcnt` Also, `memory_stats.stats` fields
      #   are incompatible with cgroup v1.
      #
      # To calculate the values shown by the `stats` command of the docker cli tool the
      # following formulas can be used:
      #
      # - used_memory = `memory_stats.usage - memory_stats.stats.cache` (cgroups v1)
      # - used_memory = `memory_stats.usage - memory_stats.stats.inactive_file` (cgroups
      #   v2)
      # - available_memory = `memory_stats.limit`
      # - Memory usage % = `(used_memory / available_memory) * 100.0`
      # - cpu_delta =
      #   `cpu_stats.cpu_usage.total_usage - precpu_stats.cpu_usage.total_usage`
      # - system_cpu_delta =
      #   `cpu_stats.system_cpu_usage - precpu_stats.system_cpu_usage`
      # - number_cpus = `length(cpu_stats.cpu_usage.percpu_usage)` or
      #   `cpu_stats.online_cpus`
      # - CPU usage % = `(cpu_delta / system_cpu_delta) * number_cpus * 100.0`
      #
      # @overload stats(id, one_shot: nil, stream: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param one_shot [Boolean] Only get a single stat instead of waiting for 2 cycles. Must be used
      #
      # @param stream [Boolean] Stream the output. If false, the stats will be output once and then
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::StatsResponse]
      #
      # @see DockerEngine::Models::ContainerStatsParams
      def stats(id, params = {})
        parsed, options = DockerEngine::ContainerStatsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/stats", id],
          query: parsed.transform_keys(one_shot: "one-shot"),
          model: DockerEngine::StatsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerStopParams} for more details.
      #
      # Stop a container
      #
      # @overload stop(id, signal: nil, t: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param signal [String] Signal to send to the container as an integer or string (e.g. `SIGINT`).
      #
      # @param t [Integer] Number of seconds to wait before killing the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerStopParams
      def stop(id, params = {})
        parsed, options = DockerEngine::ContainerStopParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/stop", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # On Unix systems, this is done by running the `ps` command. This endpoint is not
      # supported on Windows.
      #
      # @overload top(id, ps_args: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param ps_args [String] The arguments to pass to `ps`. For example, `aux`
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::TopResponse]
      #
      # @see DockerEngine::Models::ContainerTopParams
      def top(id, params = {})
        parsed, options = DockerEngine::ContainerTopParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["containers/%1$s/top", id],
          query: parsed,
          model: DockerEngine::TopResponse,
          options: options
        )
      end

      # Resume a container which has been paused.
      #
      # @overload unpause(id, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ContainerUnpauseParams
      def unpause(id, params = {})
        @client.request(
          method: :post,
          path: ["containers/%1$s/unpause", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ContainerWaitParams} for more details.
      #
      # Block until a container stops, then returns the exit code.
      #
      # @overload wait(id, condition: nil, request_options: {})
      #
      # @param id [String] ID or name of the container
      #
      # @param condition [Symbol, DockerEngine::Models::ContainerWaitParams::Condition] Wait until a container state reaches the given condition.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::WaitResponse]
      #
      # @see DockerEngine::Models::ContainerWaitParams
      def wait(id, params = {})
        parsed, options = DockerEngine::ContainerWaitParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["containers/%1$s/wait", id],
          query: parsed,
          model: DockerEngine::WaitResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DockerEngine::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
