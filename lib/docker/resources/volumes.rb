# frozen_string_literal: true

module Docker
  module Resources
    class Volumes
      # Create a volume
      #
      # @overload create(create_request:, request_options: {})
      #
      # @param create_request [Docker::Models::CreateRequest] Volume configuration
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::Volume]
      #
      # @see Docker::Models::VolumeCreateParams
      def create(params)
        parsed, options = Docker::VolumeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "volumes/create",
          body: parsed[:create_request],
          model: Docker::Volume,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::VolumeListParams} for more details.
      #
      # List volumes
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::VolumeListResponse]
      #
      # @see Docker::Models::VolumeListParams
      def list(params = {})
        parsed, options = Docker::VolumeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "volumes",
          query: parsed,
          model: Docker::Models::VolumeListResponse,
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
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::VolumeDeleteParams
      def delete(name, params = {})
        parsed, options = Docker::VolumeDeleteParams.dump_request(params)
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
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::Volume]
      #
      # @see Docker::Models::VolumeInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["volumes/%1$s", name],
          model: Docker::Volume,
          options: params[:request_options]
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
