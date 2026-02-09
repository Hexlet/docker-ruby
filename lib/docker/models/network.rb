# frozen_string_literal: true

module Docker
  module Models
    class Network < Docker::Internal::Type::BaseModel
      # @!attribute attachable
      #   Whether a global / swarm scope network is manually attachable by regular
      #   containers from workers in swarm mode.
      #
      #   @return [Boolean, nil]
      optional :attachable, Docker::Internal::Type::Boolean, api_name: :Attachable

      # @!attribute config_from
      #   The config-only network source to provide the configuration for this network.
      #
      #   @return [Docker::Models::Network::ConfigFrom, nil]
      optional :config_from, -> { Docker::Network::ConfigFrom }, api_name: :ConfigFrom

      # @!attribute config_only
      #   Whether the network is a config-only network. Config-only networks are
      #   placeholder networks for network configurations to be used by other networks.
      #   Config-only networks cannot be used directly to run containers or services.
      #
      #   @return [Boolean, nil]
      optional :config_only, Docker::Internal::Type::Boolean, api_name: :ConfigOnly

      # @!attribute created
      #   Date and time at which the network was created in
      #   [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      #
      #   @return [String, nil]
      optional :created, String, api_name: :Created

      # @!attribute driver
      #   The name of the driver used to create the network (e.g. `bridge`, `overlay`).
      #
      #   @return [String, nil]
      optional :driver, String, api_name: :Driver

      # @!attribute enable_i_pv4
      #   Whether the network was created with IPv4 enabled.
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv4, Docker::Internal::Type::Boolean, api_name: :EnableIPv4

      # @!attribute enable_i_pv6
      #   Whether the network was created with IPv6 enabled.
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv6, Docker::Internal::Type::Boolean, api_name: :EnableIPv6

      # @!attribute id
      #   ID that uniquely identifies a network on a single machine.
      #
      #   @return [String, nil]
      optional :id, String, api_name: :Id

      # @!attribute ingress
      #   Whether the network is providing the routing-mesh for the swarm cluster.
      #
      #   @return [Boolean, nil]
      optional :ingress, Docker::Internal::Type::Boolean, api_name: :Ingress

      # @!attribute internal
      #   Whether the network is created to only allow internal networking connectivity.
      #
      #   @return [Boolean, nil]
      optional :internal, Docker::Internal::Type::Boolean, api_name: :Internal

      # @!attribute ipam
      #
      #   @return [Docker::Models::Network::Ipam, nil]
      optional :ipam, -> { Docker::Network::Ipam }, api_name: :IPAM

      # @!attribute labels
      #   Metadata specific to the network being created.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Docker::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute name
      #   Name of the network.
      #
      #   @return [String, nil]
      optional :name, String, api_name: :Name

      # @!attribute options
      #   Network-specific options uses when creating the network.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

      # @!attribute peers
      #   List of peer nodes for an overlay network. This field is only present for
      #   overlay networks, and omitted for other network types.
      #
      #   @return [Array<Docker::Models::Network::Peer>, nil]
      optional :peers, -> { Docker::Internal::Type::ArrayOf[Docker::Network::Peer] }, api_name: :Peers

      # @!attribute scope
      #   The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
      #   for machine level)
      #
      #   @return [String, nil]
      optional :scope, String, api_name: :Scope

      # @!method initialize(attachable: nil, config_from: nil, config_only: nil, created: nil, driver: nil, enable_i_pv4: nil, enable_i_pv6: nil, id: nil, ingress: nil, internal: nil, ipam: nil, labels: nil, name: nil, options: nil, peers: nil, scope: nil)
      #   Some parameter documentations has been truncated, see {Docker::Models::Network}
      #   for more details.
      #
      #   @param attachable [Boolean] Whether a global / swarm scope network is manually attachable by regular
      #
      #   @param config_from [Docker::Models::Network::ConfigFrom] The config-only network source to provide the configuration for
      #
      #   @param config_only [Boolean] Whether the network is a config-only network. Config-only networks are
      #
      #   @param created [String] Date and time at which the network was created in
      #
      #   @param driver [String] The name of the driver used to create the network (e.g. `bridge`,
      #
      #   @param enable_i_pv4 [Boolean] Whether the network was created with IPv4 enabled.
      #
      #   @param enable_i_pv6 [Boolean] Whether the network was created with IPv6 enabled.
      #
      #   @param id [String] ID that uniquely identifies a network on a single machine.
      #
      #   @param ingress [Boolean] Whether the network is providing the routing-mesh for the swarm cluster.
      #
      #   @param internal [Boolean] Whether the network is created to only allow internal networking
      #
      #   @param ipam [Docker::Models::Network::Ipam]
      #
      #   @param labels [Hash{Symbol=>String}] Metadata specific to the network being created.
      #
      #   @param name [String] Name of the network.
      #
      #   @param options [Hash{Symbol=>String}] Network-specific options uses when creating the network.
      #
      #   @param peers [Array<Docker::Models::Network::Peer>] List of peer nodes for an overlay network. This field is only present
      #
      #   @param scope [String] The level at which the network exists (e.g. `swarm` for cluster-wide

      # @see Docker::Models::Network#config_from
      class ConfigFrom < Docker::Internal::Type::BaseModel
        # @!attribute network
        #   The name of the config-only network that provides the network's configuration.
        #   The specified network must be an existing config-only network. Only network
        #   names are allowed, not network IDs.
        #
        #   @return [String, nil]
        optional :network, String, api_name: :Network

        # @!method initialize(network: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Network::ConfigFrom} for more details.
        #
        #   The config-only network source to provide the configuration for this network.
        #
        #   @param network [String] The name of the config-only network that provides the network's
      end

      # @see Docker::Models::Network#ipam
      class Ipam < Docker::Internal::Type::BaseModel
        # @!attribute config
        #   List of IPAM configuration options, specified as a map:
        #
        #   ```
        #   {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
        #   ```
        #
        #   @return [Array<Docker::Models::Network::Ipam::Config>, nil]
        optional :config,
                 -> {
                   Docker::Internal::Type::ArrayOf[Docker::Network::Ipam::Config]
                 },
                 api_name: :Config

        # @!attribute driver
        #   Name of the IPAM driver to use.
        #
        #   @return [String, nil]
        optional :driver, String, api_name: :Driver

        # @!attribute options
        #   Driver-specific options, specified as a map.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :options, Docker::Internal::Type::HashOf[String], api_name: :Options

        # @!method initialize(config: nil, driver: nil, options: nil)
        #   Some parameter documentations has been truncated, see
        #   {Docker::Models::Network::Ipam} for more details.
        #
        #   @param config [Array<Docker::Models::Network::Ipam::Config>] List of IPAM configuration options, specified as a map:
        #
        #   @param driver [String] Name of the IPAM driver to use.
        #
        #   @param options [Hash{Symbol=>String}] Driver-specific options, specified as a map.

        class Config < Docker::Internal::Type::BaseModel
          # @!attribute auxiliary_addresses
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :auxiliary_addresses, Docker::Internal::Type::HashOf[String], api_name: :AuxiliaryAddresses

          # @!attribute gateway
          #
          #   @return [String, nil]
          optional :gateway, String, api_name: :Gateway

          # @!attribute ip_range
          #
          #   @return [String, nil]
          optional :ip_range, String, api_name: :IPRange

          # @!attribute subnet
          #
          #   @return [String, nil]
          optional :subnet, String, api_name: :Subnet

          # @!method initialize(auxiliary_addresses: nil, gateway: nil, ip_range: nil, subnet: nil)
          #   @param auxiliary_addresses [Hash{Symbol=>String}]
          #   @param gateway [String]
          #   @param ip_range [String]
          #   @param subnet [String]
        end
      end

      class Peer < Docker::Internal::Type::BaseModel
        # @!attribute ip
        #   IP-address of the peer-node in the Swarm cluster.
        #
        #   @return [String, nil]
        optional :ip, String, api_name: :IP

        # @!attribute name
        #   ID of the peer-node in the Swarm cluster.
        #
        #   @return [String, nil]
        optional :name, String, api_name: :Name

        # @!method initialize(ip: nil, name: nil)
        #   represents one peer of an overlay network.
        #
        #   @param ip [String] IP-address of the peer-node in the Swarm cluster.
        #
        #   @param name [String] ID of the peer-node in the Swarm cluster.
      end
    end
  end
end
