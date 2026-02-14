# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class System
      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::SystemDataUsageParams} for more details.
      #
      # Get data usage information
      #
      # @overload data_usage(type: nil, verbose: nil, request_options: {})
      #
      # @param type [Array<Symbol, DockerEngineAPI::Models::SystemDataUsageParams::Type>] Object types, for which to compute and return data.
      #
      # @param verbose [Boolean] Show detailed information on space usage.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::SystemDataUsageResponse]
      #
      # @see DockerEngineAPI::Models::SystemDataUsageParams
      def data_usage(params = {})
        parsed, options = DockerEngineAPI::SystemDataUsageParams.dump_request(params)
        @client.request(
          method: :get,
          path: "system/df",
          query: parsed,
          model: DockerEngineAPI::Models::SystemDataUsageResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::SystemEventsParams} for more details.
      #
      # Stream real-time events from the server.
      #
      # Various objects within Docker report events when something happens to them.
      #
      # Containers report these events: `attach`, `commit`, `copy`, `create`, `destroy`,
      # `detach`, `die`, `exec_create`, `exec_detach`, `exec_start`, `exec_die`,
      # `export`, `health_status`, `kill`, `oom`, `pause`, `rename`, `resize`,
      # `restart`, `start`, `stop`, `top`, `unpause`, `update`, and `prune`
      #
      # Images report these events: `create`, `delete`, `import`, `load`, `pull`,
      # `push`, `save`, `tag`, `untag`, and `prune`
      #
      # Volumes report these events: `create`, `mount`, `unmount`, `destroy`, and
      # `prune`
      #
      # Networks report these events: `create`, `connect`, `disconnect`, `destroy`,
      # `update`, `remove`, and `prune`
      #
      # The Docker daemon reports these events: `reload`
      #
      # Services report these events: `create`, `update`, and `remove`
      #
      # Nodes report these events: `create`, `update`, and `remove`
      #
      # Secrets report these events: `create`, `update`, and `remove`
      #
      # Configs report these events: `create`, `update`, and `remove`
      #
      # The Builder reports `prune` events
      #
      # @overload events(filters: nil, since: nil, until_: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of filters (a `map[string][]string`) to process on the even
      #
      # @param since [String] Show events created since this timestamp then stream new events.
      #
      # @param until_ [String] Show events created until this timestamp then stop streaming.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::SystemEventsResponse]
      #
      # @see DockerEngineAPI::Models::SystemEventsParams
      def events(params = {})
        parsed, options = DockerEngineAPI::SystemEventsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "events",
          query: parsed.transform_keys(until_: "until"),
          headers: {"accept" => "application/json-seq"},
          model: DockerEngineAPI::Models::SystemEventsResponse,
          options: options
        )
      end

      # Get system information
      #
      # @overload info(request_options: {})
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Info]
      #
      # @see DockerEngineAPI::Models::SystemInfoParams
      def info(params = {})
        @client.request(
          method: :get,
          path: "info",
          model: DockerEngineAPI::Info,
          options: params[:request_options]
        )
      end

      # This is a dummy endpoint you can use to test if the server is accessible.
      #
      # @overload ping(request_options: {})
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see DockerEngineAPI::Models::SystemPingParams
      def ping(params = {})
        @client.request(
          method: :get,
          path: "_ping",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
        )
      end

      # Returns the version of Docker that is running and various information about the
      # system that Docker is running on.
      #
      # @overload version(request_options: {})
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Version]
      #
      # @see DockerEngineAPI::Models::SystemVersionParams
      def version(params = {})
        @client.request(
          method: :get,
          path: "version",
          model: DockerEngineAPI::Version,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [DockerEngineAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
