# typed: strong

module DockerEngineRuby
  module Resources
    class Plugins
      # Create a plugin
      sig do
        params(
          name: String,
          body: T.anything,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def create(
        # Query param
        name:,
        # Body param
        body:,
        request_options: {}
      )
      end

      # List plugins
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Plugin])
      end
      def list(filters: nil, request_options: {})
      end

      # Remove a plugin
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Plugin)
      end
      def delete(name, force: nil, request_options: {})
      end

      # Disable a plugin
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def disable(name, force: nil, request_options: {})
      end

      # Enable a plugin
      sig do
        params(
          name: String,
          timeout: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def enable(name, timeout: nil, request_options: {})
      end

      # Inspect a plugin
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Plugin)
      end
      def inspect_(name, request_options: {})
      end

      # Get plugin privileges
      sig do
        params(
          remote: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Privilege])
      end
      def privileges(remote:, request_options: {})
      end

      # Install a plugin
      sig do
        params(
          remote: String,
          body: T::Array[DockerEngineRuby::Privilege::OrHash],
          name: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def pull(
        # Query param
        remote:,
        # Body param
        body:,
        # Query param
        name: nil,
        # Header param
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Push a plugin
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def push(name, request_options: {})
      end

      # Configure a plugin
      sig do
        params(
          name: String,
          body: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def set(name, body:, request_options: {})
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
        # Path param
        name,
        # Query param
        remote:,
        # Body param
        body:,
        # Header param
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
