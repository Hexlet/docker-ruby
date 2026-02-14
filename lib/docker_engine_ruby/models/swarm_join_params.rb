# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Swarm#join
    class SwarmJoinParams < DockerEngineRuby::Internal::Type::BaseModel
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

      # @!attribute join_token
      #
      #   @return [String, nil]
      optional :join_token, String, api_name: :JoinToken

      # @!attribute listen_addr
      #
      #   @return [String, nil]
      optional :listen_addr, String, api_name: :ListenAddr

      # @!attribute remote_addrs
      #
      #   @return [Array<String>, nil]
      optional :remote_addrs, DockerEngineRuby::Internal::Type::ArrayOf[String], api_name: :RemoteAddrs

      # @!method initialize(advertise_addr: nil, data_path_addr: nil, join_token: nil, listen_addr: nil, remote_addrs: nil, request_options: {})
      #   @param advertise_addr [String]
      #   @param data_path_addr [String]
      #   @param join_token [String]
      #   @param listen_addr [String]
      #   @param remote_addrs [Array<String>]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
