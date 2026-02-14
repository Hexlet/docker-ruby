# typed: strong

module DockerEngine
  module Resources
    class Containers
      # Create a container
      sig do
        params(
          config: DockerEngine::ContainerCreateParams::Config::OrHash,
          name: String,
          platform: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::CreateResponse)
      end
      def create(
        # Body param: Configuration for a container that is portable between hosts.
        config:,
        # Query param: Assign the specified name to the container. Must match
        # `/?[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
        name: nil,
        # Query param: Platform in the format `os[/arch[/variant]]` used for image lookup.
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

      # Change various configuration options of a container without having to recreate
      # it.
      sig do
        params(
          id: String,
          blkio_device_read_bps:
            T::Array[
              DockerEngine::ContainerUpdateParams::BlkioDeviceReadBp::OrHash
            ],
          blkio_device_read_i_ops:
            T::Array[
              DockerEngine::ContainerUpdateParams::BlkioDeviceReadIOp::OrHash
            ],
          blkio_device_write_bps:
            T::Array[
              DockerEngine::ContainerUpdateParams::BlkioDeviceWriteBp::OrHash
            ],
          blkio_device_write_i_ops:
            T::Array[
              DockerEngine::ContainerUpdateParams::BlkioDeviceWriteIOp::OrHash
            ],
          blkio_weight: Integer,
          blkio_weight_device:
            T::Array[
              DockerEngine::ContainerUpdateParams::BlkioWeightDevice::OrHash
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
              DockerEngine::ContainerUpdateParams::DeviceRequest::OrHash
            ],
          devices:
            T::Array[DockerEngine::ContainerUpdateParams::Device::OrHash],
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
            DockerEngine::ContainerUpdateParams::RestartPolicy::OrHash,
          ulimits:
            T::Array[DockerEngine::ContainerUpdateParams::Ulimit::OrHash],
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::UpdateResponse)
      end
      def update(
        # ID or name of the container
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

      # Returns a list of containers. For details on the format, see the
      # [inspect endpoint](#operation/ContainerInspect).
      #
      # Note that it uses a different, smaller representation of a container than
      # inspecting a single container. For example, the list of linked containers is not
      # propagated .
      sig do
        params(
          all: T::Boolean,
          filters: String,
          limit: Integer,
          size: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::Summary])
      end
      def list(
        # Return all containers. By default, only running containers are shown.
        all: nil,
        # Filters to process on the container list, encoded as JSON (a
        # `map[string][]string`). For example, `{"status": ["paused"]}` will only return
        # paused containers.
        #
        # Available filters:
        #
        # - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
        # - `before`=(`<container id>` or `<container name>`)
        # - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
        # - `exited=<int>` containers with exit code of `<int>`
        # - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
        # - `id=<ID>` a container's ID
        # - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
        # - `is-task=`(`true`|`false`)
        # - `label=key` or `label="key=value"` of a container label
        # - `name=<name>` a container's name
        # - `network`=(`<network id>` or `<network name>`)
        # - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
        # - `since`=(`<container id>` or `<container name>`)
        # - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
        # - `volume`=(`<volume name>` or `<mount point destination>`)
        filters: nil,
        # Return this number of most recently created containers, including non-running
        # ones.
        limit: nil,
        # Return the size of container as fields `SizeRw` and `SizeRootFs`.
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
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def delete(
        # ID or name of the container
        id,
        # If the container is running, kill it before removing it.
        force: nil,
        # Remove the specified link associated with the container.
        link: nil,
        # Remove anonymous volumes associated with the container.
        v: nil,
        request_options: {}
      )
      end

      # Get a tar archive of a resource in the filesystem of container id.
      sig do
        params(
          id: String,
          path: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def archive(
        # ID or name of the container
        id,
        # Resource in the container’s filesystem to archive.
        path:,
        request_options: {}
      )
      end

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
      sig do
        params(
          id: String,
          detach_keys: String,
          logs: T::Boolean,
          stderr: T::Boolean,
          stdin: T::Boolean,
          stdout: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def attach(
        # ID or name of the container
        id,
        # Override the key sequence for detaching a container.Format is a single character
        # `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`
        # or `_`.
        detach_keys: nil,
        # Replay previous logs from the container.
        #
        # This is useful for attaching to a container that has started and you want to
        # output everything since the container started.
        #
        # If `stream` is also enabled, once all the previous output has been returned, it
        # will seamlessly transition into streaming current output.
        logs: nil,
        # Attach to `stderr`
        stderr: nil,
        # Attach to `stdin`
        stdin: nil,
        # Attach to `stdout`
        stdout: nil,
        # Stream attached streams from the time the request was made onwards.
        stream: nil,
        request_options: {}
      )
      end

      # Returns which files in a container's filesystem have been added, deleted, or
      # modified. The `Kind` of modification can be one of:
      #
      # - `0`: Modified ("C")
      # - `1`: Added ("A")
      # - `2`: Deleted ("D")
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::FilesystemChange])
      end
      def changes(
        # ID or name of the container
        id,
        request_options: {}
      )
      end

      # Run a command inside a running container.
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
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::ContainerExecResponse)
      end
      def exec_(
        # ID or name of container
        id,
        # Attach to `stderr` of the exec command.
        attach_stderr: nil,
        # Attach to `stdin` of the exec command.
        attach_stdin: nil,
        # Attach to `stdout` of the exec command.
        attach_stdout: nil,
        # Command to run, as a string or array of strings.
        cmd: nil,
        # Initial console size, as an `[height, width]` array.
        console_size: nil,
        # Override the key sequence for detaching a container. Format is a single
        # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
        # `[`, `,` or `_`.
        detach_keys: nil,
        # A list of environment variables in the form `["VAR=value", ...]`.
        env: nil,
        # Runs the exec process with extended privileges.
        privileged: nil,
        # Allocate a pseudo-TTY.
        tty: nil,
        # The user, and optionally, group to run the exec process inside the container.
        # Format is one of: `user`, `user:group`, `uid`, or `uid:gid`.
        user: nil,
        # The working directory for the exec process inside the container.
        working_dir: nil,
        request_options: {}
      )
      end

      # Export the contents of a container as a tarball.
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def export(
        # ID or name of the container
        id,
        request_options: {}
      )
      end

      # Return low-level information about a container.
      sig do
        params(
          id: String,
          size: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Container)
      end
      def inspect_(
        # ID or name of the container
        id,
        # Return the size of container as fields `SizeRw` and `SizeRootFs`
        size: nil,
        request_options: {}
      )
      end

      # Send a POSIX signal to a container, defaulting to killing to the container.
      sig do
        params(
          id: String,
          signal: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def kill(
        # ID or name of the container
        id,
        # Signal to send to the container as an integer or string (e.g. `SIGINT`).
        signal: nil,
        request_options: {}
      )
      end

      # Get `stdout` and `stderr` logs from a container.
      #
      # Note: This endpoint works only for containers with the `json-file` or `journald`
      # logging driver.
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
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def logs(
        # ID or name of the container
        id,
        # Keep connection after returning logs.
        follow: nil,
        # Only return logs since this time, as a UNIX timestamp
        since: nil,
        # Return logs from `stderr`
        stderr: nil,
        # Return logs from `stdout`
        stdout: nil,
        # Only return this number of log lines from the end of the logs. Specify as an
        # integer or `all` to output all log lines.
        tail: nil,
        # Add timestamps to every log line
        timestamps: nil,
        # Only return logs before this time, as a UNIX timestamp
        until_: nil,
        request_options: {}
      )
      end

      # Use the freezer cgroup to suspend all processes in a container.
      #
      # Traditionally, when suspending a process the `SIGSTOP` signal is used, which is
      # observable by the process being suspended. With the freezer cgroup the process
      # is unaware, and unable to capture, that it is being suspended, and subsequently
      # resumed.
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def pause(
        # ID or name of the container
        id,
        request_options: {}
      )
      end

      # Delete stopped containers
      sig do
        params(
          filters: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::ContainerPruneResponse)
      end
      def prune(
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `until=<timestamp>` Prune containers created before this timestamp. The
        #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
        #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
        #   machine’s time.
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune containers with (or without, in case
        #   `label!=...` is used) the specified labels.
        filters: nil,
        request_options: {}
      )
      end

      # Rename a container
      sig do
        params(
          id: String,
          name: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def rename(
        # ID or name of the container
        id,
        # New name for the container
        name:,
        request_options: {}
      )
      end

      # Resize the TTY for a container.
      sig do
        params(
          id: String,
          h: Integer,
          w: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def resize(
        # ID or name of the container
        id,
        # Height of the TTY session in characters
        h:,
        # Width of the TTY session in characters
        w:,
        request_options: {}
      )
      end

      # Restart a container
      sig do
        params(
          id: String,
          signal: String,
          t: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def restart(
        # ID or name of the container
        id,
        # Signal to send to the container as an integer or string (e.g. `SIGINT`).
        signal: nil,
        # Number of seconds to wait before killing the container
        t: nil,
        request_options: {}
      )
      end

      # Start a container
      sig do
        params(
          id: String,
          detach_keys: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def start(
        # ID or name of the container
        id,
        # Override the key sequence for detaching a container. Format is a single
        # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
        # `[`, `,` or `_`.
        detach_keys: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          id: String,
          one_shot: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::StatsResponse)
      end
      def stats(
        # ID or name of the container
        id,
        # Only get a single stat instead of waiting for 2 cycles. Must be used with
        # `stream=false`.
        one_shot: nil,
        # Stream the output. If false, the stats will be output once and then it will
        # disconnect.
        stream: nil,
        request_options: {}
      )
      end

      # Stop a container
      sig do
        params(
          id: String,
          signal: String,
          t: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def stop(
        # ID or name of the container
        id,
        # Signal to send to the container as an integer or string (e.g. `SIGINT`).
        signal: nil,
        # Number of seconds to wait before killing the container
        t: nil,
        request_options: {}
      )
      end

      # On Unix systems, this is done by running the `ps` command. This endpoint is not
      # supported on Windows.
      sig do
        params(
          id: String,
          ps_args: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::TopResponse)
      end
      def top(
        # ID or name of the container
        id,
        # The arguments to pass to `ps`. For example, `aux`
        ps_args: nil,
        request_options: {}
      )
      end

      # Resume a container which has been paused.
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def unpause(
        # ID or name of the container
        id,
        request_options: {}
      )
      end

      # Block until a container stops, then returns the exit code.
      sig do
        params(
          id: String,
          condition: DockerEngine::ContainerWaitParams::Condition::OrSymbol,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::WaitResponse)
      end
      def wait(
        # ID or name of the container
        id,
        # Wait until a container state reaches the given condition.
        #
        # Defaults to `not-running` if omitted or empty.
        condition: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
