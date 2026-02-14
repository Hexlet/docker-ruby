# frozen_string_literal: true

module DockerEngine
  module Resources
    class Plugins
      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginCreateParams} for more details.
      #
      # Create a plugin
      #
      # @overload create(name:, body:, request_options: {})
      #
      # @param name [String] Query param: The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param body [Pathname, StringIO, IO, String, DockerEngine::FilePart] Body param
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginCreateParams
      def create(params)
        parsed, options = DockerEngine::PluginCreateParams.dump_request(params)
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
      # {DockerEngine::Models::PluginListParams} for more details.
      #
      # Returns information about installed plugins.
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::Plugin>]
      #
      # @see DockerEngine::Models::PluginListParams
      def list(params = {})
        parsed, options = DockerEngine::PluginListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "plugins",
          query: parsed,
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::Plugin],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginDeleteParams} for more details.
      #
      # Remove a plugin
      #
      # @overload delete(name, force: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param force [Boolean] Disable the plugin before removing. This may result in issues if the
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::Plugin]
      #
      # @see DockerEngine::Models::PluginDeleteParams
      def delete(name, params = {})
        parsed, options = DockerEngine::PluginDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["plugins/%1$s", name],
          query: parsed,
          model: DockerEngine::Plugin,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginDisableParams} for more details.
      #
      # Disable a plugin
      #
      # @overload disable(name, force: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param force [Boolean] Force disable a plugin even if still in use.
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginDisableParams
      def disable(name, params = {})
        parsed, options = DockerEngine::PluginDisableParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/disable", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginEnableParams} for more details.
      #
      # Enable a plugin
      #
      # @overload enable(name, timeout: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param timeout [Integer] Set the HTTP client timeout (in seconds)
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginEnableParams
      def enable(name, params = {})
        parsed, options = DockerEngine::PluginEnableParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/enable", name],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginInspectParams} for more details.
      #
      # Inspect a plugin
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::Plugin]
      #
      # @see DockerEngine::Models::PluginInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["plugins/%1$s/json", name],
          model: DockerEngine::Plugin,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginPrivilegesParams} for more details.
      #
      # Get plugin privileges
      #
      # @overload privileges(remote:, request_options: {})
      #
      # @param remote [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::Privilege>]
      #
      # @see DockerEngine::Models::PluginPrivilegesParams
      def privileges(params)
        parsed, options = DockerEngine::PluginPrivilegesParams.dump_request(params)
        @client.request(
          method: :get,
          path: "plugins/privileges",
          query: parsed,
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::Privilege],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginPullParams} for more details.
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
      # @param body [Array<DockerEngine::Models::Privilege>] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration to use when pulling a plugi
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginPullParams
      def pull(params)
        parsed, options = DockerEngine::PluginPullParams.dump_request(params)
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
      # {DockerEngine::Models::PluginPushParams} for more details.
      #
      # Push a plugin to the registry.
      #
      # @overload push(name, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginPushParams
      def push(name, params = {})
        @client.request(
          method: :post,
          path: ["plugins/%1$s/push", name],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginSetParams} for more details.
      #
      # Configure a plugin
      #
      # @overload set(name, body: nil, request_options: {})
      #
      # @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param body [Array<String>]
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginSetParams
      def set(name, params = {})
        parsed, options = DockerEngine::PluginSetParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["plugins/%1$s/set", name],
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::PluginUpgradeParams} for more details.
      #
      # Upgrade a plugin
      #
      # @overload upgrade(name, remote:, body: nil, x_registry_auth: nil, request_options: {})
      #
      # @param name [String] Path param: The name of the plugin. The `:latest` tag is optional, and is the
      #
      # @param remote [String] Query param: Remote reference to upgrade to.
      #
      # @param body [Array<DockerEngine::Models::Privilege>] Body param
      #
      # @param x_registry_auth [String] Header param: A base64url-encoded auth configuration to use when pulling a plugi
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::PluginUpgradeParams
      def upgrade(name, params)
        parsed, options = DockerEngine::PluginUpgradeParams.dump_request(params)
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
      # @param client [DockerEngine::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
