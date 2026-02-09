# frozen_string_literal: true

module Docker
  module Resources
    class Services
      # Some parameter documentations has been truncated, see
      # {Docker::Models::ServiceCreateParams} for more details.
      #
      # Create a service
      #
      # @overload create(spec:, x_registry_auth: nil, request_options: {})
      #
      # @param spec [Docker::Models::ServiceCreateParams::Spec] Body param: User modifiable configuration for a service.
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration for pulling from private
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::ServiceCreateResponse]
      #
      # @see Docker::Models::ServiceCreateParams
      def create(params)
        parsed, options = Docker::ServiceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "services/create",
          headers: parsed.except(:spec).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:spec],
          model: Docker::Models::ServiceCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Docker::Models::ServiceListParams} for more details.
      #
      # List services
      #
      # @overload list(filters: nil, status: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Docker::Models::Service>]
      #
      # @see Docker::Models::ServiceListParams
      def list(params = {})
        parsed, options = Docker::ServiceListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "services",
          query: parsed,
          model: Docker::Internal::Type::ArrayOf[Docker::Service],
          options: options
        )
      end

      # Delete a service
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID or name of service.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Docker::Models::ServiceDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["services/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Inspect a service
      #
      # @overload inspect_(id, insert_defaults: nil, request_options: {})
      #
      # @param id [String] ID or name of service.
      #
      # @param insert_defaults [Boolean] Fill empty fields with default values.
      #
      # @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Docker::Models::Service]
      #
      # @see Docker::Models::ServiceInspectParams
      def inspect_(id, params = {})
        parsed, options = Docker::ServiceInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["services/%1$s", id],
          query: parsed.transform_keys(insert_defaults: "insertDefaults"),
          model: Docker::Service,
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
