# typed: strong

module DockerEngineRuby
  module Resources
    class Plugins
      # Create a plugin
      sig do
        params(
          name: String,
          body: DockerEngineRuby::Internal::FileInput,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def create(
        # Query param: The name of the plugin. The `:latest` tag is optional, and is the
        # default if omitted.
        name:,
        # Body param
        body:,
        request_options: {}
      )
      end

      # Returns information about installed plugins.
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Plugin])
      end
      def list(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # plugin list.
        #
        # Available filters:
        #
        # - `capability=<capability name>`
        # - `enable=<true>|<false>`
        filters: nil,
        request_options: {}
      )
      end

      # Remove a plugin
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Plugin)
      end
      def delete(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        # Disable the plugin before removing. This may result in issues if the plugin is
        # in use by a container.
        force: nil,
        request_options: {}
      )
      end

      # Disable a plugin
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def disable(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        # Force disable a plugin even if still in use.
        force: nil,
        request_options: {}
      )
      end

      # Enable a plugin
      sig do
        params(
          name: String,
          timeout: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def enable(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        # Set the HTTP client timeout (in seconds)
        timeout: nil,
        request_options: {}
      )
      end

      # Inspect a plugin
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Plugin)
      end
      def inspect_(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        request_options: {}
      )
      end

      # Get plugin privileges
      sig do
        params(
          remote: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Privilege])
      end
      def privileges(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        remote:,
        request_options: {}
      )
      end

      # Pulls and installs a plugin. After the plugin is installed, it can be enabled
      # using the
      # [`POST /plugins/{name}/enable` endpoint](#operation/PostPluginsEnable).
      sig do
        params(
          remote: String,
          name: String,
          body: T::Array[DockerEngineRuby::Privilege::OrHash],
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def pull(
        # Query param: Remote reference for plugin to install.
        #
        # The `:latest` tag is optional, and is used as the default if omitted.
        remote:,
        # Query param: Local name for the pulled plugin.
        #
        # The `:latest` tag is optional, and is used as the default if omitted.
        name: nil,
        # Body param
        body: nil,
        # Header param: A base64url-encoded auth configuration to use when pulling a
        # plugin from a registry.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Push a plugin to the registry.
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def push(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        request_options: {}
      )
      end

      # Configure a plugin
      sig do
        params(
          name: String,
          body: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def set(
        # The name of the plugin. The `:latest` tag is optional, and is the default if
        # omitted.
        name,
        body: nil,
        request_options: {}
      )
      end

      # Upgrade a plugin
      sig do
        params(
          name: String,
          remote: String,
          body: T::Array[DockerEngineRuby::Privilege::OrHash],
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def upgrade(
        # Path param: The name of the plugin. The `:latest` tag is optional, and is the
        # default if omitted.
        name,
        # Query param: Remote reference to upgrade to.
        #
        # The `:latest` tag is optional, and is used as the default if omitted.
        remote:,
        # Body param
        body: nil,
        # Header param: A base64url-encoded auth configuration to use when pulling a
        # plugin from a registry.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
