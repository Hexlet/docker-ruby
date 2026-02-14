# typed: strong

module DockerEngineRuby
  module Resources
    class Networks
      # Create a network
      sig do
        params(
          name: String,
          attachable: T::Boolean,
          config_from:
            DockerEngineRuby::NetworkCreateParams::ConfigFrom::OrHash,
          config_only: T::Boolean,
          driver: String,
          enable_i_pv4: T::Boolean,
          enable_i_pv6: T::Boolean,
          ingress: T::Boolean,
          internal: T::Boolean,
          ipam: DockerEngineRuby::NetworkCreateParams::Ipam::OrHash,
          labels: T::Hash[Symbol, String],
          options: T::Hash[Symbol, String],
          scope: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::CreateResponse)
      end
      def create(
        # The network's name.
        name:,
        # Globally scoped network is manually attachable by regular containers from
        # workers in swarm mode.
        attachable: nil,
        # The config-only network source to provide the configuration for this network.
        config_from: nil,
        # Creates a config-only network. Config-only networks are placeholder networks for
        # network configurations to be used by other networks. Config-only networks cannot
        # be used directly to run containers or services.
        config_only: nil,
        # Name of the network driver plugin to use.
        driver: nil,
        # Enable IPv4 on the network.
        enable_i_pv4: nil,
        # Enable IPv6 on the network.
        enable_i_pv6: nil,
        # Ingress network is the network which provides the routing-mesh in swarm mode.
        ingress: nil,
        # Restrict external access to the network.
        internal: nil,
        ipam: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Network specific options to be used by the drivers.
        options: nil,
        # The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
        # for machine level).
        scope: nil,
        request_options: {}
      )
      end

      # Returns a list of networks. For details on the format, see the
      # [network inspect endpoint](#operation/NetworkInspect).
      #
      # Note that it uses a different, smaller representation of a network than
      # inspecting a single network. For example, the list of containers attached to the
      # network is not propagated in API versions 1.28 and up.
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Summary])
      end
      def list(
        # JSON encoded value of the filters (a `map[string][]string`) to process on the
        # networks list.
        #
        # Available filters:
        #
        # - `dangling=<boolean>` When set to `true` (or `1`), returns all networks that
        #   are not in use by a container. When set to `false` (or `0`), only networks
        #   that are in use by one or more containers are returned.
        # - `driver=<driver-name>` Matches a network's driver.
        # - `id=<network-id>` Matches all or part of a network ID.
        # - `label=<key>` or `label=<key>=<value>` of a network label.
        # - `name=<network-name>` Matches all or part of a network name.
        # - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`,
        #   `global`, or `local`).
        # - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword
        #   returns all user-defined networks.
        filters: nil,
        request_options: {}
      )
      end

      # Remove a network
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Network ID or name
        id,
        request_options: {}
      )
      end

      # The network must be either a local-scoped network or a swarm-scoped network with
      # the `attachable` option set. A network cannot be re-attached to a running
      # container
      sig do
        params(
          id: String,
          container: String,
          endpoint_config:
            DockerEngineRuby::ConnectRequest::EndpointConfig::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def connect(
        # Network ID or name
        id,
        # The ID or name of the container to connect to the network.
        container:,
        # Configuration for a network endpoint.
        endpoint_config: nil,
        request_options: {}
      )
      end

      # Disconnect a container from a network
      sig do
        params(
          id: String,
          container: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def disconnect(
        # Network ID or name
        id,
        # The ID or name of the container to disconnect from the network.
        container:,
        # Force the container to disconnect from the network.
        force: nil,
        request_options: {}
      )
      end

      # Inspect a network
      sig do
        params(
          id: String,
          scope: String,
          verbose: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::NetworkInspectResponse)
      end
      def inspect_(
        # Network ID or name
        id,
        # Filter the network by scope (swarm, global, or local)
        scope: nil,
        # Detailed inspect output for troubleshooting
        verbose: nil,
        request_options: {}
      )
      end

      # Delete unused networks
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::NetworkPruneResponse)
      end
      def prune(
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `until=<timestamp>` Prune networks created before this timestamp. The
        #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
        #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
        #   machine’s time.
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...`
        #   is used) the specified labels.
        filters: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
