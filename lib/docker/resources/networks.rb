# frozen_string_literal: true

module Docker
  module Resources
    class Networks
      # Some parameter documentations has been truncated, see
      # {Docker::Models::NetworkCreateParams} for more details.
      #
      # Create a network
      #
      # @overload create(name:, attachable: nil, config_from: nil, config_only: nil, driver: nil, enable_i_pv4: nil, enable_i_pv6: nil, ingress: nil, internal: nil, ipam: nil, labels: nil, options: nil, scope: nil, request_options: {})
      #
      # @param name [String] The network's name.
      #
      # @param attachable [Boolean] Globally scoped network is manually attachable by regular
      #
      # @param config_from [Docker::Models::NetworkCreateParams::ConfigFrom] The config-only network source to provide the configuration for
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
      # @param ipam [Docker::Models::NetworkCreateParams::Ipam]
      #
      # @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      # @param options [Hash{Symbol=>String}] Network specific options to be used by the drivers.
      #
      # @param scope [String] The level at which the network exists (e.g. `swarm` for cluster-wide
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::NetworkCreateResponse]
      #
      # @see Docker::Models::NetworkCreateParams
      def create(params)
        parsed, options = Docker::NetworkCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "networks/create",
          body: parsed,
          model: Docker::Models::NetworkCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::NetworkListParams} for more details.
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
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Docker::Models::Summary>]
      #
      # @see Docker::Models::NetworkListParams
      def list(params = {})
        parsed, options = Docker::NetworkListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "networks",
          query: parsed,
          model: Docker::Internal::Type::ArrayOf[Docker::Summary],
          options: options
        )
      end

      # Remove a network
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Network ID or name
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::NetworkDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["networks/%1$s", id],
          model: NilClass,
          options: params[:request_options]
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
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::NetworkInspectResponse]
      #
      # @see Docker::Models::NetworkInspectParams
      def inspect_(id, params = {})
        parsed, options = Docker::NetworkInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["networks/%1$s", id],
          query: parsed,
          model: Docker::Models::NetworkInspectResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Docker::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
