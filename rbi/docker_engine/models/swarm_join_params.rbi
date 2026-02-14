# typed: strong

module DockerEngine
  module Models
    class SwarmJoinParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::SwarmJoinParams, DockerEngine::Internal::AnyHash)
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

      # Secret token for joining this swarm.
      sig { returns(T.nilable(String)) }
      attr_reader :join_token

      sig { params(join_token: String).void }
      attr_writer :join_token

      # Listen address used for inter-manager communication if the node gets promoted to
      # manager, as well as determining the networking interface used for the VXLAN
      # Tunnel Endpoint (VTEP).
      sig { returns(T.nilable(String)) }
      attr_reader :listen_addr

      sig { params(listen_addr: String).void }
      attr_writer :listen_addr

      # Addresses of manager nodes already participating in the swarm.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :remote_addrs

      sig { params(remote_addrs: T::Array[String]).void }
      attr_writer :remote_addrs

      sig do
        params(
          advertise_addr: String,
          data_path_addr: String,
          join_token: String,
          listen_addr: String,
          remote_addrs: T::Array[String],
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

      sig do
        override.returns(
          {
            advertise_addr: String,
            data_path_addr: String,
            join_token: String,
            listen_addr: String,
            remote_addrs: T::Array[String],
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
