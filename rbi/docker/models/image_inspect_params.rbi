# typed: strong

module Docker
  module Models
    class ImageInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ImageInspectParams, Docker::Internal::AnyHash)
        end

      # Include Manifests in the image summary.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :manifests

      sig { params(manifests: T::Boolean).void }
      attr_writer :manifests

      sig do
        params(
          manifests: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
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
          { manifests: T::Boolean, request_options: Docker::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
