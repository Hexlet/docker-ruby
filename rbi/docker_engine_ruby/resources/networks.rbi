# typed: strong

module DockerEngineRuby
  module Resources
    class Networks
      # Create a network
      sig do
        params(
          name: String,
          attachable: T::Boolean,
          config_from:
            DockerEngineRuby::NetworkCreateParams::ConfigFrom::OrHash,
          config_only: T::Boolean,
          driver: String,
          enable_i_pv4: T::Boolean,
          enable_i_pv6: T::Boolean,
          ingress: T::Boolean,
          internal: T::Boolean,
          ipam: DockerEngineRuby::NetworkCreateParams::Ipam::OrHash,
          labels: T.anything,
          options: T.anything,
          scope: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::NetworkCreateResponse)
      end
      def create(
        name:,
        attachable: nil,
        # The config-only network source to provide the configuration for this network.
        config_from: nil,
        config_only: nil,
        driver: nil,
        enable_i_pv4: nil,
        enable_i_pv6: nil,
        ingress: nil,
        internal: nil,
        ipam: nil,
        labels: nil,
        options: nil,
        scope: nil,
        request_options: {}
      )
      end

      # List networks
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::NetworkSummary])
      end
      def list(filters: nil, request_options: {})
      end

      # Remove a network
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, request_options: {})
      end

      # Connect a container to a network
      sig do
        params(
          id: String,
          container: String,
          endpoint_config:
            T.nilable(DockerEngineRuby::ConnectRequest::EndpointConfig::OrHash),
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def connect(
        id,
        # The ID or name of the container to connect to the network.
        container:,
        # Configuration for a network endpoint.
        endpoint_config: nil,
        request_options: {}
      )
      end

      # Disconnect a container from a network
      sig do
        params(
          id: String,
          container: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def disconnect(
        id,
        # The ID or name of the container to disconnect from the network.
        container:,
        # Force the container to disconnect from the network.
        force: nil,
        request_options: {}
      )
      end

      # Inspect a network
      sig do
        params(
          id: String,
          scope: String,
          verbose: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::NetworkInspectResponse)
      end
      def inspect_(id, scope: nil, verbose: nil, request_options: {})
      end

      # Delete unused networks
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::NetworkPruneResponse)
      end
      def prune(filters: nil, request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
