# typed: strong

module DockerEngineRuby
  module Models
    class ContainerDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerDeleteParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :link

      sig { params(link: T::Boolean).void }
      attr_writer :link

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :v

      sig { params(v: T::Boolean).void }
      attr_writer :v

      sig do
        params(
          force: T::Boolean,
          link: T::Boolean,
          v: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(force: nil, link: nil, v: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            force: T::Boolean,
            link: T::Boolean,
            v: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
