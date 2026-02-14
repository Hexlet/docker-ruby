# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Networks
      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::NetworkCreateParams} for more details.
      #
      # Create a network
      #
      # @overload create(name:, attachable: nil, config_from: nil, config_only: nil, driver: nil, enable_i_pv4: nil, enable_i_pv6: nil, ingress: nil, internal: nil, ipam: nil, labels: nil, options: nil, scope: nil, request_options: {})
      #
      # @param name [String] The network's name.
      #
      # @param attachable [Boolean] Globally scoped network is manually attachable by regular
      #
      # @param config_from [DockerEngineRuby::Models::NetworkCreateParams::ConfigFrom] The config-only network source to provide the configuration for
      #
      # @param config_only [Boolean] Creates a config-only network. Config-only networks are placeholder
      #
      # @param driver [String] Name of the network driver plugin to use.
      #
      # @param enable_i_pv4 [Boolean] Enable IPv4 on the network.
      #
      # @param enable_i_pv6 [Boolean] Enable IPv6 on the network.
      #
      # @param ingress [Boolean] Ingress network is the network which provides the routing-mesh
      #
      # @param internal [Boolean] Restrict external access to the network.
      #
      # @param ipam [DockerEngineRuby::Models::NetworkCreateParams::Ipam]
      #
      # @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      # @param options [Hash{Symbol=>String}] Network specific options to be used by the drivers.
      #
      # @param scope [String] The level at which the network exists (e.g. `swarm` for cluster-wide
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::CreateResponse]
      #
      # @see DockerEngineRuby::Models::NetworkCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::NetworkCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "networks/create",
          body: parsed,
          model: DockerEngineRuby::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::NetworkListParams} for more details.
      #
      # Returns a list of networks. For details on the format, see the
      # [network inspect endpoint](#operation/NetworkInspect).
      #
      # Note that it uses a different, smaller representation of a network than
      # inspecting a single network. For example, the list of containers attached to the
      # network is not propagated in API versions 1.28 and up.
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] JSON encoded value of the filters (a `map[string][]string`) to process
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Summary>]
      #
      # @see DockerEngineRuby::Models::NetworkListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::NetworkListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "networks",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary],
          options: options
        )
      end

      # Remove a network
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Network ID or name
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::NetworkDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["networks/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # The network must be either a local-scoped network or a swarm-scoped network with
      # the `attachable` option set. A network cannot be re-attached to a running
      # container
      #
      # @overload connect(id, container:, endpoint_config: nil, request_options: {})
      #
      # @param id [String] Network ID or name
      #
      # @param container [String] The ID or name of the container to connect to the network.
      #
      # @param endpoint_config [DockerEngineRuby::Models::ConnectRequest::EndpointConfig] Configuration for a network endpoint.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::NetworkConnectParams
      def connect(id, params)
        parsed, options = DockerEngineRuby::NetworkConnectParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["networks/%1$s/connect", id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Disconnect a container from a network
      #
      # @overload disconnect(id, container:, force: nil, request_options: {})
      #
      # @param id [String] Network ID or name
      #
      # @param container [String] The ID or name of the container to disconnect from the network.
      #
      # @param force [Boolean] Force the container to disconnect from the network.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::NetworkDisconnectParams
      def disconnect(id, params)
        parsed, options = DockerEngineRuby::NetworkDisconnectParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["networks/%1$s/disconnect", id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Inspect a network
      #
      # @overload inspect_(id, scope: nil, verbose: nil, request_options: {})
      #
      # @param id [String] Network ID or name
      #
      # @param scope [String] Filter the network by scope (swarm, global, or local)
      #
      # @param verbose [Boolean] Detailed inspect output for troubleshooting
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::NetworkInspectResponse]
      #
      # @see DockerEngineRuby::Models::NetworkInspectParams
      def inspect_(id, params = {})
        parsed, options = DockerEngineRuby::NetworkInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["networks/%1$s", id],
          query: parsed,
          model: DockerEngineRuby::Models::NetworkInspectResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::NetworkPruneParams} for more details.
      #
      # Delete unused networks
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::NetworkPruneResponse]
      #
      # @see DockerEngineRuby::Models::NetworkPruneParams
      def prune(params = {})
        parsed, options = DockerEngineRuby::NetworkPruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "networks/prune",
          query: parsed,
          model: DockerEngineRuby::Models::NetworkPruneResponse,
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
