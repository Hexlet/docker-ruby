# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Plugins
      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginCreateParams} for more details.
      #
      # Create a plugin
      #
      # @overload create(name:, body:, request_options: {})
      #
      # @param name [String] Query param: The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param body [Pathname, StringIO, IO, String, DockerEngineRuby::FilePart] Body param
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
          headers: {"content-type" => "application/x-tar"},
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginListParams} for more details.
      #
      # Returns information about installed plugins.
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginDeleteParams} for more details.
      #
      # Remove a plugin
      #
      # @overload delete(name, force: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param force [Boolean] Disable the plugin before removing. This may result in issues if the
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginDisableParams} for more details.
      #
      # Disable a plugin
      #
      # @overload disable(name, force: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param force [Boolean] Force disable a plugin even if still in use.
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginEnableParams} for more details.
      #
      # Enable a plugin
      #
      # @overload enable(name, timeout: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param timeout [Integer] Set the HTTP client timeout (in seconds)
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginInspectParams} for more details.
      #
      # Inspect a plugin
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginPrivilegesParams} for more details.
      #
      # Get plugin privileges
      #
      # @overload privileges(remote:, request_options: {})
      #
      # @param remote [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginPullParams} for more details.
      #
      # Pulls and installs a plugin. After the plugin is installed, it can be enabled
      # using the
      # [`POST /plugins/{name}/enable` endpoint](#operation/PostPluginsEnable).
      #
      # @overload pull(remote:, name: nil, body: nil, x_registry_auth: nil, request_options: {})
      #
      # @param remote [String] Query param: Remote reference for plugin to install.
      #
      # @param name [String] Query param: Local name for the pulled plugin.
      #
      # @param body [Array<DockerEngineRuby::Models::Privilege>] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration to use when pulling a plugi
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginPushParams} for more details.
      #
      # Push a plugin to the registry.
      #
      # @overload push(name, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
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

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginSetParams} for more details.
      #
      # Configure a plugin
      #
      # @overload set(name, body: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param body [Array<String>]
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::PluginSetParams
      def set(name, params = {})
        parsed, options = DockerEngineRuby::PluginSetParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/set", name],
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::PluginUpgradeParams} for more details.
      #
      # Upgrade a plugin
      #
      # @overload upgrade(name, remote:, body: nil, x_registry_auth: nil, request_options: {})
      #
      # @param name [String] Path param: The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param remote [String] Query param: Remote reference to upgrade to.
      #
      # @param body [Array<DockerEngineRuby::Models::Privilege>] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration to use when pulling a plugi
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
