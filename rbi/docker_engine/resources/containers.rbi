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

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
