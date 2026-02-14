# typed: strong

module DockerEngine
  module Models
    class ImageInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ImageInspectParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Include Manifests in the image summary.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :manifests

      sig { params(manifests: T::Boolean).void }
      attr_writer :manifests

      sig do
        params(
          manifests: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Include Manifests in the image summary.
        manifests: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            manifests: T::Boolean,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
