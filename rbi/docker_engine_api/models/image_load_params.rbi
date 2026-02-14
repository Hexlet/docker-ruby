# typed: strong

module DockerEngineAPI
  module Models
    class ImageLoadParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ImageLoadParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineAPI::Internal::FileInput) }
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
          body: DockerEngineAPI::Internal::FileInput,
          platform: T::Array[String],
          quiet: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            body: DockerEngineAPI::Internal::FileInput,
            platform: T::Array[String],
            quiet: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
