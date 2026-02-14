# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#init
    class SwarmInitParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute advertise_addr
      #
      #   @return [String, nil]
      optional :advertise_addr, String, api_name: :AdvertiseAddr

      # @!attribute data_path_addr
      #
      #   @return [String, nil]
      optional :data_path_addr, String, api_name: :DataPathAddr

      # @!attribute data_path_port
      #
      #   @return [Integer, nil]
      optional :data_path_port, Integer, api_name: :DataPathPort

      # @!attribute default_addr_pool
      #
      #   @return [Array<String>, nil]
      optional :default_addr_pool,
               DockerEngineRuby::Internal::Type::ArrayOf[String],
               api_name: :DefaultAddrPool

      # @!attribute force_new_cluster
      #
      #   @return [Boolean, nil]
      optional :force_new_cluster, DockerEngineRuby::Internal::Type::Boolean, api_name: :ForceNewCluster

      # @!attribute listen_addr
      #
      #   @return [String, nil]
      optional :listen_addr, String, api_name: :ListenAddr

      # @!attribute spec
      #   User modifiable swarm configuration.
      #
      #   @return [DockerEngineRuby::Models::Spec, nil]
      optional :spec, -> { DockerEngineRuby::Spec }, api_name: :Spec

      # @!attribute subnet_size
      #
      #   @return [Integer, nil]
      optional :subnet_size, Integer, api_name: :SubnetSize

      # @!method initialize(advertise_addr: nil, data_path_addr: nil, data_path_port: nil, default_addr_pool: nil, force_new_cluster: nil, listen_addr: nil, spec: nil, subnet_size: nil, request_options: {})
      #   @param advertise_addr [String]
      #
      #   @param data_path_addr [String]
      #
      #   @param data_path_port [Integer]
      #
      #   @param default_addr_pool [Array<String>]
      #
      #   @param force_new_cluster [Boolean]
      #
      #   @param listen_addr [String]
      #
      #   @param spec [DockerEngineRuby::Models::Spec] User modifiable swarm configuration.
      #
      #   @param subnet_size [Integer]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
