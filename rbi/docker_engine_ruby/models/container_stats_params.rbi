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

      # Only get a single stat instead of waiting for 2 cycles. Must be used with
      # `stream=false`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :one_shot

      sig { params(one_shot: T::Boolean).void }
      attr_writer :one_shot

      # Stream the output. If false, the stats will be output once and then it will
      # disconnect.
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
      def self.new(
        # Only get a single stat instead of waiting for 2 cycles. Must be used with
        # `stream=false`.
        one_shot: nil,
        # Stream the output. If false, the stats will be output once and then it will
        # disconnect.
        stream: nil,
        request_options: {}
      )
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
