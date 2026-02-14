# typed: strong

module DockerEngine
  module Models
    class ExecResizeParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::ExecResizeParams, DockerEngine::Internal::AnyHash)
        end

      # Height of the TTY session in characters
      sig { returns(Integer) }
      attr_accessor :h

      # Width of the TTY session in characters
      sig { returns(Integer) }
      attr_accessor :w

      sig do
        params(
          h: Integer,
          w: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Height of the TTY session in characters
        h:,
        # Width of the TTY session in characters
        w:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            h: Integer,
            w: Integer,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
