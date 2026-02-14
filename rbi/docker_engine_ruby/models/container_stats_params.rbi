# typed: strong

module DockerEngineRuby
  module Models
    class ContainerStatsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerStatsParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :one_shot

      sig { params(one_shot: T::Boolean).void }
      attr_writer :one_shot

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream

      sig { params(stream: T::Boolean).void }
      attr_writer :stream

      sig do
        params(
          one_shot: T::Boolean,
          stream: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(one_shot: nil, stream: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            one_shot: T::Boolean,
            stream: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
