# typed: strong

module DockerEngineRuby
  module Models
    class NetworkCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NetworkCreateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attachable

      sig { params(attachable: T::Boolean).void }
      attr_writer :attachable

      # The config-only network source to provide the configuration for this network.
      sig do
        returns(T.nilable(DockerEngineRuby::NetworkCreateParams::ConfigFrom))
      end
      attr_reader :config_from

      sig do
        params(
          config_from: DockerEngineRuby::NetworkCreateParams::ConfigFrom::OrHash
        ).void
      end
      attr_writer :config_from

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :config_only

      sig { params(config_only: T::Boolean).void }
      attr_writer :config_only

      sig { returns(T.nilable(String)) }
      attr_reader :driver

      sig { params(driver: String).void }
      attr_writer :driver

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv4

      sig { params(enable_i_pv4: T::Boolean).void }
      attr_writer :enable_i_pv4

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_i_pv6

      sig { params(enable_i_pv6: T::Boolean).void }
      attr_writer :enable_i_pv6

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ingress

      sig { params(ingress: T::Boolean).void }
      attr_writer :ingress

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :internal

      sig { params(internal: T::Boolean).void }
      attr_writer :internal

      sig { returns(T.nilable(DockerEngineRuby::NetworkCreateParams::Ipam)) }
      attr_reader :ipam

      sig do
        params(ipam: DockerEngineRuby::NetworkCreateParams::Ipam::OrHash).void
      end
      attr_writer :ipam

      sig { returns(T.nilable(T.anything)) }
      attr_reader :labels

      sig { params(labels: T.anything).void }
      attr_writer :labels

      sig { returns(T.nilable(T.anything)) }
      attr_reader :options

      sig { params(options: T.anything).void }
      attr_writer :options

      sig { returns(T.nilable(String)) }
      attr_reader :scope

      sig { params(scope: String).void }
      attr_writer :scope

      sig do
        params(
          name: String,
          attachable: T::Boolean,
          config_from:
            DockerEngineRuby::NetworkCreateParams::ConfigFrom::OrHash,
          config_only: T::Boolean,
          driver: String,
          enable_i_pv4: T::Boolean,
          enable_i_pv6: T::Boolean,
          ingress: T::Boolean,
          internal: T::Boolean,
          ipam: DockerEngineRuby::NetworkCreateParams::Ipam::OrHash,
          labels: T.anything,
          options: T.anything,
          scope: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        attachable: nil,
        # The config-only network source to provide the configuration for this network.
        config_from: nil,
        config_only: nil,
        driver: nil,
        enable_i_pv4: nil,
        enable_i_pv6: nil,
        ingress: nil,
        internal: nil,
        ipam: nil,
        labels: nil,
        options: nil,
        scope: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            attachable: T::Boolean,
            config_from: DockerEngineRuby::NetworkCreateParams::ConfigFrom,
            config_only: T::Boolean,
            driver: String,
            enable_i_pv4: T::Boolean,
            enable_i_pv6: T::Boolean,
            ingress: T::Boolean,
            internal: T::Boolean,
            ipam: DockerEngineRuby::NetworkCreateParams::Ipam,
            labels: T.anything,
            options: T.anything,
            scope: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ConfigFrom < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::NetworkCreateParams::ConfigFrom,
              DockerEngineRuby::Internal::AnyHash
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

      class Ipam < DockerEngineRuby::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineRuby::NetworkCreateParams::Ipam,
              DockerEngineRuby::Internal::AnyHash
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
              T::Array[DockerEngineRuby::NetworkCreateParams::Ipam::Config]
            )
          )
        end
        attr_reader :config

        sig do
          params(
            config:
              T::Array[
                DockerEngineRuby::NetworkCreateParams::Ipam::Config::OrHash
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
        sig { returns(T.nilable(T.anything)) }
        attr_reader :options

        sig { params(options: T.anything).void }
        attr_writer :options

        sig do
          params(
            config:
              T::Array[
                DockerEngineRuby::NetworkCreateParams::Ipam::Config::OrHash
              ],
            driver: String,
            options: T.anything
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
                T::Array[DockerEngineRuby::NetworkCreateParams::Ipam::Config],
              driver: String,
              options: T.anything
            }
          )
        end
        def to_hash
        end

        class Config < DockerEngineRuby::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineRuby::NetworkCreateParams::Ipam::Config,
                DockerEngineRuby::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T.anything)) }
          attr_reader :auxiliary_addresses

          sig { params(auxiliary_addresses: T.anything).void }
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
              auxiliary_addresses: T.anything,
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
                auxiliary_addresses: T.anything,
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
