# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Configs
      # Create a config
      #
      # @overload create(spec: nil, request_options: {})
      #
      # @param spec [DockerEngineAPI::Models::ConfigCreateParams::Spec]
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::ConfigCreateResponse]
      #
      # @see DockerEngineAPI::Models::ConfigCreateParams
      def create(params = {})
        parsed, options = DockerEngineAPI::ConfigCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "configs/create",
          body: parsed[:spec],
          model: DockerEngineAPI::Models::ConfigCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ConfigUpdateParams} for more details.
      #
      # Update a Config
      #
      # @overload update(id, version:, spec: nil, request_options: {})
      #
      # @param id [String] Path param: The ID or name of the config
      #
      # @param version [Integer] Query param: The version number of the config object being updated. This is
      #
      # @param spec [DockerEngineAPI::Models::Spec] Body param
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ConfigUpdateParams
      def update(id, params)
        parsed, options = DockerEngineAPI::ConfigUpdateParams.dump_request(params)
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
      # {DockerEngineAPI::Models::ConfigListParams} for more details.
      #
      # List configs
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::Config>]
      #
      # @see DockerEngineAPI::Models::ConfigListParams
      def list(params = {})
        parsed, options = DockerEngineAPI::ConfigListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "configs",
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Config],
          options: options
        )
      end

      # Delete a config
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID of the config
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ConfigDeleteParams
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
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Config]
      #
      # @see DockerEngineAPI::Models::ConfigInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["configs/%1$s", id],
          model: DockerEngineAPI::Config,
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
