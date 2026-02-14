# frozen_string_literal: true

module DockerEngine
  module Resources
    class Configs
      # Create a config
      #
      # @overload create(spec: nil, request_options: {})
      #
      # @param spec [DockerEngine::Models::ConfigCreateParams::Spec]
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::ConfigCreateResponse]
      #
      # @see DockerEngine::Models::ConfigCreateParams
      def create(params = {})
        parsed, options = DockerEngine::ConfigCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "configs/create",
          body: parsed[:spec],
          model: DockerEngine::Models::ConfigCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ConfigUpdateParams} for more details.
      #
      # Update a Config
      #
      # @overload update(id, version:, spec: nil, request_options: {})
      #
      # @param id [String] Path param: The ID or name of the config
      #
      # @param version [Integer] Query param: The version number of the config object being updated. This is
      #
      # @param spec [DockerEngine::Models::Spec] Body param
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ConfigUpdateParams
      def update(id, params)
        parsed, options = DockerEngine::ConfigUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["configs/%1$s/update", id],
          query: parsed.except(:spec),
          body: parsed[:spec],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::ConfigListParams} for more details.
      #
      # List configs
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::Config>]
      #
      # @see DockerEngine::Models::ConfigListParams
      def list(params = {})
        parsed, options = DockerEngine::ConfigListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "configs",
          query: parsed,
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::Config],
          options: options
        )
      end

      # Delete a config
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID of the config
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::ConfigDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["configs/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Inspect a config
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String] ID of the config
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::Config]
      #
      # @see DockerEngine::Models::ConfigInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["configs/%1$s", id],
          model: DockerEngine::Config,
          options: params[:request_options]
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
