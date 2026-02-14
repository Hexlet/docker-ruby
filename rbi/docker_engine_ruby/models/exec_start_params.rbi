# typed: strong

module DockerEngineRuby
  module Models
    class ExecStartParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ExecStartParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[Integer])) }
      attr_accessor :console_size

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :detach

      sig { params(detach: T::Boolean).void }
      attr_writer :detach

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :tty

      sig { params(tty: T::Boolean).void }
      attr_writer :tty

      sig do
        params(
          console_size: T.nilable(T::Array[Integer]),
          detach: T::Boolean,
          tty: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        console_size: nil,
        detach: nil,
        tty: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            console_size: T.nilable(T::Array[Integer]),
            detach: T::Boolean,
            tty: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
