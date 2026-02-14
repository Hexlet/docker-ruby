# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Nodes
      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::NodeUpdateParams} for more details.
      #
      # Update a node
      #
      # @overload update(id, version:, spec: nil, request_options: {})
      #
      # @param id [String] Path param: The ID of the node
      #
      # @param version [Integer] Query param: The version number of the node object being updated. This is requir
      #
      # @param spec [DockerEngineAPI::Models::Spec] Body param
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::NodeUpdateParams
      def update(id, params)
        parsed, options = DockerEngineAPI::NodeUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["nodes/%1$s/update", id],
          query: parsed.except(:spec),
          body: parsed[:spec],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::NodeListParams} for more details.
      #
      # List nodes
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::Node>]
      #
      # @see DockerEngineAPI::Models::NodeListParams
      def list(params = {})
        parsed, options = DockerEngineAPI::NodeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "nodes",
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Node],
          options: options
        )
      end

      # Delete a node
      #
      # @overload delete(id, force: nil, request_options: {})
      #
      # @param id [String] The ID or name of the node
      #
      # @param force [Boolean] Force remove a node from the swarm
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::NodeDeleteParams
      def delete(id, params = {})
        parsed, options = DockerEngineAPI::NodeDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["nodes/%1$s", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Inspect a node
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String] The ID or name of the node
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Node]
      #
      # @see DockerEngineAPI::Models::NodeInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["nodes/%1$s", id],
          model: DockerEngineAPI::Node,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [DockerEngineAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
