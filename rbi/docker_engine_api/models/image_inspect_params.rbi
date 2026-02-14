# typed: strong

module DockerEngineAPI
  module Models
    class ImageInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ImageInspectParams,
            DockerEngineAPI::Internal::AnyHash
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
