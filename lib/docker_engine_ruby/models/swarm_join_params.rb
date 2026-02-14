# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#join
    class SwarmJoinParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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

      # @!attribute join_token
      #   Secret token for joining this swarm.
      #
      #   @return [String, nil]
      optional :join_token, String, api_name: :JoinToken

      # @!attribute listen_addr
      #   Listen address used for inter-manager communication if the node gets promoted to
      #   manager, as well as determining the networking interface used for the VXLAN
      #   Tunnel Endpoint (VTEP).
      #
      #   @return [String, nil]
      optional :listen_addr, String, api_name: :ListenAddr

      # @!attribute remote_addrs
      #   Addresses of manager nodes already participating in the swarm.
      #
      #   @return [Array<String>, nil]
      optional :remote_addrs, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RemoteAddrs

      # @!method initialize(advertise_addr: nil, data_path_addr: nil, join_token: nil, listen_addr: nil, remote_addrs: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SwarmJoinParams} for more details.
      #
      #   @param advertise_addr [String] Externally reachable address advertised to other nodes. This
      #
      #   @param data_path_addr [String] Address or interface to use for data path traffic (format:
      #
      #   @param join_token [String] Secret token for joining this swarm.
      #
      #   @param listen_addr [String] Listen address used for inter-manager communication if the node
      #
      #   @param remote_addrs [Array<String>] Addresses of manager nodes already participating in the swarm.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
