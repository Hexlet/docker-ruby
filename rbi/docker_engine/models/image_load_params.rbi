# typed: strong

module DockerEngine
  module Models
    class ImageLoadParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DockerEngine::ImageLoadParams, DockerEngine::Internal::AnyHash)
        end

      sig { returns(DockerEngine::Internal::FileInput) }
      attr_accessor :body

      # JSON encoded OCI platform(s) which will be used to select the platform-specific
      # image(s) to load if the image is multi-platform. If not provided, the full
      # multi-platform image will be loaded.
      #
      # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :platform

      sig { params(platform: T::Array[String]).void }
      attr_writer :platform

      # Suppress progress details during load.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :quiet

      sig { params(quiet: T::Boolean).void }
      attr_writer :quiet

      sig do
        params(
          body: DockerEngine::Internal::FileInput,
          platform: T::Array[String],
          quiet: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        # JSON encoded OCI platform(s) which will be used to select the platform-specific
        # image(s) to load if the image is multi-platform. If not provided, the full
        # multi-platform image will be loaded.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        # Suppress progress details during load.
        quiet: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: DockerEngine::Internal::FileInput,
            platform: T::Array[String],
            quiet: T::Boolean,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
