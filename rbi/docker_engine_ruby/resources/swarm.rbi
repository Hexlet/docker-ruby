# typed: strong

module DockerEngineRuby
  module Resources
    class Swarm
      # Update a swarm
      sig do
        params(
          version: Integer,
          spec: DockerEngineRuby::Spec::OrHash,
          rotate_manager_token: T::Boolean,
          rotate_manager_unlock_key: T::Boolean,
          rotate_worker_token: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def update(
        # Query param
        version:,
        # Body param: User modifiable swarm configuration.
        spec:,
        # Query param
        rotate_manager_token: nil,
        # Query param
        rotate_manager_unlock_key: nil,
        # Query param
        rotate_worker_token: nil,
        request_options: {}
      )
      end

      # Initialize a new swarm
      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          data_path_port: Integer,
          default_addr_pool: T::Array[String],
          force_new_cluster: T::Boolean,
          listen_addr: String,
          spec: DockerEngineRuby::Spec::OrHash,
          subnet_size: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(String)
      end
      def init(
        advertise_addr: nil,
        data_path_addr: nil,
        data_path_port: nil,
        default_addr_pool: nil,
        force_new_cluster: nil,
        listen_addr: nil,
        # User modifiable swarm configuration.
        spec: nil,
        subnet_size: nil,
        request_options: {}
      )
      end

      # Inspect swarm
      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::SwarmAPI)
      end
      def inspect_(request_options: {})
      end

      # Join an existing swarm
      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          join_token: String,
          listen_addr: String,
          remote_addrs: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def join(
        advertise_addr: nil,
        data_path_addr: nil,
        join_token: nil,
        listen_addr: nil,
        remote_addrs: nil,
        request_options: {}
      )
      end

      # Leave a swarm
      sig do
        params(
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def leave(force: nil, request_options: {})
      end

      # Unlock a locked manager
      sig do
        params(
          unlock_key: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def unlock(unlock_key: nil, request_options: {})
      end

      # Get the unlock key
      sig do
        params(
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::SwarmUnlockKeyResponse)
      end
      def unlock_key(request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
