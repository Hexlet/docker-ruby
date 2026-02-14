# typed: strong

module DockerEngineRuby
  module Models
    class ExecResizeParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ExecResizeParams,
            DockerEngineRuby::Internal::AnyHash
          )
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
