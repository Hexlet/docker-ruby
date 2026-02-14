# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Swarm#init
    class SwarmInitParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute advertise_addr
      #   Externally reachable address advertised to other nodes. This can either be an
      #   address/port combination in the form `192.168.1.1:4567`, or an interface
      #   followed by a port number, like `eth0:4567`. If the port number is omitted, the
      #   port number from the listen address is used. If `AdvertiseAddr` is not
      #   specified, it will be automatically detected when possible.
      #
      #   @return [String, nil]
      optional :advertise_addr, String, api_name: :AdvertiseAddr

      # @!attribute data_path_addr
      #   Address or interface to use for data path traffic (format: `<ip|interface>`),
      #   for example, `192.168.1.1`, or an interface, like `eth0`. If `DataPathAddr` is
      #   unspecified, the same address as `AdvertiseAddr` is used.
      #
      #   The `DataPathAddr` specifies the address that global scope network drivers will
      #   publish towards other nodes in order to reach the containers running on this
      #   node. Using this parameter it is possible to separate the container data traffic
      #   from the management traffic of the cluster.
      #
      #   @return [String, nil]
      optional :data_path_addr, String, api_name: :DataPathAddr

      # @!attribute data_path_port
      #   DataPathPort specifies the data path port number for data traffic. Acceptable
      #   port range is 1024 to 49151. if no port is set or is set to 0, default port 4789
      #   will be used.
      #
      #   @return [Integer, nil]
      optional :data_path_port, Integer, api_name: :DataPathPort

      # @!attribute default_addr_pool
      #   Default Address Pool specifies default subnet pools for global scope networks.
      #
      #   @return [Array<String>, nil]
      optional :default_addr_pool, DockerEngine::Internal::Type::ArrayOf[String], api_name: :DefaultAddrPool

      # @!attribute force_new_cluster
      #   Force creation of a new swarm.
      #
      #   @return [Boolean, nil]
      optional :force_new_cluster, DockerEngine::Internal::Type::Boolean, api_name: :ForceNewCluster

      # @!attribute listen_addr
      #   Listen address used for inter-manager communication, as well as determining the
      #   networking interface used for the VXLAN Tunnel Endpoint (VTEP). This can either
      #   be an address/port combination in the form `192.168.1.1:4567`, or an interface
      #   followed by a port number, like `eth0:4567`. If the port number is omitted, the
      #   default swarm listening port is used.
      #
      #   @return [String, nil]
      optional :listen_addr, String, api_name: :ListenAddr

      # @!attribute spec
      #   User modifiable swarm configuration.
      #
      #   @return [DockerEngine::Models::Spec, nil]
      optional :spec, -> { DockerEngine::Spec }, api_name: :Spec

      # @!attribute subnet_size
      #   SubnetSize specifies the subnet size of the networks created from the default
      #   subnet pool.
      #
      #   @return [Integer, nil]
      optional :subnet_size, Integer, api_name: :SubnetSize

      # @!method initialize(advertise_addr: nil, data_path_addr: nil, data_path_port: nil, default_addr_pool: nil, force_new_cluster: nil, listen_addr: nil, spec: nil, subnet_size: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::SwarmInitParams} for more details.
      #
      #   @param advertise_addr [String] Externally reachable address advertised to other nodes. This
      #
      #   @param data_path_addr [String] Address or interface to use for data path traffic (format:
      #
      #   @param data_path_port [Integer] DataPathPort specifies the data path port number for data traffic.
      #
      #   @param default_addr_pool [Array<String>] Default Address Pool specifies default subnet pools for global
      #
      #   @param force_new_cluster [Boolean] Force creation of a new swarm.
      #
      #   @param listen_addr [String] Listen address used for inter-manager communication, as well
      #
      #   @param spec [DockerEngine::Models::Spec] User modifiable swarm configuration.
      #
      #   @param subnet_size [Integer] SubnetSize specifies the subnet size of the networks created
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
