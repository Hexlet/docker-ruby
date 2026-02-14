# typed: strong

module DockerEngineRuby
  module Models
    class TaskLogsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::TaskLogsParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Show task context and extra details provided to logs.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :details

      sig { params(details: T::Boolean).void }
      attr_writer :details

      # Keep connection after returning logs.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow

      sig { params(follow: T::Boolean).void }
      attr_writer :follow

      # Only return logs since this time, as a UNIX timestamp
      sig { returns(T.nilable(Integer)) }
      attr_reader :since

      sig { params(since: Integer).void }
      attr_writer :since

      # Return logs from `stderr`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stderr

      sig { params(stderr: T::Boolean).void }
      attr_writer :stderr

      # Return logs from `stdout`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdout

      sig { params(stdout: T::Boolean).void }
      attr_writer :stdout

      # Only return this number of log lines from the end of the logs. Specify as an
      # integer or `all` to output all log lines.
      sig { returns(T.nilable(String)) }
      attr_reader :tail

      sig { params(tail: String).void }
      attr_writer :tail

      # Add timestamps to every log line
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :timestamps

      sig { params(timestamps: T::Boolean).void }
      attr_writer :timestamps

      sig do
        params(
          details: T::Boolean,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            details: T::Boolean,
            follow: T::Boolean,
            since: Integer,
            stderr: T::Boolean,
            stdout: T::Boolean,
            tail: String,
            timestamps: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
