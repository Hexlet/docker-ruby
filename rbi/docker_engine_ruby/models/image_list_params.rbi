# typed: strong

module DockerEngineRuby
  module Models
    class ImageListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageListParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all

      sig { params(all: T::Boolean).void }
      attr_writer :all

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :digests

      sig { params(digests: T::Boolean).void }
      attr_writer :digests

      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :manifests

      sig { params(manifests: T::Boolean).void }
      attr_writer :manifests

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shared_size

      sig { params(shared_size: T::Boolean).void }
      attr_writer :shared_size

      sig do
        params(
          all: T::Boolean,
          digests: T::Boolean,
          filters: String,
          manifests: T::Boolean,
          shared_size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        all: nil,
        digests: nil,
        filters: nil,
        manifests: nil,
        shared_size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            digests: T::Boolean,
            filters: String,
            manifests: T::Boolean,
            shared_size: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
