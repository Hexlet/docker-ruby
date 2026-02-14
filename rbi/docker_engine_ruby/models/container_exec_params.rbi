# typed: strong

module DockerEngineRuby
  module Models
    class ContainerExecParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerExecParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stderr

      sig { params(attach_stderr: T::Boolean).void }
      attr_writer :attach_stderr

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdin

      sig { params(attach_stdin: T::Boolean).void }
      attr_writer :attach_stdin

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :attach_stdout

      sig { params(attach_stdout: T::Boolean).void }
      attr_writer :attach_stdout

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cmd

      sig { params(cmd: T::Array[String]).void }
      attr_writer :cmd

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_accessor :console_size

      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :env

      sig { params(env: T::Array[String]).void }
      attr_writer :env

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :privileged

      sig { params(privileged: T::Boolean).void }
      attr_writer :privileged

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      sig { returns(T.nilable(String)) }
      attr_reader :user

      sig { params(user: String).void }
      attr_writer :user

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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        attach_stderr: nil,
        attach_stdin: nil,
        attach_stdout: nil,
        cmd: nil,
        console_size: nil,
        detach_keys: nil,
        env: nil,
        privileged: nil,
        tty: nil,
        user: nil,
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
