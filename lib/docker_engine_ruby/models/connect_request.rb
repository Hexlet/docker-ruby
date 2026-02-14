# frozen_string_literal: true

module DockerEngineRuby
  module Models
    class ConnectRequest < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute container
      #   The ID or name of the container to connect to the network.
      #
      #   @return [String]
      required :container, String, api_name: :Container

      # @!attribute endpoint_config
      #   Configuration for a network endpoint.
      #
      #   @return [DockerEngineRuby::Models::ConnectRequest::EndpointConfig, nil]
      optional :endpoint_config,
               -> { DockerEngineRuby::ConnectRequest::EndpointConfig },
               api_name: :EndpointConfig

      # @!method initialize(container:, endpoint_config: nil)
      #   NetworkConnectRequest represents the data to be used to connect a container to a
      #   network.
      #
      #   @param container [String] The ID or name of the container to connect to the network.
      #
      #   @param endpoint_config [DockerEngineRuby::Models::ConnectRequest::EndpointConfig] Configuration for a network endpoint.

      # @see DockerEngineRuby::Models::ConnectRequest#endpoint_config
      class EndpointConfig < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute aliases
        #
        #   @return [Array<String>, nil]
        optional :aliases, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Aliases

        # @!attribute dns_names
        #   List of all DNS names an endpoint has on a specific network. This list is based
        #   on the container name, network aliases, container short ID, and hostname.
        #
        #   These DNS names are non-fully qualified but can contain several dots. You can
        #   get fully qualified DNS names by appending `.<network-name>`. For instance, if
        #   container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
        #   contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
        #
        #   @return [Array<String>, nil]
        optional :dns_names, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :DNSNames

        # @!attribute driver_opts
        #   DriverOpts is a mapping of driver options and values. These options are passed
        #   directly to the driver and are driver specific.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :driver_opts,
                 DockerEngineRuby::Internal::Type::HashOf[String],
                 api_name: :DriverOpts,
                 nil?: true

        # @!attribute endpoint_id
        #   Unique ID for the service endpoint in a Sandbox.
        #
        #   @return [String, nil]
        optional :endpoint_id, String, api_name: :EndpointID

        # @!attribute gateway
        #   Gateway address for this network.
        #
        #   @return [String, nil]
        optional :gateway, String, api_name: :Gateway

        # @!attribute global_i_pv6_address
        #   Global IPv6 address.
        #
        #   @return [String, nil]
        optional :global_i_pv6_address, String, api_name: :GlobalIPv6Address

        # @!attribute global_i_pv6_prefix_len
        #   Mask length of the global IPv6 address.
        #
        #   @return [Integer, nil]
        optional :global_i_pv6_prefix_len, Integer, api_name: :GlobalIPv6PrefixLen

        # @!attribute gw_priority
        #   This property determines which endpoint will provide the default gateway for a
        #   container. The endpoint with the highest priority will be used. If multiple
        #   endpoints have the same priority, endpoints are lexicographically sorted based
        #   on their network name, and the one that sorts first is picked.
        #
        #   @return [Integer, nil]
        optional :gw_priority, Integer, api_name: :GwPriority

        # @!attribute ip_address
        #   IPv4 address.
        #
        #   @return [String, nil]
        optional :ip_address, String, api_name: :IPAddress

        # @!attribute ipam_config
        #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
        #
        #   @return [DockerEngineRuby::Models::ConnectRequest::EndpointConfig::IpamConfig, nil]
        optional :ipam_config,
                 -> { DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig },
                 api_name: :IPAMConfig,
                 nil?: true

        # @!attribute ip_prefix_len
        #   Mask length of the IPv4 address.
        #
        #   @return [Integer, nil]
        optional :ip_prefix_len, Integer, api_name: :IPPrefixLen

        # @!attribute i_pv6_gateway
        #   IPv6 gateway address.
        #
        #   @return [String, nil]
        optional :i_pv6_gateway, String, api_name: :IPv6Gateway

        # @!attribute links
        #
        #   @return [Array<String>, nil]
        optional :links, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :Links

        # @!attribute mac_address
        #   MAC address for the endpoint on this network. The network driver might ignore
        #   this parameter.
        #
        #   @return [String, nil]
        optional :mac_address, String, api_name: :MacAddress

        # @!attribute network_id
        #   Unique ID of the network.
        #
        #   @return [String, nil]
        optional :network_id, String, api_name: :NetworkID

        # @!method initialize(aliases: nil, dns_names: nil, driver_opts: nil, endpoint_id: nil, gateway: nil, global_i_pv6_address: nil, global_i_pv6_prefix_len: nil, gw_priority: nil, ip_address: nil, ipam_config: nil, ip_prefix_len: nil, i_pv6_gateway: nil, links: nil, mac_address: nil, network_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::ConnectRequest::EndpointConfig} for more details.
        #
        #   Configuration for a network endpoint.
        #
        #   @param aliases [Array<String>]
        #
        #   @param dns_names [Array<String>] List of all DNS names an endpoint has on a specific network. This
        #
        #   @param driver_opts [Hash{Symbol=>String}, nil] DriverOpts is a mapping of driver options and values. These options
        #
        #   @param endpoint_id [String] Unique ID for the service endpoint in a Sandbox.
        #
        #   @param gateway [String] Gateway address for this network.
        #
        #   @param global_i_pv6_address [String] Global IPv6 address.
        #
        #   @param global_i_pv6_prefix_len [Integer] Mask length of the global IPv6 address.
        #
        #   @param gw_priority [Integer] This property determines which endpoint will provide the default
        #
        #   @param ip_address [String] IPv4 address.
        #
        #   @param ipam_config [DockerEngineRuby::Models::ConnectRequest::EndpointConfig::IpamConfig, nil] EndpointIPAMConfig represents an endpoint's IPAM configuration.
        #
        #   @param ip_prefix_len [Integer] Mask length of the IPv4 address.
        #
        #   @param i_pv6_gateway [String] IPv6 gateway address.
        #
        #   @param links [Array<String>]
        #
        #   @param mac_address [String] MAC address for the endpoint on this network. The network driver might ignore th
        #
        #   @param network_id [String] Unique ID of the network.

        # @see DockerEngineRuby::Models::ConnectRequest::EndpointConfig#ipam_config
        class IpamConfig < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute i_pv4_address
          #
          #   @return [String, nil]
          optional :i_pv4_address, String, api_name: :IPv4Address

          # @!attribute i_pv6_address
          #
          #   @return [String, nil]
          optional :i_pv6_address, String, api_name: :IPv6Address

          # @!attribute link_local_ips
          #
          #   @return [Array<String>, nil]
          optional :link_local_ips, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :LinkLocalIPs

          # @!method initialize(i_pv4_address: nil, i_pv6_address: nil, link_local_ips: nil)
          #   EndpointIPAMConfig represents an endpoint's IPAM configuration.
          #
          #   @param i_pv4_address [String]
          #   @param i_pv6_address [String]
          #   @param link_local_ips [Array<String>]
        end
      end
    end
  end
end
