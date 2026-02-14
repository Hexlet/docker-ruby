# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Tasks
      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::TaskListParams} for more details.
      #
      # List tasks
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineAPI::Models::Task>]
      #
      # @see DockerEngineAPI::Models::TaskListParams
      def list(params = {})
        parsed, options = DockerEngineAPI::TaskListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "tasks",
          query: parsed,
          model: DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Task],
          options: options
        )
      end

      # Inspect a task
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String] ID of the task
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Task]
      #
      # @see DockerEngineAPI::Models::TaskInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["tasks/%1$s", id],
          model: DockerEngineAPI::Task,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineAPI::Models::TaskLogsParams} for more details.
      #
      # Get `stdout` and `stderr` logs from a task. See also
      # [`/containers/{id}/logs`](#operation/ContainerLogs).
      #
      # **Note**: This endpoint works only for services with the `local`, `json-file` or
      # `journald` logging drivers.
      #
      # @overload logs(id, details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #
      # @param id [String] ID of the task
      #
      # @param details [Boolean] Show task context and extra details provided to logs.
      #
      # @param follow [Boolean] Keep connection after returning logs.
      #
      # @param since [Integer] Only return logs since this time, as a UNIX timestamp
      #
      # @param stderr [Boolean] Return logs from `stderr`
      #
      # @param stdout [Boolean] Return logs from `stdout`
      #
      # @param tail [String] Only return this number of log lines from the end of the logs.
      #
      # @param timestamps [Boolean] Add timestamps to every log line
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineAPI::Models::TaskLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngineAPI::TaskLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["tasks/%1$s/logs", id],
          query: parsed,
          headers: {"accept" => "application/vnd.docker.multiplexed-stream"},
          model: StringIO,
          options: options
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
