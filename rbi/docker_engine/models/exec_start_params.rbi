# typed: strong

module DockerEngine
  module Models
    class ExecStartParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::ExecStartParams, DockerEngine::Internal::AnyHash)
        end

      # Initial console size, as an `[height, width]` array.
      sig { returns(T.nilable(T::Array[Integer])) }
      attr_accessor :console_size

      # Detach from the command.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :detach

      sig { params(detach: T::Boolean).void }
      attr_writer :detach

      # Allocate a pseudo-TTY.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      sig do
        params(
          console_size: T.nilable(T::Array[Integer]),
          detach: T::Boolean,
          tty: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Initial console size, as an `[height, width]` array.
        console_size: nil,
        # Detach from the command.
        detach: nil,
        # Allocate a pseudo-TTY.
        tty: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            console_size: T.nilable(T::Array[Integer]),
            detach: T::Boolean,
            tty: T::Boolean,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
