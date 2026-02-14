# typed: strong

module DockerEngineRuby
  module Models
    class ImageDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageDeleteParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :noprune

      sig { params(noprune: T::Boolean).void }
      attr_writer :noprune

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :platforms

      sig { params(platforms: T::Array[String]).void }
      attr_writer :platforms

      sig do
        params(
          force: T::Boolean,
          noprune: T::Boolean,
          platforms: T::Array[String],
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        force: nil,
        noprune: nil,
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
