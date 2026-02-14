# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Services
      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ServiceCreateParams} for more details.
      #
      # Create a service
      #
      # @overload create(spec:, x_registry_auth: nil, request_options: {})
      #
      # @param spec [DockerEngineRuby::Models::ServiceCreateParams::Spec] Body param: User modifiable configuration for a service.
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration for pulling from private
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::CreateResponse]
      #
      # @see DockerEngineRuby::Models::ServiceCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::ServiceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "services/create",
          headers: parsed.except(:spec).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:spec],
          model: DockerEngineRuby::CreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ServiceUpdateParams} for more details.
      #
      # Update a service
      #
      # @overload update(id, version:, spec:, registry_auth_from: nil, rollback: nil, x_registry_auth: nil, request_options: {})
      #
      # @param id [String] Path param: ID or name of service.
      #
      # @param version [Integer] Query param: The version number of the service object being updated. This is
      #
      # @param spec [DockerEngineRuby::Models::ServiceUpdateParams::Spec] Body param: User modifiable configuration for a service.
      #
      # @param registry_auth_from [Symbol, DockerEngineRuby::Models::ServiceUpdateParams::RegistryAuthFrom] Query param: If the `X-Registry-Auth` header is not specified, this parameter
      #
      # @param rollback [String] Query param: Set to this parameter to `previous` to cause a server-side rollback
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration for pulling from private
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::UpdateResponse]
      #
      # @see DockerEngineRuby::Models::ServiceUpdateParams
      def update(id, params)
        parsed, options = DockerEngineRuby::ServiceUpdateParams.dump_request(params)
        query_params = [:version, :registry_auth_from, :rollback]
        @client.request(
          method: :post,
          path: ["services/%1$s/update", id],
          query: parsed.slice(*query_params).transform_keys(registry_auth_from: "registryAuthFrom"),
          headers: parsed.except(:spec, *query_params).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:spec],
          model: DockerEngineRuby::UpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ServiceListParams} for more details.
      #
      # List services
      #
      # @overload list(filters: nil, status: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Service>]
      #
      # @see DockerEngineRuby::Models::ServiceListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::ServiceListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "services",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Service],
          options: options
        )
      end

      # Delete a service
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID or name of service.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ServiceDeleteParams
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
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Service]
      #
      # @see DockerEngineRuby::Models::ServiceInspectParams
      def inspect_(id, params = {})
        parsed, options = DockerEngineRuby::ServiceInspectParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["services/%1$s", id],
          query: parsed.transform_keys(insert_defaults: "insertDefaults"),
          model: DockerEngineRuby::Service,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::ServiceLogsParams} for more details.
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
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineRuby::Models::ServiceLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngineRuby::ServiceLogsParams.dump_request(params)
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
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
