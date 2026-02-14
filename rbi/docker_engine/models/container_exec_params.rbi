# typed: strong

module DockerEngine
  module Models
    class ContainerExecParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerExecParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Attach to `stderr` of the exec command.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stderr

      sig { params(attach_stderr: T::Boolean).void }
      attr_writer :attach_stderr

      # Attach to `stdin` of the exec command.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdin

      sig { params(attach_stdin: T::Boolean).void }
      attr_writer :attach_stdin

      # Attach to `stdout` of the exec command.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdout

      sig { params(attach_stdout: T::Boolean).void }
      attr_writer :attach_stdout

      # Command to run, as a string or array of strings.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cmd

      sig { params(cmd: T::Array[String]).void }
      attr_writer :cmd

      # Initial console size, as an `[height, width]` array.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_accessor :console_size

      # Override the key sequence for detaching a container. Format is a single
      # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      # `[`, `,` or `_`.
      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      # A list of environment variables in the form `["VAR=value", ...]`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :env

      sig { params(env: T::Array[String]).void }
      attr_writer :env

      # Runs the exec process with extended privileges.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :privileged

      sig { params(privileged: T::Boolean).void }
      attr_writer :privileged

      # Allocate a pseudo-TTY.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      # The user, and optionally, group to run the exec process inside the container.
      # Format is one of: `user`, `user:group`, `uid`, or `uid:gid`.
      sig { returns(T.nilable(String)) }
      attr_reader :user

      sig { params(user: String).void }
      attr_writer :user

      # The working directory for the exec process inside the container.
      sig { returns(T.nilable(String)) }
      attr_reader :working_dir

      sig { params(working_dir: String).void }
      attr_writer :working_dir

      sig do
        params(
          attach_stderr: T::Boolean,
          attach_stdin: T::Boolean,
          attach_stdout: T::Boolean,
          cmd: T::Array[String],
          console_size: T.nilable(T::Array[Integer]),
          detach_keys: String,
          env: T::Array[String],
          privileged: T::Boolean,
          tty: T::Boolean,
          user: String,
          working_dir: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Attach to `stderr` of the exec command.
        attach_stderr: nil,
        # Attach to `stdin` of the exec command.
        attach_stdin: nil,
        # Attach to `stdout` of the exec command.
        attach_stdout: nil,
        # Command to run, as a string or array of strings.
        cmd: nil,
        # Initial console size, as an `[height, width]` array.
        console_size: nil,
        # Override the key sequence for detaching a container. Format is a single
        # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
        # `[`, `,` or `_`.
        detach_keys: nil,
        # A list of environment variables in the form `["VAR=value", ...]`.
        env: nil,
        # Runs the exec process with extended privileges.
        privileged: nil,
        # Allocate a pseudo-TTY.
        tty: nil,
        # The user, and optionally, group to run the exec process inside the container.
        # Format is one of: `user`, `user:group`, `uid`, or `uid:gid`.
        user: nil,
        # The working directory for the exec process inside the container.
        working_dir: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            attach_stderr: T::Boolean,
            attach_stdin: T::Boolean,
            attach_stdout: T::Boolean,
            cmd: T::Array[String],
            console_size: T.nilable(T::Array[Integer]),
            detach_keys: String,
            env: T::Array[String],
            privileged: T::Boolean,
            tty: T::Boolean,
            user: String,
            working_dir: String,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
