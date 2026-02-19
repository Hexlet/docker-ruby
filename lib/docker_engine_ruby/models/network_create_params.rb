# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#create
    class NetworkCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String, api_name: :Name

      # @!attribute attachable
      #
      #   @return [Boolean, nil]
      optional :attachable, DockerEngineRuby::Internal::Type::Boolean, api_name: :Attachable

      # @!attribute config_from
      #   The config-only network source to provide the configuration for this network.
      #
      #   @return [DockerEngineRuby::Models::NetworkCreateParams::ConfigFrom, nil]
      optional :config_from, -> { DockerEngineRuby::NetworkCreateParams::ConfigFrom }, api_name: :ConfigFrom

      # @!attribute config_only
      #
      #   @return [Boolean, nil]
      optional :config_only, DockerEngineRuby::Internal::Type::Boolean, api_name: :ConfigOnly

      # @!attribute driver
      #
      #   @return [String, nil]
      optional :driver, String, api_name: :Driver

      # @!attribute enable_i_pv4
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv4, DockerEngineRuby::Internal::Type::Boolean, api_name: :EnableIPv4

      # @!attribute enable_i_pv6
      #
      #   @return [Boolean, nil]
      optional :enable_i_pv6, DockerEngineRuby::Internal::Type::Boolean, api_name: :EnableIPv6

      # @!attribute ingress
      #
      #   @return [Boolean, nil]
      optional :ingress, DockerEngineRuby::Internal::Type::Boolean, api_name: :Ingress

      # @!attribute internal
      #
      #   @return [Boolean, nil]
      optional :internal, DockerEngineRuby::Internal::Type::Boolean, api_name: :Internal

      # @!attribute ipam
      #
      #   @return [DockerEngineRuby::Models::NetworkCreateParams::Ipam, nil]
      optional :ipam, -> { DockerEngineRuby::NetworkCreateParams::Ipam }, api_name: :IPAM

      # @!attribute labels
      #
      #   @return [Object, nil]
      optional :labels, DockerEngineRuby::Internal::Type::Unknown, api_name: :Labels

      # @!attribute options
      #
      #   @return [Object, nil]
      optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

      # @!attribute scope
      #
      #   @return [String, nil]
      optional :scope, String, api_name: :Scope

      # @!method initialize(name:, attachable: nil, config_from: nil, config_only: nil, driver: nil, enable_i_pv4: nil, enable_i_pv6: nil, ingress: nil, internal: nil, ipam: nil, labels: nil, options: nil, scope: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::NetworkCreateParams} for more details.
      #
      #   @param name [String]
      #
      #   @param attachable [Boolean]
      #
      #   @param config_from [DockerEngineRuby::Models::NetworkCreateParams::ConfigFrom] The config-only network source to provide the configuration for
      #
      #   @param config_only [Boolean]
      #
      #   @param driver [String]
      #
      #   @param enable_i_pv4 [Boolean]
      #
      #   @param enable_i_pv6 [Boolean]
      #
      #   @param ingress [Boolean]
      #
      #   @param internal [Boolean]
      #
      #   @param ipam [DockerEngineRuby::Models::NetworkCreateParams::Ipam]
      #
      #   @param labels [Object]
      #
      #   @param options [Object]
      #
      #   @param scope [String]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      class ConfigFrom < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute network
        #   The name of the config-only network that provides the network's configuration.
        #   The specified network must be an existing config-only network. Only network
        #   names are allowed, not network IDs.
        #
        #   @return [String, nil]
        optional :network, String, api_name: :Network

        # @!method initialize(network: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::NetworkCreateParams::ConfigFrom} for more details.
        #
        #   The config-only network source to provide the configuration for this network.
        #
        #   @param network [String] The name of the config-only network that provides the network's
      end

      class Ipam < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute config
        #   List of IPAM configuration options, specified as a map:
        #
        #   ```
        #   {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
        #   ```
        #
        #   @return [Array<DockerEngineRuby::Models::NetworkCreateParams::Ipam::Config>, nil]
        optional :config,
                 -> {
                   DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::NetworkCreateParams::Ipam::Config]
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
        #   @return [Object, nil]
        optional :options, DockerEngineRuby::Internal::Type::Unknown, api_name: :Options

        # @!method initialize(config: nil, driver: nil, options: nil)
        #   Some parameter documentations has been truncated, see
        #   {DockerEngineRuby::Models::NetworkCreateParams::Ipam} for more details.
        #
        #   @param config [Array<DockerEngineRuby::Models::NetworkCreateParams::Ipam::Config>] List of IPAM configuration options, specified as a map:
        #
        #   @param driver [String] Name of the IPAM driver to use.
        #
        #   @param options [Object] Driver-specific options, specified as a map.

        class Config < DockerEngineRuby::Internal::Type::BaseModel
          # @!attribute auxiliary_addresses
          #
          #   @return [Object, nil]
          optional :auxiliary_addresses,
                   DockerEngineRuby::Internal::Type::Unknown,
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
          #   @param auxiliary_addresses [Object]
          #   @param gateway [String]
          #   @param ip_range [String]
          #   @param subnet [String]
        end
      end
    end
  end
end
