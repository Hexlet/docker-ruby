# typed: strong

module DockerEngineAPI
  module Models
    class NetworkCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::NetworkCreateParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The network's name.
      sig { returns(String) }
      attr_accessor :name

      # Globally scoped network is manually attachable by regular containers from
      # workers in swarm mode.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attachable

      sig { params(attachable: T::Boolean).void }
      attr_writer :attachable

      # The config-only network source to provide the configuration for this network.
      sig do
        returns(T.nilable(DockerEngineAPI::NetworkCreateParams::ConfigFrom))
      end
      attr_reader :config_from

      sig do
        params(
          config_from: DockerEngineAPI::NetworkCreateParams::ConfigFrom::OrHash
        ).void
      end
      attr_writer :config_from

      # Creates a config-only network. Config-only networks are placeholder networks for
      # network configurations to be used by other networks. Config-only networks cannot
      # be used directly to run containers or services.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :config_only

      sig { params(config_only: T::Boolean).void }
      attr_writer :config_only

      # Name of the network driver plugin to use.
      sig { returns(T.nilable(String)) }
      attr_reader :driver

      sig { params(driver: String).void }
      attr_writer :driver

      # Enable IPv4 on the network.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv4

      sig { params(enable_i_pv4: T::Boolean).void }
      attr_writer :enable_i_pv4

      # Enable IPv6 on the network.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv6

      sig { params(enable_i_pv6: T::Boolean).void }
      attr_writer :enable_i_pv6

      # Ingress network is the network which provides the routing-mesh in swarm mode.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ingress

      sig { params(ingress: T::Boolean).void }
      attr_writer :ingress

      # Restrict external access to the network.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internal

      sig { params(internal: T::Boolean).void }
      attr_writer :internal

      sig { returns(T.nilable(DockerEngineAPI::NetworkCreateParams::Ipam)) }
      attr_reader :ipam

      sig do
        params(ipam: DockerEngineAPI::NetworkCreateParams::Ipam::OrHash).void
      end
      attr_writer :ipam

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Network specific options to be used by the drivers.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :options

      sig { params(options: T::Hash[Symbol, String]).void }
      attr_writer :options

      # The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
      # for machine level).
      sig { returns(T.nilable(String)) }
      attr_reader :scope

      sig { params(scope: String).void }
      attr_writer :scope

      sig do
        params(
          name: String,
          attachable: T::Boolean,
          config_from: DockerEngineAPI::NetworkCreateParams::ConfigFrom::OrHash,
          config_only: T::Boolean,
          driver: String,
          enable_i_pv4: T::Boolean,
          enable_i_pv6: T::Boolean,
          ingress: T::Boolean,
          internal: T::Boolean,
          ipam: DockerEngineAPI::NetworkCreateParams::Ipam::OrHash,
          labels: T::Hash[Symbol, String],
          options: T::Hash[Symbol, String],
          scope: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The network's name.
        name:,
        # Globally scoped network is manually attachable by regular containers from
        # workers in swarm mode.
        attachable: nil,
        # The config-only network source to provide the configuration for this network.
        config_from: nil,
        # Creates a config-only network. Config-only networks are placeholder networks for
        # network configurations to be used by other networks. Config-only networks cannot
        # be used directly to run containers or services.
        config_only: nil,
        # Name of the network driver plugin to use.
        driver: nil,
        # Enable IPv4 on the network.
        enable_i_pv4: nil,
        # Enable IPv6 on the network.
        enable_i_pv6: nil,
        # Ingress network is the network which provides the routing-mesh in swarm mode.
        ingress: nil,
        # Restrict external access to the network.
        internal: nil,
        ipam: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Network specific options to be used by the drivers.
        options: nil,
        # The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
        # for machine level).
        scope: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            attachable: T::Boolean,
            config_from: DockerEngineAPI::NetworkCreateParams::ConfigFrom,
            config_only: T::Boolean,
            driver: String,
            enable_i_pv4: T::Boolean,
            enable_i_pv6: T::Boolean,
            ingress: T::Boolean,
            internal: T::Boolean,
            ipam: DockerEngineAPI::NetworkCreateParams::Ipam,
            labels: T::Hash[Symbol, String],
            options: T::Hash[Symbol, String],
            scope: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ConfigFrom < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::NetworkCreateParams::ConfigFrom,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # The name of the config-only network that provides the network's configuration.
        # The specified network must be an existing config-only network. Only network
        # names are allowed, not network IDs.
        sig { returns(T.nilable(String)) }
        attr_reader :network

        sig { params(network: String).void }
        attr_writer :network

        # The config-only network source to provide the configuration for this network.
        sig { params(network: String).returns(T.attached_class) }
        def self.new(
          # The name of the config-only network that provides the network's configuration.
          # The specified network must be an existing config-only network. Only network
          # names are allowed, not network IDs.
          network: nil
        )
        end

        sig { override.returns({ network: String }) }
        def to_hash
        end
      end

      class Ipam < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::NetworkCreateParams::Ipam,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # List of IPAM configuration options, specified as a map:
        #
        # ```
        # {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
        # ```
        sig do
          returns(
            T.nilable(
              T::Array[DockerEngineAPI::NetworkCreateParams::Ipam::Config]
            )
          )
        end
        attr_reader :config

        sig do
          params(
            config:
              T::Array[
                DockerEngineAPI::NetworkCreateParams::Ipam::Config::OrHash
              ]
          ).void
        end
        attr_writer :config

        # Name of the IPAM driver to use.
        sig { returns(T.nilable(String)) }
        attr_reader :driver

        sig { params(driver: String).void }
        attr_writer :driver

        # Driver-specific options, specified as a map.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :options

        sig { params(options: T::Hash[Symbol, String]).void }
        attr_writer :options

        sig do
          params(
            config:
              T::Array[
                DockerEngineAPI::NetworkCreateParams::Ipam::Config::OrHash
              ],
            driver: String,
            options: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # List of IPAM configuration options, specified as a map:
          #
          # ```
          # {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
          # ```
          config: nil,
          # Name of the IPAM driver to use.
          driver: nil,
          # Driver-specific options, specified as a map.
          options: nil
        )
        end

        sig do
          override.returns(
            {
              config:
                T::Array[DockerEngineAPI::NetworkCreateParams::Ipam::Config],
              driver: String,
              options: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end

        class Config < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::NetworkCreateParams::Ipam::Config,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :auxiliary_addresses

          sig { params(auxiliary_addresses: T::Hash[Symbol, String]).void }
          attr_writer :auxiliary_addresses

          sig { returns(T.nilable(String)) }
          attr_reader :gateway

          sig { params(gateway: String).void }
          attr_writer :gateway

          sig { returns(T.nilable(String)) }
          attr_reader :ip_range

          sig { params(ip_range: String).void }
          attr_writer :ip_range

          sig { returns(T.nilable(String)) }
          attr_reader :subnet

          sig { params(subnet: String).void }
          attr_writer :subnet

          sig do
            params(
              auxiliary_addresses: T::Hash[Symbol, String],
              gateway: String,
              ip_range: String,
              subnet: String
            ).returns(T.attached_class)
          end
          def self.new(
            auxiliary_addresses: nil,
            gateway: nil,
            ip_range: nil,
            subnet: nil
          )
          end

          sig do
            override.returns(
              {
                auxiliary_addresses: T::Hash[Symbol, String],
                gateway: String,
                ip_range: String,
                subnet: String
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
