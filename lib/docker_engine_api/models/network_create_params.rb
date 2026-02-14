# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Networks#create
    class NetworkCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute name
      #   The network's name.
      #
      #   @return [String]
      required :name, String, api_name: :Name

      # @!attribute attachable
      #   Globally scoped network is manually attachable by regular containers from
      #   workers in swarm mode.
      #
      #   @return [Boolean, nil]
      optional :attachable, DockerEngineAPI::Internal::Type::Boolean, api_name: :Attachable

      # @!attribute config_from
      #   The config-only network source to provide the configuration for this network.
      #
      #   @return [DockerEngineAPI::Models::NetworkCreateParams::ConfigFrom, nil]
      optional :config_from, -> { DockerEngineAPI::NetworkCreateParams::ConfigFrom }, api_name: :ConfigFrom

      # @!attribute config_only
      #   Creates a config-only network. Config-only networks are placeholder networks for
      #   network configurations to be used by other networks. Config-only networks cannot
      #   be used directly to run containers or services.
      #
      #   @return [Boolean, nil]
      optional :config_only, DockerEngineAPI::Internal::Type::Boolean, api_name: :ConfigOnly

      # @!attribute driver
      #   Name of the network driver plugin to use.
      #
      #   @return [String, nil]
      optional :driver, String, api_name: :Driver

      # @!attribute enable_i_pv4
      #   Enable IPv4 on the network.
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv4, DockerEngineAPI::Internal::Type::Boolean, api_name: :EnableIPv4

      # @!attribute enable_i_pv6
      #   Enable IPv6 on the network.
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv6, DockerEngineAPI::Internal::Type::Boolean, api_name: :EnableIPv6

      # @!attribute ingress
      #   Ingress network is the network which provides the routing-mesh in swarm mode.
      #
      #   @return [Boolean, nil]
      optional :ingress, DockerEngineAPI::Internal::Type::Boolean, api_name: :Ingress

      # @!attribute internal
      #   Restrict external access to the network.
      #
      #   @return [Boolean, nil]
      optional :internal, DockerEngineAPI::Internal::Type::Boolean, api_name: :Internal

      # @!attribute ipam
      #
      #   @return [DockerEngineAPI::Models::NetworkCreateParams::Ipam, nil]
      optional :ipam, -> { DockerEngineAPI::NetworkCreateParams::Ipam }, api_name: :IPAM

      # @!attribute labels
      #   User-defined key/value metadata.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, DockerEngineAPI::Internal::Type::HashOf[String], api_name: :Labels

      # @!attribute options
      #   Network specific options to be used by the drivers.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :options, DockerEngineAPI::Internal::Type::HashOf[String], api_name: :Options

      # @!attribute scope
      #   The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
      #   for machine level).
      #
      #   @return [String, nil]
      optional :scope, String, api_name: :Scope

      # @!method initialize(name:, attachable: nil, config_from: nil, config_only: nil, driver: nil, enable_i_pv4: nil, enable_i_pv6: nil, ingress: nil, internal: nil, ipam: nil, labels: nil, options: nil, scope: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::NetworkCreateParams} for more details.
      #
      #   @param name [String] The network's name.
      #
      #   @param attachable [Boolean] Globally scoped network is manually attachable by regular
      #
      #   @param config_from [DockerEngineAPI::Models::NetworkCreateParams::ConfigFrom] The config-only network source to provide the configuration for
      #
      #   @param config_only [Boolean] Creates a config-only network. Config-only networks are placeholder
      #
      #   @param driver [String] Name of the network driver plugin to use.
      #
      #   @param enable_i_pv4 [Boolean] Enable IPv4 on the network.
      #
      #   @param enable_i_pv6 [Boolean] Enable IPv6 on the network.
      #
      #   @param ingress [Boolean] Ingress network is the network which provides the routing-mesh
      #
      #   @param internal [Boolean] Restrict external access to the network.
      #
      #   @param ipam [DockerEngineAPI::Models::NetworkCreateParams::Ipam]
      #
      #   @param labels [Hash{Symbol=>String}] User-defined key/value metadata.
      #
      #   @param options [Hash{Symbol=>String}] Network specific options to be used by the drivers.
      #
      #   @param scope [String] The level at which the network exists (e.g. `swarm` for cluster-wide
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      class ConfigFrom < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute network
        #   The name of the config-only network that provides the network's configuration.
        #   The specified network must be an existing config-only network. Only network
        #   names are allowed, not network IDs.
        #
        #   @return [String, nil]
        optional :network, String, api_name: :Network

        # @!method initialize(network: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::NetworkCreateParams::ConfigFrom} for more details.
        #
        #   The config-only network source to provide the configuration for this network.
        #
        #   @param network [String] The name of the config-only network that provides the network's
      end

      class Ipam < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute config
        #   List of IPAM configuration options, specified as a map:
        #
        #   ```
        #   {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
        #   ```
        #
        #   @return [Array<DockerEngineAPI::Models::NetworkCreateParams::Ipam::Config>, nil]
        optional :config,
                 -> {
                   DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::NetworkCreateParams::Ipam::Config]
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
        optional :options, DockerEngineAPI::Internal::Type::HashOf[String], api_name: :Options

        # @!method initialize(config: nil, driver: nil, options: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineAPI::Models::NetworkCreateParams::Ipam} for more details.
        #
        #   @param config [Array<DockerEngineAPI::Models::NetworkCreateParams::Ipam::Config>] List of IPAM configuration options, specified as a map:
        #
        #   @param driver [String] Name of the IPAM driver to use.
        #
        #   @param options [Hash{Symbol=>String}] Driver-specific options, specified as a map.

        class Config < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute auxiliary_addresses
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :auxiliary_addresses,
                   DockerEngineAPI::Internal::Type::HashOf[String],
                   api_name: :AuxiliaryAddresses

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
    end
  end
end
