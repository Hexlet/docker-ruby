# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Volumes
      # Create a volume
      #
      # @overload create(create_request:, request_options: {})
      #
      # @param create_request [DockerEngineRuby::Models::CreateRequest] Volume configuration
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Volume]
      #
      # @see DockerEngineRuby::Models::VolumeCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::VolumeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "volumes/create",
          body: parsed[:create_request],
          model: DockerEngineRuby::Volume,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::VolumeUpdateParams} for more details.
      #
      # "Update a volume. Valid only for Swarm cluster volumes"
      #
      # @overload update(name, version:, spec: nil, request_options: {})
      #
      # @param name [String] Path param: The name or ID of the volume
      #
      # @param version [Integer] Query param: The version number of the volume being updated. This is required to
      #
      # @param spec [DockerEngineRuby::Models::VolumeUpdateParams::Spec] Body param: Cluster-specific options used to create the volume.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::VolumeUpdateParams
      def update(name, params)
        parsed, options = DockerEngineRuby::VolumeUpdateParams.dump_request(params)
        query_params = [:version]
        @client.request(
          method: :put,
          path: ["volumes/%1$s", name],
          query: parsed.slice(*query_params),
          body: parsed.except(*query_params),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::VolumeListParams} for more details.
      #
      # List volumes
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ListResponse]
      #
      # @see DockerEngineRuby::Models::VolumeListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::VolumeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "volumes",
          query: parsed,
          model: DockerEngineRuby::ListResponse,
          options: options
        )
      end

      # Instruct the driver to remove the volume.
      #
      # @overload delete(name, force: nil, request_options: {})
      #
      # @param name [String] Volume name or ID
      #
      # @param force [Boolean] Force the removal of the volume
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::VolumeDeleteParams
      def delete(name, params = {})
        parsed, options = DockerEngineRuby::VolumeDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["volumes/%1$s", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Inspect a volume
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String] Volume name or ID
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Volume]
      #
      # @see DockerEngineRuby::Models::VolumeInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["volumes/%1$s", name],
          model: DockerEngineRuby::Volume,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::VolumePruneParams} for more details.
      #
      # Delete unused volumes
      #
      # @overload prune(filters: nil, request_options: {})
      #
      # @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::VolumePruneResponse]
      #
      # @see DockerEngineRuby::Models::VolumePruneParams
      def prune(params = {})
        parsed, options = DockerEngineRuby::VolumePruneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "volumes/prune",
          query: parsed,
          model: DockerEngineRuby::Models::VolumePruneResponse,
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
