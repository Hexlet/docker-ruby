# typed: strong

module DockerEngineRuby
  module Models
    class ConnectRequest < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ConnectRequest,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # The ID or name of the container to connect to the network.
      sig { returns(String) }
      attr_accessor :container

      # Configuration for a network endpoint.
      sig do
        returns(T.nilable(DockerEngineRuby::ConnectRequest::EndpointConfig))
      end
      attr_reader :endpoint_config

      sig do
        params(
          endpoint_config:
            T.nilable(DockerEngineRuby::ConnectRequest::EndpointConfig::OrHash)
        ).void
      end
      attr_writer :endpoint_config

      # NetworkConnectRequest represents the data to be used to connect a container to a
      # network.
      sig do
        params(
          container: String,
          endpoint_config:
            T.nilable(DockerEngineRuby::ConnectRequest::EndpointConfig::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID or name of the container to connect to the network.
        container:,
        # Configuration for a network endpoint.
        endpoint_config: nil
      )
      end

      sig do
        override.returns(
          {
            container: String,
            endpoint_config:
              T.nilable(DockerEngineRuby::ConnectRequest::EndpointConfig)
          }
        )
      end
      def to_hash
      end

      class EndpointConfig < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::ConnectRequest::EndpointConfig,
              DockerEngineRuby::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :aliases

        sig { params(aliases: T::Array[String]).void }
        attr_writer :aliases

        # List of all DNS names an endpoint has on a specific network. This list is based
        # on the container name, network aliases, container short ID, and hostname.
        #
        # These DNS names are non-fully qualified but can contain several dots. You can
        # get fully qualified DNS names by appending `.<network-name>`. For instance, if
        # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
        # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :dns_names

        sig { params(dns_names: T::Array[String]).void }
        attr_writer :dns_names

        # DriverOpts is a mapping of driver options and values. These options are passed
        # directly to the driver and are driver specific.
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :driver_opts

        # Unique ID for the service endpoint in a Sandbox.
        sig { returns(T.nilable(String)) }
        attr_reader :endpoint_id

        sig { params(endpoint_id: String).void }
        attr_writer :endpoint_id

        # Gateway address for this network.
        sig { returns(T.nilable(String)) }
        attr_reader :gateway

        sig { params(gateway: String).void }
        attr_writer :gateway

        # Global IPv6 address.
        sig { returns(T.nilable(String)) }
        attr_reader :global_i_pv6_address

        sig { params(global_i_pv6_address: String).void }
        attr_writer :global_i_pv6_address

        # Mask length of the global IPv6 address.
        sig { returns(T.nilable(Integer)) }
        attr_reader :global_i_pv6_prefix_len

        sig { params(global_i_pv6_prefix_len: Integer).void }
        attr_writer :global_i_pv6_prefix_len

        # This property determines which endpoint will provide the default gateway for a
        # container. The endpoint with the highest priority will be used. If multiple
        # endpoints have the same priority, endpoints are lexicographically sorted based
        # on their network name, and the one that sorts first is picked.
        sig { returns(T.nilable(Integer)) }
        attr_reader :gw_priority

        sig { params(gw_priority: Integer).void }
        attr_writer :gw_priority

        # IPv4 address.
        sig { returns(T.nilable(String)) }
        attr_reader :ip_address

        sig { params(ip_address: String).void }
        attr_writer :ip_address

        # EndpointIPAMConfig represents an endpoint's IPAM configuration.
        sig do
          returns(
            T.nilable(
              DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig
            )
          )
        end
        attr_reader :ipam_config

        sig do
          params(
            ipam_config:
              DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig::OrHash
          ).void
        end
        attr_writer :ipam_config

        # Mask length of the IPv4 address.
        sig { returns(T.nilable(Integer)) }
        attr_reader :ip_prefix_len

        sig { params(ip_prefix_len: Integer).void }
        attr_writer :ip_prefix_len

        # IPv6 gateway address.
        sig { returns(T.nilable(String)) }
        attr_reader :i_pv6_gateway

        sig { params(i_pv6_gateway: String).void }
        attr_writer :i_pv6_gateway

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :links

        sig { params(links: T::Array[String]).void }
        attr_writer :links

        # MAC address for the endpoint on this network. The network driver might ignore
        # this parameter.
        sig { returns(T.nilable(String)) }
        attr_reader :mac_address

        sig { params(mac_address: String).void }
        attr_writer :mac_address

        # Unique ID of the network.
        sig { returns(T.nilable(String)) }
        attr_reader :network_id

        sig { params(network_id: String).void }
        attr_writer :network_id

        # Configuration for a network endpoint.
        sig do
          params(
            aliases: T::Array[String],
            dns_names: T::Array[String],
            driver_opts: T.nilable(T.anything),
            endpoint_id: String,
            gateway: String,
            global_i_pv6_address: String,
            global_i_pv6_prefix_len: Integer,
            gw_priority: Integer,
            ip_address: String,
            ipam_config:
              DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig::OrHash,
            ip_prefix_len: Integer,
            i_pv6_gateway: String,
            links: T::Array[String],
            mac_address: String,
            network_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          aliases: nil,
          # List of all DNS names an endpoint has on a specific network. This list is based
          # on the container name, network aliases, container short ID, and hostname.
          #
          # These DNS names are non-fully qualified but can contain several dots. You can
          # get fully qualified DNS names by appending `.<network-name>`. For instance, if
          # container name is `my.ctr` and the network is named `testnet`, `DNSNames` will
          # contain `my.ctr` and the FQDN will be `my.ctr.testnet`.
          dns_names: nil,
          # DriverOpts is a mapping of driver options and values. These options are passed
          # directly to the driver and are driver specific.
          driver_opts: nil,
          # Unique ID for the service endpoint in a Sandbox.
          endpoint_id: nil,
          # Gateway address for this network.
          gateway: nil,
          # Global IPv6 address.
          global_i_pv6_address: nil,
          # Mask length of the global IPv6 address.
          global_i_pv6_prefix_len: nil,
          # This property determines which endpoint will provide the default gateway for a
          # container. The endpoint with the highest priority will be used. If multiple
          # endpoints have the same priority, endpoints are lexicographically sorted based
          # on their network name, and the one that sorts first is picked.
          gw_priority: nil,
          # IPv4 address.
          ip_address: nil,
          # EndpointIPAMConfig represents an endpoint's IPAM configuration.
          ipam_config: nil,
          # Mask length of the IPv4 address.
          ip_prefix_len: nil,
          # IPv6 gateway address.
          i_pv6_gateway: nil,
          links: nil,
          # MAC address for the endpoint on this network. The network driver might ignore
          # this parameter.
          mac_address: nil,
          # Unique ID of the network.
          network_id: nil
        )
        end

        sig do
          override.returns(
            {
              aliases: T::Array[String],
              dns_names: T::Array[String],
              driver_opts: T.nilable(T.anything),
              endpoint_id: String,
              gateway: String,
              global_i_pv6_address: String,
              global_i_pv6_prefix_len: Integer,
              gw_priority: Integer,
              ip_address: String,
              ipam_config:
                DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig,
              ip_prefix_len: Integer,
              i_pv6_gateway: String,
              links: T::Array[String],
              mac_address: String,
              network_id: String
            }
          )
        end
        def to_hash
        end

        class IpamConfig < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::ConnectRequest::EndpointConfig::IpamConfig,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :i_pv4_address

          sig { params(i_pv4_address: String).void }
          attr_writer :i_pv4_address

          sig { returns(T.nilable(String)) }
          attr_reader :i_pv6_address

          sig { params(i_pv6_address: String).void }
          attr_writer :i_pv6_address

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :link_local_ips

          sig { params(link_local_ips: T::Array[String]).void }
          attr_writer :link_local_ips

          # EndpointIPAMConfig represents an endpoint's IPAM configuration.
          sig do
            params(
              i_pv4_address: String,
              i_pv6_address: String,
              link_local_ips: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            i_pv4_address: nil,
            i_pv6_address: nil,
            link_local_ips: nil
          )
          end

          sig do
            override.returns(
              {
                i_pv4_address: String,
                i_pv6_address: String,
                link_local_ips: T::Array[String]
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
