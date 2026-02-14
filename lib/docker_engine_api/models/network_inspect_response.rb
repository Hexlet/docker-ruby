# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Networks#inspect_
    class NetworkInspectResponse < DockerEngineAPI::Models::Network
      # @!attribute containers
      #   Contains endpoints attached to the network.
      #
      #   @return [Hash{Symbol=>DockerEngineAPI::Models::NetworkInspectResponse::Container}, nil]
      optional :containers,
               -> { DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Models::NetworkInspectResponse::Container] },
               api_name: :Containers

      # @!attribute services
      #   List of services using the network. This field is only present for swarm scope
      #   networks, and omitted for local scope networks.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :services,
               DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Internal::Type::Unknown],
               api_name: :Services

      # @!attribute status
      #   provides runtime information about the network such as the number of allocated
      #   IPs.
      #
      #   @return [DockerEngineAPI::Models::NetworkInspectResponse::Status, nil]
      optional :status, -> { DockerEngineAPI::Models::NetworkInspectResponse::Status }, api_name: :Status

      # @!method initialize(containers: nil, services: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::NetworkInspectResponse} for more details.
      #
      #   The body of the "get network" http response message.
      #
      #   @param containers [Hash{Symbol=>DockerEngineAPI::Models::NetworkInspectResponse::Container}] Contains endpoints attached to the network.
      #
      #   @param services [Hash{Symbol=>Object}] List of services using the network. This field is only present for
      #
      #   @param status [DockerEngineAPI::Models::NetworkInspectResponse::Status] provides runtime information about the network such as the number of allocated I

      class Container < DockerEngineAPI::Internal::Type::BaseModel
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

      class Status < DockerEngineAPI::Internal::Type::BaseModel
        # @!attribute ipam
        #
        #   @return [DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam, nil]
        optional :ipam, -> { DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam }, api_name: :IPAM

        # @!method initialize(ipam: nil)
        #   provides runtime information about the network such as the number of allocated
        #   IPs.
        #
        #   @param ipam [DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam]

        # @see DockerEngineAPI::Models::NetworkInspectResponse::Status#ipam
        class Ipam < DockerEngineAPI::Internal::Type::BaseModel
          # @!attribute subnets
          #
          #   @return [Hash{Symbol=>DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet}, nil]
          optional :subnets,
                   -> { DockerEngineAPI::Internal::Type::HashOf[DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet] },
                   api_name: :Subnets

          # @!method initialize(subnets: nil)
          #   @param subnets [Hash{Symbol=>DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet}]

          class Subnet < DockerEngineAPI::Internal::Type::BaseModel
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
            #   {DockerEngineAPI::Models::NetworkInspectResponse::Status::Ipam::Subnet} for more
            #   details.
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
