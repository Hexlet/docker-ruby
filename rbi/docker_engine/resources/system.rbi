# typed: strong

module DockerEngine
  module Resources
    class System
      # Get data usage information
      sig do
        params(
          type: T::Array[DockerEngine::SystemDataUsageParams::Type::OrSymbol],
          verbose: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::SystemDataUsageResponse)
      end
      def data_usage(
        # Object types, for which to compute and return data.
        type: nil,
        # Show detailed information on space usage.
        verbose: nil,
        request_options: {}
      )
      end

      # Stream real-time events from the server.
      #
      # Various objects within Docker report events when something happens to them.
      #
      # Containers report these events: `attach`, `commit`, `copy`, `create`, `destroy`,
      # `detach`, `die`, `exec_create`, `exec_detach`, `exec_start`, `exec_die`,
      # `export`, `health_status`, `kill`, `oom`, `pause`, `rename`, `resize`,
      # `restart`, `start`, `stop`, `top`, `unpause`, `update`, and `prune`
      #
      # Images report these events: `create`, `delete`, `import`, `load`, `pull`,
      # `push`, `save`, `tag`, `untag`, and `prune`
      #
      # Volumes report these events: `create`, `mount`, `unmount`, `destroy`, and
      # `prune`
      #
      # Networks report these events: `create`, `connect`, `disconnect`, `destroy`,
      # `update`, `remove`, and `prune`
      #
      # The Docker daemon reports these events: `reload`
      #
      # Services report these events: `create`, `update`, and `remove`
      #
      # Nodes report these events: `create`, `update`, and `remove`
      #
      # Secrets report these events: `create`, `update`, and `remove`
      #
      # Configs report these events: `create`, `update`, and `remove`
      #
      # The Builder reports `prune` events
      sig do
        params(
          filters: String,
          since: String,
          until_: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::SystemEventsResponse)
      end
      def events(
        # A JSON encoded value of filters (a `map[string][]string`) to process on the
        # event list. Available filters:
        #
        # - `config=<string>` config name or ID
        # - `container=<string>` container name or ID
        # - `daemon=<string>` daemon name or ID
        # - `event=<string>` event type
        # - `image=<string>` image name or ID
        # - `label=<string>` image or container label
        # - `network=<string>` network name or ID
        # - `node=<string>` node ID
        # - `plugin`=<string> plugin name or ID
        # - `scope`=<string> local or swarm
        # - `secret=<string>` secret name or ID
        # - `service=<string>` service name or ID
        # - `type=<string>` object to filter by, one of `container`, `image`, `volume`,
        #   `network`, `daemon`, `plugin`, `node`, `service`, `secret` or `config`
        # - `volume=<string>` volume name
        filters: nil,
        # Show events created since this timestamp then stream new events.
        since: nil,
        # Show events created until this timestamp then stop streaming.
        until_: nil,
        request_options: {}
      )
      end

      # Get system information
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          DockerEngine::Info
        )
      end
      def info(request_options: {})
      end

      # This is a dummy endpoint you can use to test if the server is accessible.
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          String
        )
      end
      def ping(request_options: {})
      end

      # Returns the version of Docker that is running and various information about the
      # system that Docker is running on.
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          DockerEngine::Version
        )
      end
      def version(request_options: {})
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
