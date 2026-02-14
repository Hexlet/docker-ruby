# typed: strong

module DockerEngineAPI
  module Models
    class ImageGetAllParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ImageGetAllParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Image names to filter by
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :names

      sig { params(names: T::Array[String]).void }
      attr_writer :names

      # JSON encoded OCI platform(s) which will be used to select the platform-specific
      # image(s) to be saved if the image is multi-platform. If not provided, the full
      # multi-platform image will be saved.
      #
      # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :platform

      sig { params(platform: T::Array[String]).void }
      attr_writer :platform

      sig do
        params(
          names: T::Array[String],
          platform: T::Array[String],
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Image names to filter by
        names: nil,
        # JSON encoded OCI platform(s) which will be used to select the platform-specific
        # image(s) to be saved if the image is multi-platform. If not provided, the full
        # multi-platform image will be saved.
        #
        # Example: `{"os": "linux", "architecture": "arm", "variant": "v5"}`
        platform: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            names: T::Array[String],
            platform: T::Array[String],
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
