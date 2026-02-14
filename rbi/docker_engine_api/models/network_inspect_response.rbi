# typed: strong

module DockerEngineAPI
  module Models
    class NetworkInspectResponse < DockerEngineAPI::Models::Network
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::Models::NetworkInspectResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Contains endpoints attached to the network.
      sig do
        returns(
          T.nilable(
            T::Hash[
              Symbol,
              DockerEngineAPI::Models::NetworkInspectResponse::Container
            ]
          )
        )
      end
      attr_reader :containers

      sig do
        params(
          containers:
            T::Hash[
              Symbol,
              DockerEngineAPI::Models::NetworkInspectResponse::Container::OrHash
            ]
        ).void
      end
      attr_writer :containers

      # List of services using the network. This field is only present for swarm scope
      # networks, and omitted for local scope networks.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :services

      sig { params(services: T::Hash[Symbol, T.anything]).void }
      attr_writer :services

      # provides runtime information about the network such as the number of allocated
      # IPs.
      sig do
        returns(
          T.nilable(DockerEngineAPI::Models::NetworkInspectResponse::Status)
        )
      end
      attr_reader :status

      sig do
        params(
          status:
            DockerEngineAPI::Models::NetworkInspectResponse::Status::OrHash
        ).void
      end
      attr_writer :status

      # The body of the "get network" http response message.
      sig do
        params(
          containers:
            T::Hash[
              Symbol,
              DockerEngineAPI::Models::NetworkInspectResponse::Container::OrHash
            ],
          services: T::Hash[Symbol, T.anything],
          status:
            DockerEngineAPI::Models::NetworkInspectResponse::Status::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Contains endpoints attached to the network.
        containers: nil,
        # List of services using the network. This field is only present for swarm scope
        # networks, and omitted for local scope networks.
        services: nil,
        # provides runtime information about the network such as the number of allocated
        # IPs.
        status: nil
      )
      end

      sig do
        override.returns(
          {
            containers:
              T::Hash[
                Symbol,
                DockerEngineAPI::Models::NetworkInspectResponse::Container
              ],
            services: T::Hash[Symbol, T.anything],
            status: DockerEngineAPI::Models::NetworkInspectResponse::Status
          }
        )
      end
      def to_hash
      end

      class Container < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::NetworkInspectResponse::Container,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :endpoint_id

        sig { params(endpoint_id: String).void }
        attr_writer :endpoint_id

        sig { returns(T.nilable(String)) }
        attr_reader :i_pv4_address

        sig { params(i_pv4_address: String).void }
        attr_writer :i_pv4_address

        sig { returns(T.nilable(String)) }
        attr_reader :i_pv6_address

        sig { params(i_pv6_address: String).void }
        attr_writer :i_pv6_address

        sig { returns(T.nilable(String)) }
        attr_reader :mac_address

        sig { params(mac_address: String).void }
        attr_writer :mac_address

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # contains network resources allocated and used for a container in a network.
        sig do
          params(
            endpoint_id: String,
            i_pv4_address: String,
            i_pv6_address: String,
            mac_address: String,
            name: String
          ).returns(T.attached_class)
        end
        def self.new(
          endpoint_id: nil,
          i_pv4_address: nil,
          i_pv6_address: nil,
          mac_address: nil,
          name: nil
        )
        end

        sig do
          override.returns(
            {
              endpoint_id: String,
              i_pv4_address: String,
              i_pv6_address: String,
              mac_address: String,
              name: String
            }
          )
        end
        def to_hash
        end
      end

      class Status < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::NetworkInspectResponse::Status,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam
            )
          )
        end
        attr_reader :ipam

        sig do
          params(
            ipam:
              DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::OrHash
          ).void
        end
        attr_writer :ipam

        # provides runtime information about the network such as the number of allocated
        # IPs.
        sig do
          params(
            ipam:
              DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::OrHash
          ).returns(T.attached_class)
        end
        def self.new(ipam: nil)
        end

        sig do
          override.returns(
            {
              ipam:
                DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam
            }
          )
        end
        def to_hash
        end

        class Ipam < DockerEngineAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam,
                DockerEngineAPI::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet
                ]
              )
            )
          end
          attr_reader :subnets

          sig do
            params(
              subnets:
                T::Hash[
                  Symbol,
                  DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet::OrHash
                ]
            ).void
          end
          attr_writer :subnets

          sig do
            params(
              subnets:
                T::Hash[
                  Symbol,
                  DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(subnets: nil)
          end

          sig do
            override.returns(
              {
                subnets:
                  T::Hash[
                    Symbol,
                    DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet
                  ]
              }
            )
          end
          def to_hash
          end

          class Subnet < DockerEngineAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet,
                  DockerEngineAPI::Internal::AnyHash
                )
              end

            # Number of IP addresses within the network's IPRange for the subnet that are
            # available for allocation, saturating at 2<sup>64</sup> - 1.
            sig { returns(T.nilable(Integer)) }
            attr_reader :dynamic_ips_available

            sig { params(dynamic_ips_available: Integer).void }
            attr_writer :dynamic_ips_available

            # Number of IP addresses in the subnet that are in use or reserved and are
            # therefore unavailable for allocation, saturating at 2<sup>64</sup> - 1.
            sig { returns(T.nilable(Integer)) }
            attr_reader :ips_in_use

            sig { params(ips_in_use: Integer).void }
            attr_writer :ips_in_use

            sig do
              params(
                dynamic_ips_available: Integer,
                ips_in_use: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Number of IP addresses within the network's IPRange for the subnet that are
              # available for allocation, saturating at 2<sup>64</sup> - 1.
              dynamic_ips_available: nil,
              # Number of IP addresses in the subnet that are in use or reserved and are
              # therefore unavailable for allocation, saturating at 2<sup>64</sup> - 1.
              ips_in_use: nil
            )
            end

            sig do
              override.returns(
                { dynamic_ips_available: Integer, ips_in_use: Integer }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
