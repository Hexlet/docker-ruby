# typed: strong

module Docker
  module Models
    class ImageDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ImageDeleteParams, Docker::Internal::AnyHash)
        end

      # Remove the image even if it is being used by stopped containers or has other
      # tags
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      # Do not delete untagged parent images
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :noprune

      sig { params(noprune: T::Boolean).void }
      attr_writer :noprune

      # Select platform-specific content to delete. Multiple values are accepted. Each
      # platform is a OCI platform encoded as a JSON string.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :platforms

      sig { params(platforms: T::Array[String]).void }
      attr_writer :platforms

      sig do
        params(
          force: T::Boolean,
          noprune: T::Boolean,
          platforms: T::Array[String],
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Remove the image even if it is being used by stopped containers or has other
        # tags
        force: nil,
        # Do not delete untagged parent images
        noprune: nil,
        # Select platform-specific content to delete. Multiple values are accepted. Each
        # platform is a OCI platform encoded as a JSON string.
        platforms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            force: T::Boolean,
            noprune: T::Boolean,
            platforms: T::Array[String],
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
