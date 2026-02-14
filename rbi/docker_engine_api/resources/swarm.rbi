# typed: strong

module DockerEngineAPI
  module Resources
    class Swarm
      # Update a swarm
      sig do
        params(
          version: Integer,
          spec: DockerEngineAPI::Spec::OrHash,
          rotate_manager_token: T::Boolean,
          rotate_manager_unlock_key: T::Boolean,
          rotate_worker_token: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def update(
        # Query param: The version number of the swarm object being updated. This is
        # required to avoid conflicting writes.
        version:,
        # Body param: User modifiable swarm configuration.
        spec:,
        # Query param: Rotate the manager join token.
        rotate_manager_token: nil,
        # Query param: Rotate the manager unlock key.
        rotate_manager_unlock_key: nil,
        # Query param: Rotate the worker join token.
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
          spec: DockerEngineAPI::Spec::OrHash,
          subnet_size: Integer,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(String)
      end
      def init(
        # Externally reachable address advertised to other nodes. This can either be an
        # address/port combination in the form `192.168.1.1:4567`, or an interface
        # followed by a port number, like `eth0:4567`. If the port number is omitted, the
        # port number from the listen address is used. If `AdvertiseAddr` is not
        # specified, it will be automatically detected when possible.
        advertise_addr: nil,
        # Address or interface to use for data path traffic (format: `<ip|interface>`),
        # for example, `192.168.1.1`, or an interface, like `eth0`. If `DataPathAddr` is
        # unspecified, the same address as `AdvertiseAddr` is used.
        #
        # The `DataPathAddr` specifies the address that global scope network drivers will
        # publish towards other nodes in order to reach the containers running on this
        # node. Using this parameter it is possible to separate the container data traffic
        # from the management traffic of the cluster.
        data_path_addr: nil,
        # DataPathPort specifies the data path port number for data traffic. Acceptable
        # port range is 1024 to 49151. if no port is set or is set to 0, default port 4789
        # will be used.
        data_path_port: nil,
        # Default Address Pool specifies default subnet pools for global scope networks.
        default_addr_pool: nil,
        # Force creation of a new swarm.
        force_new_cluster: nil,
        # Listen address used for inter-manager communication, as well as determining the
        # networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either
        # be an address/port combination in the form `192.168.1.1:4567`, or an interface
        # followed by a port number, like `eth0:4567`. If the port number is omitted, the
        # default swarm listening port is used.
        listen_addr: nil,
        # User modifiable swarm configuration.
        spec: nil,
        # SubnetSize specifies the subnet size of the networks created from the default
        # subnet pool.
        subnet_size: nil,
        request_options: {}
      )
      end

      # Inspect swarm
      sig do
        params(
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::SwarmAPI)
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def join(
        # Externally reachable address advertised to other nodes. This can either be an
        # address/port combination in the form `192.168.1.1:4567`, or an interface
        # followed by a port number, like `eth0:4567`. If the port number is omitted, the
        # port number from the listen address is used. If `AdvertiseAddr` is not
        # specified, it will be automatically detected when possible.
        advertise_addr: nil,
        # Address or interface to use for data path traffic (format: `<ip|interface>`),
        # for example, `192.168.1.1`, or an interface, like `eth0`. If `DataPathAddr` is
        # unspecified, the same address as `AdvertiseAddr` is used.
        #
        # The `DataPathAddr` specifies the address that global scope network drivers will
        # publish towards other nodes in order to reach the containers running on this
        # node. Using this parameter it is possible to separate the container data traffic
        # from the management traffic of the cluster.
        data_path_addr: nil,
        # Secret token for joining this swarm.
        join_token: nil,
        # Listen address used for inter-manager communication if the node gets promoted to
        # manager, as well as determining the networking interface used for the VXLAN
        # Tunnel Endpoint (VTEP).
        listen_addr: nil,
        # Addresses of manager nodes already participating in the swarm.
        remote_addrs: nil,
        request_options: {}
      )
      end

      # Leave a swarm
      sig do
        params(
          force: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def leave(
        # Force leave swarm, even if this is the last manager or that it will break the
        # cluster.
        force: nil,
        request_options: {}
      )
      end

      # Unlock a locked manager
      sig do
        params(
          unlock_key: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def unlock(
        # The swarm's unlock key.
        unlock_key: nil,
        request_options: {}
      )
      end

      # Get the unlock key
      sig do
        params(
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Models::SwarmUnlockKeyResponse)
      end
      def unlock_key(request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
