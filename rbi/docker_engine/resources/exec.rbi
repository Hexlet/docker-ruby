# typed: strong

module DockerEngine
  module Resources
    class Exec
      # Return low-level information about an exec instance.
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::ExecInspectResponse)
      end
      def inspect_(
        # Exec instance ID
        id,
        request_options: {}
      )
      end

      # Resize the TTY session used by an exec instance. This endpoint only works if
      # `tty` was specified as part of creating and starting the exec instance.
      sig do
        params(
          id: String,
          h: Integer,
          w: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def resize(
        # Exec instance ID
        id,
        # Height of the TTY session in characters
        h:,
        # Width of the TTY session in characters
        w:,
        request_options: {}
      )
      end

      # Starts a previously set up exec instance. If detach is true, this endpoint
      # returns immediately after starting the command. Otherwise, it sets up an
      # interactive session with the command.
      sig do
        params(
          id: String,
          console_size: T.nilable(T::Array[Integer]),
          detach: T::Boolean,
          tty: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def start(
        # Exec instance ID
        id,
        # Initial console size, as an `[height, width]` array.
        console_size: nil,
        # Detach from the command.
        detach: nil,
        # Allocate a pseudo-TTY.
        tty: nil,
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
