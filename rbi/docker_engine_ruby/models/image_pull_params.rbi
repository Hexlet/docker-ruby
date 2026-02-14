# typed: strong

module DockerEngineRuby
  module Models
    class ImagePullParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImagePullParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :body

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :changes

      sig { params(changes: T::Array[String]).void }
      attr_writer :changes

      sig { returns(T.nilable(String)) }
      attr_reader :from_image

      sig { params(from_image: String).void }
      attr_writer :from_image

      sig { returns(T.nilable(String)) }
      attr_reader :from_src

      sig { params(from_src: String).void }
      attr_writer :from_src

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { returns(T.nilable(String)) }
      attr_reader :platform

      sig { params(platform: String).void }
      attr_writer :platform

      sig { returns(T.nilable(String)) }
      attr_reader :repo

      sig { params(repo: String).void }
      attr_writer :repo

      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          body: String,
          changes: T::Array[String],
          from_image: String,
          from_src: String,
          message: String,
          platform: String,
          repo: String,
          tag: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        changes: nil,
        from_image: nil,
        from_src: nil,
        message: nil,
        platform: nil,
        repo: nil,
        tag: nil,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: String,
            changes: T::Array[String],
            from_image: String,
            from_src: String,
            message: String,
            platform: String,
            repo: String,
            tag: String,
            x_registry_auth: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
