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
      # @param name [String]
      #
      # @param attachable [Boolean]
      #
      # @param config_from [DockerEngineRuby::Models::NetworkCreateParams::ConfigFrom] The config-only network source to provide the configuration for
      #
      # @param config_only [Boolean]
      #
      # @param driver [String]
      #
      # @param enable_i_pv4 [Boolean]
      #
      # @param enable_i_pv6 [Boolean]
      #
      # @param ingress [Boolean]
      #
      # @param internal [Boolean]
      #
      # @param ipam [DockerEngineRuby::Models::NetworkCreateParams::Ipam]
      #
      # @param labels [Hash{Symbol=>String}]
      #
      # @param options [Hash{Symbol=>String}]
      #
      # @param scope [String]
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

      # List networks
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String]
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
      # @param id [String]
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

      # Connect a container to a network
      #
      # @overload connect(id, container:, endpoint_config: nil, request_options: {})
      #
      # @param id [String]
      #
      # @param container [String] The ID or name of the container to connect to the network.
      #
      # @param endpoint_config [DockerEngineRuby::Models::ConnectRequest::EndpointConfig, nil] Configuration for a network endpoint.
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
      # @param id [String]
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
      # @param id [String]
      # @param scope [String]
      # @param verbose [Boolean]
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

      # Delete unused networks
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String]
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
