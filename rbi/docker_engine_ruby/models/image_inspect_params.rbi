# typed: strong

module DockerEngineRuby
  module Models
    class ImageInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageInspectParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :manifests

      sig { params(manifests: T::Boolean).void }
      attr_writer :manifests

      sig do
        params(
          manifests: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(manifests: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            manifests: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
