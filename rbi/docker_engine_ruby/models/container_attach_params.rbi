# typed: strong

module DockerEngineRuby
  module Models
    class ContainerAttachParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerAttachParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :logs

      sig { params(logs: T::Boolean).void }
      attr_writer :logs

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stderr

      sig { params(stderr: T::Boolean).void }
      attr_writer :stderr

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdin

      sig { params(stdin: T::Boolean).void }
      attr_writer :stdin

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdout

      sig { params(stdout: T::Boolean).void }
      attr_writer :stdout

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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        detach_keys: nil,
        logs: nil,
        stderr: nil,
        stdin: nil,
        stdout: nil,
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
