# typed: strong

module DockerEngineAPI
  module Models
    class ContainerAttachParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerAttachParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Override the key sequence for detaching a container.Format is a single character
      # `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`
      # or `_`.
      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      # Replay previous logs from the container.
      #
      # This is useful for attaching to a container that has started and you want to
      # output everything since the container started.
      #
      # If `stream` is also enabled, once all the previous output has been returned, it
      # will seamlessly transition into streaming current output.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :logs

      sig { params(logs: T::Boolean).void }
      attr_writer :logs

      # Attach to `stderr`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stderr

      sig { params(stderr: T::Boolean).void }
      attr_writer :stderr

      # Attach to `stdin`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdin

      sig { params(stdin: T::Boolean).void }
      attr_writer :stdin

      # Attach to `stdout`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdout

      sig { params(stdout: T::Boolean).void }
      attr_writer :stdout

      # Stream attached streams from the time the request was made onwards.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream

      sig { params(stream: T::Boolean).void }
      attr_writer :stream

      sig do
        params(
          detach_keys: String,
          logs: T::Boolean,
          stderr: T::Boolean,
          stdin: T::Boolean,
          stdout: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Override the key sequence for detaching a container.Format is a single character
        # `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`, `[`, `,`
        # or `_`.
        detach_keys: nil,
        # Replay previous logs from the container.
        #
        # This is useful for attaching to a container that has started and you want to
        # output everything since the container started.
        #
        # If `stream` is also enabled, once all the previous output has been returned, it
        # will seamlessly transition into streaming current output.
        logs: nil,
        # Attach to `stderr`
        stderr: nil,
        # Attach to `stdin`
        stdin: nil,
        # Attach to `stdout`
        stdout: nil,
        # Stream attached streams from the time the request was made onwards.
        stream: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            detach_keys: String,
            logs: T::Boolean,
            stderr: T::Boolean,
            stdin: T::Boolean,
            stdout: T::Boolean,
            stream: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
