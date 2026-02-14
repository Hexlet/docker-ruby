# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Nodes
      # Update a node
      #
      # @overload update(id, version:, spec:, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param version [Integer] Query param
      #
      # @param spec [DockerEngineRuby::Models::Spec] Body param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::NodeUpdateParams
      def update(id, params)
        parsed, options = DockerEngineRuby::NodeUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["nodes/%1$s/update", id],
          query: parsed.except(:spec),
          body: parsed[:spec],
          model: NilClass,
          options: options
        )
      end

      # List nodes
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Node>]
      #
      # @see DockerEngineRuby::Models::NodeListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::NodeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "nodes",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Node],
          options: options
        )
      end

      # Delete a node
      #
      # @overload delete(id, force: nil, request_options: {})
      #
      # @param id [String]
      # @param force [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::NodeDeleteParams
      def delete(id, params = {})
        parsed, options = DockerEngineRuby::NodeDeleteParams.dump_request(params)
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
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Node]
      #
      # @see DockerEngineRuby::Models::NodeInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["nodes/%1$s", id],
          model: DockerEngineRuby::Node,
          options: params[:request_options]
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
