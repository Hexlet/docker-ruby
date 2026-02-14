# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Swarm
      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::SwarmUpdateParams} for more details.
      #
      # Update a swarm
      #
      # @overload update(version:, spec:, rotate_manager_token: nil, rotate_manager_unlock_key: nil, rotate_worker_token: nil, request_options: {})
      #
      # @param version [Integer] Query param: The version number of the swarm object being updated. This is
      #
      # @param spec [DockerEngineRuby::Models::Spec] Body param: User modifiable swarm configuration.
      #
      # @param rotate_manager_token [Boolean] Query param: Rotate the manager join token.
      #
      # @param rotate_manager_unlock_key [Boolean] Query param: Rotate the manager unlock key.
      #
      # @param rotate_worker_token [Boolean] Query param: Rotate the worker join token.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SwarmUpdateParams
      def update(params)
        parsed, options = DockerEngineRuby::SwarmUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "swarm/update",
          query: parsed.except(:spec).transform_keys(
            rotate_manager_token: "rotateManagerToken",
            rotate_manager_unlock_key: "rotateManagerUnlockKey",
            rotate_worker_token: "rotateWorkerToken"
          ),
          body: parsed[:spec],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::SwarmInitParams} for more details.
      #
      # Initialize a new swarm
      #
      # @overload init(advertise_addr: nil, data_path_addr: nil, data_path_port: nil, default_addr_pool: nil, force_new_cluster: nil, listen_addr: nil, spec: nil, subnet_size: nil, request_options: {})
      #
      # @param advertise_addr [String] Externally reachable address advertised to other nodes. This
      #
      # @param data_path_addr [String] Address or interface to use for data path traffic (format:
      #
      # @param data_path_port [Integer] DataPathPort specifies the data path port number for data traffic.
      #
      # @param default_addr_pool [Array<String>] Default Address Pool specifies default subnet pools for global
      #
      # @param force_new_cluster [Boolean] Force creation of a new swarm.
      #
      # @param listen_addr [String] Listen address used for inter-manager communication, as well
      #
      # @param spec [DockerEngineRuby::Models::Spec] User modifiable swarm configuration.
      #
      # @param subnet_size [Integer] SubnetSize specifies the subnet size of the networks created
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see DockerEngineRuby::Models::SwarmInitParams
      def init(params = {})
        parsed, options = DockerEngineRuby::SwarmInitParams.dump_request(params)
        @client.request(method: :post, path: "swarm/init", body: parsed, model: String, options: options)
      end

      # Inspect swarm
      #
      # @overload inspect_(request_options: {})
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SwarmAPI]
      #
      # @see DockerEngineRuby::Models::SwarmInspectParams
      def inspect_(params = {})
        @client.request(
          method: :get,
          path: "swarm",
          model: DockerEngineRuby::SwarmAPI,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::SwarmJoinParams} for more details.
      #
      # Join an existing swarm
      #
      # @overload join(advertise_addr: nil, data_path_addr: nil, join_token: nil, listen_addr: nil, remote_addrs: nil, request_options: {})
      #
      # @param advertise_addr [String] Externally reachable address advertised to other nodes. This
      #
      # @param data_path_addr [String] Address or interface to use for data path traffic (format:
      #
      # @param join_token [String] Secret token for joining this swarm.
      #
      # @param listen_addr [String] Listen address used for inter-manager communication if the node
      #
      # @param remote_addrs [Array<String>] Addresses of manager nodes already participating in the swarm.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SwarmJoinParams
      def join(params = {})
        parsed, options = DockerEngineRuby::SwarmJoinParams.dump_request(params)
        @client.request(method: :post, path: "swarm/join", body: parsed, model: NilClass, options: options)
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::SwarmLeaveParams} for more details.
      #
      # Leave a swarm
      #
      # @overload leave(force: nil, request_options: {})
      #
      # @param force [Boolean] Force leave swarm, even if this is the last manager or that it will
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SwarmLeaveParams
      def leave(params = {})
        parsed, options = DockerEngineRuby::SwarmLeaveParams.dump_request(params)
        @client.request(method: :post, path: "swarm/leave", query: parsed, model: NilClass, options: options)
      end

      # Unlock a locked manager
      #
      # @overload unlock(unlock_key: nil, request_options: {})
      #
      # @param unlock_key [String] The swarm's unlock key.
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SwarmUnlockParams
      def unlock(params = {})
        parsed, options = DockerEngineRuby::SwarmUnlockParams.dump_request(params)
        @client.request(method: :post, path: "swarm/unlock", body: parsed, model: NilClass, options: options)
      end

      # Get the unlock key
      #
      # @overload unlock_key(request_options: {})
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SwarmUnlockKeyResponse]
      #
      # @see DockerEngineRuby::Models::SwarmUnlockKeyParams
      def unlock_key(params = {})
        @client.request(
          method: :get,
          path: "swarm/unlockkey",
          model: DockerEngineRuby::Models::SwarmUnlockKeyResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
