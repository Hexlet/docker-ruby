# typed: strong

module DockerEngine
  module Models
    class ExecInspectResponse < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::Models::ExecInspectResponse,
            DockerEngine::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :can_remove

      sig { params(can_remove: T::Boolean).void }
      attr_writer :can_remove

      sig { returns(T.nilable(String)) }
      attr_reader :container_id

      sig { params(container_id: String).void }
      attr_writer :container_id

      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      sig { returns(T.nilable(Integer)) }
      attr_reader :exit_code

      sig { params(exit_code: Integer).void }
      attr_writer :exit_code

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :open_stderr

      sig { params(open_stderr: T::Boolean).void }
      attr_writer :open_stderr

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :open_stdin

      sig { params(open_stdin: T::Boolean).void }
      attr_writer :open_stdin

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :open_stdout

      sig { params(open_stdout: T::Boolean).void }
      attr_writer :open_stdout

      # The system process ID for the exec process.
      sig { returns(T.nilable(Integer)) }
      attr_reader :pid

      sig { params(pid: Integer).void }
      attr_writer :pid

      sig { returns(T.nilable(DockerEngine::InspectResponse)) }
      attr_reader :process_config

      sig { params(process_config: DockerEngine::InspectResponse::OrHash).void }
      attr_writer :process_config

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :running

      sig { params(running: T::Boolean).void }
      attr_writer :running

      sig do
        params(
          can_remove: T::Boolean,
          container_id: String,
          detach_keys: String,
          exit_code: Integer,
          id: String,
          open_stderr: T::Boolean,
          open_stdin: T::Boolean,
          open_stdout: T::Boolean,
          pid: Integer,
          process_config: DockerEngine::InspectResponse::OrHash,
          running: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        can_remove: nil,
        container_id: nil,
        detach_keys: nil,
        exit_code: nil,
        id: nil,
        open_stderr: nil,
        open_stdin: nil,
        open_stdout: nil,
        # The system process ID for the exec process.
        pid: nil,
        process_config: nil,
        running: nil
      )
      end

      sig do
        override.returns(
          {
            can_remove: T::Boolean,
            container_id: String,
            detach_keys: String,
            exit_code: Integer,
            id: String,
            open_stderr: T::Boolean,
            open_stdin: T::Boolean,
            open_stdout: T::Boolean,
            pid: Integer,
            process_config: DockerEngine::InspectResponse,
            running: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
