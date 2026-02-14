# typed: strong

module DockerEngineAPI
  module Models
    class Network < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineAPI::Network, DockerEngineAPI::Internal::AnyHash)
        end

      # Whether a global / swarm scope network is manually attachable by regular
      # containers from workers in swarm mode.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attachable

      sig { params(attachable: T::Boolean).void }
      attr_writer :attachable

      # The config-only network source to provide the configuration for this network.
      sig { returns(T.nilable(DockerEngineAPI::Network::ConfigFrom)) }
      attr_reader :config_from

      sig do
        params(config_from: DockerEngineAPI::Network::ConfigFrom::OrHash).void
      end
      attr_writer :config_from

      # Whether the network is a config-only network. Config-only networks are
      # placeholder networks for network configurations to be used by other networks.
      # Config-only networks cannot be used directly to run containers or services.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :config_only

      sig { params(config_only: T::Boolean).void }
      attr_writer :config_only

      # Date and time at which the network was created in
      # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
      sig { returns(T.nilable(String)) }
      attr_reader :created

      sig { params(created: String).void }
      attr_writer :created

      # The name of the driver used to create the network (e.g. `bridge`, `overlay`).
      sig { returns(T.nilable(String)) }
      attr_reader :driver

      sig { params(driver: String).void }
      attr_writer :driver

      # Whether the network was created with IPv4 enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv4

      sig { params(enable_i_pv4: T::Boolean).void }
      attr_writer :enable_i_pv4

      # Whether the network was created with IPv6 enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv6

      sig { params(enable_i_pv6: T::Boolean).void }
      attr_writer :enable_i_pv6

      # ID that uniquely identifies a network on a single machine.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Whether the network is providing the routing-mesh for the swarm cluster.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ingress

      sig { params(ingress: T::Boolean).void }
      attr_writer :ingress

      # Whether the network is created to only allow internal networking connectivity.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internal

      sig { params(internal: T::Boolean).void }
      attr_writer :internal

      sig { returns(T.nilable(DockerEngineAPI::Network::Ipam)) }
      attr_reader :ipam

      sig { params(ipam: DockerEngineAPI::Network::Ipam::OrHash).void }
      attr_writer :ipam

      # Metadata specific to the network being created.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Name of the network.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Network-specific options uses when creating the network.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :options

      sig { params(options: T::Hash[Symbol, String]).void }
      attr_writer :options

      # List of peer nodes for an overlay network. This field is only present for
      # overlay networks, and omitted for other network types.
      sig { returns(T.nilable(T::Array[DockerEngineAPI::Network::Peer])) }
      attr_reader :peers

      sig do
        params(peers: T::Array[DockerEngineAPI::Network::Peer::OrHash]).void
      end
      attr_writer :peers

      # The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
      # for machine level)
      sig { returns(T.nilable(String)) }
      attr_reader :scope

      sig { params(scope: String).void }
      attr_writer :scope

      sig do
        params(
          attachable: T::Boolean,
          config_from: DockerEngineAPI::Network::ConfigFrom::OrHash,
          config_only: T::Boolean,
          created: String,
          driver: String,
          enable_i_pv4: T::Boolean,
          enable_i_pv6: T::Boolean,
          id: String,
          ingress: T::Boolean,
          internal: T::Boolean,
          ipam: DockerEngineAPI::Network::Ipam::OrHash,
          labels: T::Hash[Symbol, String],
          name: String,
          options: T::Hash[Symbol, String],
          peers: T::Array[DockerEngineAPI::Network::Peer::OrHash],
          scope: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether a global / swarm scope network is manually attachable by regular
        # containers from workers in swarm mode.
        attachable: nil,
        # The config-only network source to provide the configuration for this network.
        config_from: nil,
        # Whether the network is a config-only network. Config-only networks are
        # placeholder networks for network configurations to be used by other networks.
        # Config-only networks cannot be used directly to run containers or services.
        config_only: nil,
        # Date and time at which the network was created in
        # [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format with nano-seconds.
        created: nil,
        # The name of the driver used to create the network (e.g. `bridge`, `overlay`).
        driver: nil,
        # Whether the network was created with IPv4 enabled.
        enable_i_pv4: nil,
        # Whether the network was created with IPv6 enabled.
        enable_i_pv6: nil,
        # ID that uniquely identifies a network on a single machine.
        id: nil,
        # Whether the network is providing the routing-mesh for the swarm cluster.
        ingress: nil,
        # Whether the network is created to only allow internal networking connectivity.
        internal: nil,
        ipam: nil,
        # Metadata specific to the network being created.
        labels: nil,
        # Name of the network.
        name: nil,
        # Network-specific options uses when creating the network.
        options: nil,
        # List of peer nodes for an overlay network. This field is only present for
        # overlay networks, and omitted for other network types.
        peers: nil,
        # The level at which the network exists (e.g. `swarm` for cluster-wide or `local`
        # for machine level)
        scope: nil
      )
      end

      sig do
        override.returns(
          {
            attachable: T::Boolean,
            config_from: DockerEngineAPI::Network::ConfigFrom,
            config_only: T::Boolean,
            created: String,
            driver: String,
            enable_i_pv4: T::Boolean,
            enable_i_pv6: T::Boolean,
            id: String,
            ingress: T::Boolean,
            internal: T::Boolean,
            ipam: DockerEngineAPI::Network::Ipam,
            labels: T::Hash[Symbol, String],
            name: String,
            options: T::Hash[Symbol, String],
            peers: T::Array[DockerEngineAPI::Network::Peer],
            scope: String
          }
        )
      end
      def to_hash
      end

      class ConfigFrom < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Network::ConfigFrom,
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
              DockerEngineAPI::Network::Ipam,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # List of IPAM configuration options, specified as a map:
        #
        # ```
        # {"Subnet": <CIDR>, "IPRange": <CIDR>, "Gateway": <IP address>, "AuxAddress": <device_name:IP address>}
        # ```
        sig do
          returns(T.nilable(T::Array[DockerEngineAPI::Network::Ipam::Config]))
        end
        attr_reader :config

        sig do
          params(
            config: T::Array[DockerEngineAPI::Network::Ipam::Config::OrHash]
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
            config: T::Array[DockerEngineAPI::Network::Ipam::Config::OrHash],
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
              config: T::Array[DockerEngineAPI::Network::Ipam::Config],
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
                DockerEngineAPI::Network::Ipam::Config,
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

      class Peer < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Network::Peer,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # IP-address of the peer-node in the Swarm cluster.
        sig { returns(T.nilable(String)) }
        attr_reader :ip

        sig { params(ip: String).void }
        attr_writer :ip

        # ID of the peer-node in the Swarm cluster.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # represents one peer of an overlay network.
        sig { params(ip: String, name: String).returns(T.attached_class) }
        def self.new(
          # IP-address of the peer-node in the Swarm cluster.
          ip: nil,
          # ID of the peer-node in the Swarm cluster.
          name: nil
        )
        end

        sig { override.returns({ ip: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
