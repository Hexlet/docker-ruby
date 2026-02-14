# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Services
      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ServiceCreateParams} for more details.
      #
      # Create a service
      #
      # @overload create(spec:, x_registry_auth: nil, request_options: {})
      #
      # @param spec [DockerEngineAPI::Models::ServiceCreateParams::Spec] Body param: User modifiable configuration for a service.
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration for pulling from private
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::CreateResponse]
      #
      # @see DockerEngineAPI::Models::ServiceCreateParams
      def create(params)
        parsed, options = DockerEngineAPI::ServiceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "services/create",
          headers: parsed.except(:spec).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:spec],
          model: DockerEngineAPI::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ServiceUpdateParams} for more details.
      #
      # Update a service
      #
      # @overload update(id, version:, spec:, registry_auth_from: nil, rollback: nil, x_registry_auth: nil, request_options: {})
      #
      # @param id [String] Path param: ID or name of service.
      #
      # @param version [Integer] Query param: The version number of the service object being updated. This is
      #
      # @param spec [DockerEngineAPI::Models::ServiceUpdateParams::Spec] Body param: User modifiable configuration for a service.
      #
      # @param registry_auth_from [Symbol, DockerEngineAPI::Models::ServiceUpdateParams::RegistryAuthFrom] Query param: If the `X-Registry-Auth` header is not specified, this parameter
      #
      # @param rollback [String] Query param: Set to this parameter to `previous` to cause a server-side rollback
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration for pulling from private
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::UpdateResponse]
      #
      # @see DockerEngineAPI::Models::ServiceUpdateParams
      def update(id, params)
        parsed, options = DockerEngineAPI::ServiceUpdateParams.dump_request(params)
        query_params = [:version, :registry_auth_from, :rollback]
        @client.request(
          method: :post,
          path: ["services/%1$s/update", id],
          query: parsed.slice(*query_params).transform_keys(registry_auth_from: "registryAuthFrom"),
          headers: parsed.except(:spec, *query_params).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:spec],
          model: DockerEngineAPI::UpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ServiceListParams} for more details.
      #
      # List services
      #
      # @overload list(filters: nil, status: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::Service>]
      #
      # @see DockerEngineAPI::Models::ServiceListParams
      def list(params = {})
        parsed, options = DockerEngineAPI::ServiceListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "services",
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service],
          options: options
        )
      end

      # Delete a service
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID or name of service.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ServiceDeleteParams
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
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Service]
      #
      # @see DockerEngineAPI::Models::ServiceInspectParams
      def inspect_(id, params = {})
        parsed, options = DockerEngineAPI::ServiceInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["services/%1$s", id],
          query: parsed.transform_keys(insert_defaults: "insertDefaults"),
          model: DockerEngineAPI::Service,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::ServiceLogsParams} for more details.
      #
      # Get `stdout` and `stderr` logs from a service. See also
      # [`/containers/{id}/logs`](#operation/ContainerLogs).
      #
      # **Note**: This endpoint works only for services with the `local`, `json-file` or
      # `journald` logging drivers.
      #
      # @overload logs(id, details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #
      # @param id [String] ID or name of the service
      #
      # @param details [Boolean] Show service context and extra details provided to logs.
      #
      # @param follow [Boolean] Keep connection after returning logs.
      #
      # @param since [Integer] Only return logs since this time, as a UNIX timestamp
      #
      # @param stderr [Boolean] Return logs from `stderr`
      #
      # @param stdout [Boolean] Return logs from `stdout`
      #
      # @param tail [String] Only return this number of log lines from the end of the logs.
      #
      # @param timestamps [Boolean] Add timestamps to every log line
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineAPI::Models::ServiceLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngineAPI::ServiceLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["services/%1$s/logs", id],
          query: parsed,
          headers: {"accept" => "application/vnd.docker.multiplexed-stream"},
          model: StringIO,
          options: options
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
