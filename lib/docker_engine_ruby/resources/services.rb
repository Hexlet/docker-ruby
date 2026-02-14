# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Services
      # Create a service
      #
      # @overload create(spec:, x_registry_auth: nil, request_options: {})
      #
      # @param spec [DockerEngineRuby::Models::Spec] Body param: User modifiable configuration for a service.
      #
      # @param x_registry_auth [String] Header param
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

      # Update a service
      #
      # @overload update(id, version:, spec:, registry_auth_from: nil, rollback: nil, x_registry_auth: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param version [Integer] Query param
      #
      # @param spec [DockerEngineRuby::Models::Spec] Body param: User modifiable configuration for a service.
      #
      # @param registry_auth_from [Symbol, DockerEngineRuby::Models::ServiceUpdateParams::RegistryAuthFrom] Query param
      #
      # @param rollback [String] Query param
      #
      # @param x_registry_auth [String] Header param
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

      # List services
      #
      # @overload list(filters: nil, status: nil, request_options: {})
      #
      # @param filters [String]
      # @param status [Boolean]
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
      # @param id [String]
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
      # @param id [String]
      # @param insert_defaults [Boolean]
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

      # Get service logs
      #
      # @overload logs(id, details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #
      # @param id [String]
      # @param details [Boolean]
      # @param follow [Boolean]
      # @param since [Integer]
      # @param stderr [Boolean]
      # @param stdout [Boolean]
      # @param tail [String]
      # @param timestamps [Boolean]
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
          headers: {"accept" => "application/octet-stream"},
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
