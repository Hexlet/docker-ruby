# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Swarm
      # Update a swarm
      #
      # @overload update(version:, spec:, rotate_manager_token: nil, rotate_manager_unlock_key: nil, rotate_worker_token: nil, request_options: {})
      #
      # @param version [Integer] Query param
      #
      # @param spec [DockerEngineRuby::Models::SwarmSpec] Body param: User modifiable swarm configuration.
      #
      # @param rotate_manager_token [Boolean] Query param
      #
      # @param rotate_manager_unlock_key [Boolean] Query param
      #
      # @param rotate_worker_token [Boolean] Query param
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

      # Initialize a new swarm
      #
      # @overload init(advertise_addr: nil, data_path_addr: nil, data_path_port: nil, default_addr_pool: nil, force_new_cluster: nil, listen_addr: nil, spec: nil, subnet_size: nil, request_options: {})
      #
      # @param advertise_addr [String]
      #
      # @param data_path_addr [String]
      #
      # @param data_path_port [Integer]
      #
      # @param default_addr_pool [Array<String>]
      #
      # @param force_new_cluster [Boolean]
      #
      # @param listen_addr [String]
      #
      # @param spec [DockerEngineRuby::Models::SwarmSpec] User modifiable swarm configuration.
      #
      # @param subnet_size [Integer]
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see DockerEngineRuby::Models::SwarmInitParams
      def init(params = {})
        parsed, options = DockerEngineRuby::SwarmInitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "swarm/init",
          headers: {"accept" => "text/plain"},
          body: parsed,
          model: String,
          options: options
        )
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

      # Join an existing swarm
      #
      # @overload join(advertise_addr: nil, data_path_addr: nil, join_token: nil, listen_addr: nil, remote_addrs: nil, request_options: {})
      #
      # @param advertise_addr [String]
      # @param data_path_addr [String]
      # @param join_token [String]
      # @param listen_addr [String]
      # @param remote_addrs [Array<String>]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SwarmJoinParams
      def join(params = {})
        parsed, options = DockerEngineRuby::SwarmJoinParams.dump_request(params)
        @client.request(method: :post, path: "swarm/join", body: parsed, model: NilClass, options: options)
      end

      # Leave a swarm
      #
      # @overload leave(force: nil, request_options: {})
      #
      # @param force [Boolean]
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
      # @param unlock_key [String]
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
