# typed: strong

module DockerEngineRuby
  module Models
    class ImageLoadParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageLoadParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::Internal::FileInput) }
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
          body: DockerEngineRuby::Internal::FileInput,
          platform: T::Array[String],
          quiet: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            body: DockerEngineRuby::Internal::FileInput,
            platform: T::Array[String],
            quiet: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
