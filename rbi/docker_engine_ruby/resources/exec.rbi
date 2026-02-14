# typed: strong

module DockerEngineRuby
  module Resources
    class Exec
      # Inspect an exec instance
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ExecInspectResponse)
      end
      def inspect_(id, request_options: {})
      end

      # Resize an exec instance
      sig do
        params(
          id: String,
          h: Integer,
          w: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def resize(id, h:, w:, request_options: {})
      end

      # Start an exec instance
      sig do
        params(
          id: String,
          console_size: T.nilable(T::Array[Integer]),
          detach: T::Boolean,
          tty: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def start(
        id,
        console_size: nil,
        detach: nil,
        tty: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
