# typed: strong

module DockerEngineRuby
  module Models
    class ContainerInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerInspectParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :size

      sig { params(size: T::Boolean).void }
      attr_writer :size

      sig do
        params(
          size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(size: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            size: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
