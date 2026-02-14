# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Tasks
      # List tasks
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Task>]
      #
      # @see DockerEngineRuby::Models::TaskListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::TaskListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "tasks",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task],
          options: options
        )
      end

      # Inspect a task
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Task]
      #
      # @see DockerEngineRuby::Models::TaskInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["tasks/%1$s", id],
          model: DockerEngineRuby::Task,
          options: params[:request_options]
        )
      end

      # Get task logs
      #
      # @overload logs(id, details: nil, follow: nil, since: nil, stderr: nil, stdout: nil, tail: nil, timestamps: nil, request_options: {})
      #
      # @param id [String]
      # @param details [Boolean]
      # @param follow [Boolean]
      # @param since [Integer]
      # @param stderr [Boolean]
      # @param stdout [Boolean]
      # @param tail [String]
      # @param timestamps [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see DockerEngineRuby::Models::TaskLogsParams
      def logs(id, params = {})
        parsed, options = DockerEngineRuby::TaskLogsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["tasks/%1$s/logs", id],
          query: parsed,
          headers: {"accept" => "application/octet-stream"},
          model: StringIO,
          options: options
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
