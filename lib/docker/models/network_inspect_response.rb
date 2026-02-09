# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Networks#inspect_
    class NetworkInspectResponse < Docker::Models::Network
      # @!attribute containers
      #   Contains endpoints attached to the network.
      #
      #   @return [Hash{Symbol=>Docker::Models::NetworkInspectResponse::Container}, nil]
      optional :containers,
               -> { Docker::Internal::Type::HashOf[Docker::Models::NetworkInspectResponse::Container] },
               api_name: :Containers

      # @!attribute services
      #   List of services using the network. This field is only present for swarm scope
      #   networks, and omitted for local scope networks.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :services, Docker::Internal::Type::HashOf[Docker::Internal::Type::Unknown], api_name: :Services

      # @!attribute status
      #   provides runtime information about the network such as the number of allocated
      #   IPs.
      #
      #   @return [Docker::Models::NetworkInspectResponse::Status, nil]
      optional :status, -> { Docker::Models::NetworkInspectResponse::Status }, api_name: :Status

      # @!method initialize(containers: nil, services: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::NetworkInspectResponse} for more details.
      #
      #   The body of the "get network" http response message.
      #
      #   @param containers [Hash{Symbol=>Docker::Models::NetworkInspectResponse::Container}] Contains endpoints attached to the network.
      #
      #   @param services [Hash{Symbol=>Object}] List of services using the network. This field is only present for
      #
      #   @param status [Docker::Models::NetworkInspectResponse::Status] provides runtime information about the network such as the number of allocated I

      class Container < Docker::Internal::Type::BaseModel
        # @!attribute endpoint_id
        #
        #   @return [String, nil]
        optional :endpoint_id, String, api_name: :EndpointID

        # @!attribute i_pv4_address
        #
        #   @return [String, nil]
        optional :i_pv4_address, String, api_name: :IPv4Address

        # @!attribute i_pv6_address
        #
        #   @return [String, nil]
        optional :i_pv6_address, String, api_name: :IPv6Address

        # @!attribute mac_address
        #
        #   @return [String, nil]
        optional :mac_address, String, api_name: :MacAddress

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String, api_name: :Name

        # @!method initialize(endpoint_id: nil, i_pv4_address: nil, i_pv6_address: nil, mac_address: nil, name: nil)
        #   contains network resources allocated and used for a container in a network.
        #
        #   @param endpoint_id [String]
        #   @param i_pv4_address [String]
        #   @param i_pv6_address [String]
        #   @param mac_address [String]
        #   @param name [String]
      end

      class Status < Docker::Internal::Type::BaseModel
        # @!attribute ipam
        #
        #   @return [Docker::Models::NetworkInspectResponse::Status::Ipam, nil]
        optional :ipam, -> { Docker::Models::NetworkInspectResponse::Status::Ipam }, api_name: :IPAM

        # @!method initialize(ipam: nil)
        #   provides runtime information about the network such as the number of allocated
        #   IPs.
        #
        #   @param ipam [Docker::Models::NetworkInspectResponse::Status::Ipam]

        # @see Docker::Models::NetworkInspectResponse::Status#ipam
        class Ipam < Docker::Internal::Type::BaseModel
          # @!attribute subnets
          #
          #   @return [Hash{Symbol=>Docker::Models::NetworkInspectResponse::Status::Ipam::Subnet}, nil]
          optional :subnets,
                   -> { Docker::Internal::Type::HashOf[Docker::Models::NetworkInspectResponse::Status::Ipam::Subnet] },
                   api_name: :Subnets

          # @!method initialize(subnets: nil)
          #   @param subnets [Hash{Symbol=>Docker::Models::NetworkInspectResponse::Status::Ipam::Subnet}]

          class Subnet < Docker::Internal::Type::BaseModel
            # @!attribute dynamic_ips_available
            #   Number of IP addresses within the network's IPRange for the subnet that are
            #   available for allocation, saturating at 2<sup>64</sup> - 1.
            #
            #   @return [Integer, nil]
            optional :dynamic_ips_available, Integer, api_name: :DynamicIPsAvailable

            # @!attribute ips_in_use
            #   Number of IP addresses in the subnet that are in use or reserved and are
            #   therefore unavailable for allocation, saturating at 2<sup>64</sup> - 1.
            #
            #   @return [Integer, nil]
            optional :ips_in_use, Integer, api_name: :IPsInUse

            # @!method initialize(dynamic_ips_available: nil, ips_in_use: nil)
            #   Some parameter documentations has been truncated, see
            #   {Docker::Models::NetworkInspectResponse::Status::Ipam::Subnet} for more details.
            #
            #   @param dynamic_ips_available [Integer] Number of IP addresses within the network's IPRange for the subnet that are avai
            #
            #   @param ips_in_use [Integer] Number of IP addresses in the subnet that are in use or reserved and are therefo
          end
        end
      end
    end
  end
end
