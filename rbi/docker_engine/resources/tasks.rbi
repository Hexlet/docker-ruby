# typed: strong

module DockerEngine
  module Resources
    class Tasks
      # List tasks
      sig do
        params(
          filters: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::Task])
      end
      def list(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # tasks list.
        #
        # Available filters:
        #
        # - `desired-state=(running | shutdown | accepted)`
        # - `id=<task id>`
        # - `label=key` or `label="key=value"`
        # - `name=<task name>`
        # - `node=<node id or name>`
        # - `service=<service name>`
        filters: nil,
        request_options: {}
      )
      end

      # Inspect a task
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Task)
      end
      def inspect_(
        # ID of the task
        id,
        request_options: {}
      )
      end

      # Get `stdout` and `stderr` logs from a task. See also
      # [`/containers/{id}/logs`](#operation/ContainerLogs).
      #
      # **Note**: This endpoint works only for services with the `local`, `json-file` or
      # `journald` logging drivers.
      sig do
        params(
          id: String,
          details: T::Boolean,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def logs(
        # ID of the task
        id,
        # Show task context and extra details provided to logs.
        details: nil,
        # Keep connection after returning logs.
        follow: nil,
        # Only return logs since this time, as a UNIX timestamp
        since: nil,
        # Return logs from `stderr`
        stderr: nil,
        # Return logs from `stdout`
        stdout: nil,
        # Only return this number of log lines from the end of the logs. Specify as an
        # integer or `all` to output all log lines.
        tail: nil,
        # Add timestamps to every log line
        timestamps: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
