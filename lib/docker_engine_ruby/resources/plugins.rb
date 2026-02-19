# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Plugins
      # Create a plugin
      #
      # @overload create(name:, body:, request_options: {})
      #
      # @param name [String] Query param
      #
      # @param body [Object] Body param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::PluginCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "plugins/create",
          query: parsed.except(:body),
          headers: {"content-type" => "application/octet-stream"},
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # List plugins
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Plugin>]
      #
      # @see DockerEngineRuby::Models::PluginListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::PluginListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "plugins",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin],
          options: options
        )
      end

      # Remove a plugin
      #
      # @overload delete(name, force: nil, request_options: {})
      #
      # @param name [String]
      # @param force [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Plugin]
      #
      # @see DockerEngineRuby::Models::PluginDeleteParams
      def delete(name, params = {})
        parsed, options = DockerEngineRuby::PluginDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["plugins/%1$s", name],
          query: parsed,
          model: DockerEngineRuby::Plugin,
          options: options
        )
      end

      # Disable a plugin
      #
      # @overload disable(name, force: nil, request_options: {})
      #
      # @param name [String]
      # @param force [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginDisableParams
      def disable(name, params = {})
        parsed, options = DockerEngineRuby::PluginDisableParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/disable", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Enable a plugin
      #
      # @overload enable(name, timeout: nil, request_options: {})
      #
      # @param name [String]
      # @param timeout [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginEnableParams
      def enable(name, params = {})
        parsed, options = DockerEngineRuby::PluginEnableParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/enable", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Inspect a plugin
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Plugin]
      #
      # @see DockerEngineRuby::Models::PluginInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["plugins/%1$s/json", name],
          model: DockerEngineRuby::Plugin,
          options: params[:request_options]
        )
      end

      # Get plugin privileges
      #
      # @overload privileges(remote:, request_options: {})
      #
      # @param remote [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Privilege>]
      #
      # @see DockerEngineRuby::Models::PluginPrivilegesParams
      def privileges(params)
        parsed, options = DockerEngineRuby::PluginPrivilegesParams.dump_request(params)
        @client.request(
          method: :get,
          path: "plugins/privileges",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege],
          options: options
        )
      end

      # Install a plugin
      #
      # @overload pull(remote:, body:, name: nil, x_registry_auth: nil, request_options: {})
      #
      # @param remote [String] Query param
      #
      # @param body [Array<DockerEngineRuby::Models::Privilege>] Body param
      #
      # @param name [String] Query param
      #
      # @param x_registry_auth [String] Header param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginPullParams
      def pull(params)
        parsed, options = DockerEngineRuby::PluginPullParams.dump_request(params)
        query_params = [:remote, :name]
        @client.request(
          method: :post,
          path: "plugins/pull",
          query: parsed.slice(*query_params),
          headers: parsed.except(:body, *query_params).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Push a plugin
      #
      # @overload push(name, request_options: {})
      #
      # @param name [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginPushParams
      def push(name, params = {})
        @client.request(
          method: :post,
          path: ["plugins/%1$s/push", name],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Configure a plugin
      #
      # @overload set(name, body:, request_options: {})
      #
      # @param name [String]
      # @param body [Array<String>]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginSetParams
      def set(name, params)
        parsed, options = DockerEngineRuby::PluginSetParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/set", name],
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Upgrade a plugin
      #
      # @overload upgrade(name, remote:, body:, x_registry_auth: nil, request_options: {})
      #
      # @param name [String] Path param
      #
      # @param remote [String] Query param
      #
      # @param body [Array<DockerEngineRuby::Models::Privilege>] Body param
      #
      # @param x_registry_auth [String] Header param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginUpgradeParams
      def upgrade(name, params)
        parsed, options = DockerEngineRuby::PluginUpgradeParams.dump_request(params)
        query_params = [:remote]
        @client.request(
          method: :post,
          path: ["plugins/%1$s/upgrade", name],
          query: parsed.slice(*query_params),
          headers: parsed.except(:body, *query_params).transform_keys(x_registry_auth: "x-registry-auth"),
          body: parsed[:body],
          model: NilClass,
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
