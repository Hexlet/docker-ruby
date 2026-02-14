# typed: strong

module DockerEngine
  module Models
    class ContainerLogsParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerLogsParams,
            DockerEngine::Internal::AnyHash
          )
        end

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

      # Only return logs before this time, as a UNIX timestamp
      sig { returns(T.nilable(Integer)) }
      attr_reader :until_

      sig { params(until_: Integer).void }
      attr_writer :until_

      sig do
        params(
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          until_: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        # Only return logs before this time, as a UNIX timestamp
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            follow: T::Boolean,
            since: Integer,
            stderr: T::Boolean,
            stdout: T::Boolean,
            tail: String,
            timestamps: T::Boolean,
            until_: Integer,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
