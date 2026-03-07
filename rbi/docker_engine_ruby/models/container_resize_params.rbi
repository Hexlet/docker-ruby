# typed: strong

module DockerEngineRuby
  module Models
    class ContainerResizeParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerResizeParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :h

      sig { returns(Integer) }
      attr_accessor :w

      sig do
        params(
          id: String,
          h: Integer,
          w: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, h:, w:, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
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
