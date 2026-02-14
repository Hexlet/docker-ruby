# typed: strong

module DockerEngine
  module Models
    class SwarmInitParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::SwarmInitParams, DockerEngine::Internal::AnyHash)
        end

      # Externally reachable address advertised to other nodes. This can either be an
      # address/port combination in the form `192.168.1.1:4567`, or an interface
      # followed by a port number, like `eth0:4567`. If the port number is omitted, the
      # port number from the listen address is used. If `AdvertiseAddr` is not
      # specified, it will be automatically detected when possible.
      sig { returns(T.nilable(String)) }
      attr_reader :advertise_addr

      sig { params(advertise_addr: String).void }
      attr_writer :advertise_addr

      # Address or interface to use for data path traffic (format: `<ip|interface>`),
      # for example, `192.168.1.1`, or an interface, like `eth0`. If `DataPathAddr` is
      # unspecified, the same address as `AdvertiseAddr` is used.
      #
      # The `DataPathAddr` specifies the address that global scope network drivers will
      # publish towards other nodes in order to reach the containers running on this
      # node. Using this parameter it is possible to separate the container data traffic
      # from the management traffic of the cluster.
      sig { returns(T.nilable(String)) }
      attr_reader :data_path_addr

      sig { params(data_path_addr: String).void }
      attr_writer :data_path_addr

      # DataPathPort specifies the data path port number for data traffic. Acceptable
      # port range is 1024 to 49151. if no port is set or is set to 0, default port 4789
      # will be used.
      sig { returns(T.nilable(Integer)) }
      attr_reader :data_path_port

      sig { params(data_path_port: Integer).void }
      attr_writer :data_path_port

      # Default Address Pool specifies default subnet pools for global scope networks.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :default_addr_pool

      sig { params(default_addr_pool: T::Array[String]).void }
      attr_writer :default_addr_pool

      # Force creation of a new swarm.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force_new_cluster

      sig { params(force_new_cluster: T::Boolean).void }
      attr_writer :force_new_cluster

      # Listen address used for inter-manager communication, as well as determining the
      # networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either
      # be an address/port combination in the form `192.168.1.1:4567`, or an interface
      # followed by a port number, like `eth0:4567`. If the port number is omitted, the
      # default swarm listening port is used.
      sig { returns(T.nilable(String)) }
      attr_reader :listen_addr

      sig { params(listen_addr: String).void }
      attr_writer :listen_addr

      # User modifiable swarm configuration.
      sig { returns(T.nilable(DockerEngine::Spec)) }
      attr_reader :spec

      sig { params(spec: DockerEngine::Spec::OrHash).void }
      attr_writer :spec

      # SubnetSize specifies the subnet size of the networks created from the default
      # subnet pool.
      sig { returns(T.nilable(Integer)) }
      attr_reader :subnet_size

      sig { params(subnet_size: Integer).void }
      attr_writer :subnet_size

      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          data_path_port: Integer,
          default_addr_pool: T::Array[String],
          force_new_cluster: T::Boolean,
          listen_addr: String,
          spec: DockerEngine::Spec::OrHash,
          subnet_size: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            advertise_addr: String,
            data_path_addr: String,
            data_path_port: Integer,
            default_addr_pool: T::Array[String],
            force_new_cluster: T::Boolean,
            listen_addr: String,
            spec: DockerEngine::Spec,
            subnet_size: Integer,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
