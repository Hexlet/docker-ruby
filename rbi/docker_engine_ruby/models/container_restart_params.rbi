# typed: strong

module DockerEngineRuby
  module Models
    class ContainerRestartParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerRestartParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :signal

      sig { params(signal: String).void }
      attr_writer :signal

      sig { returns(T.nilable(Integer)) }
      attr_reader :t

      sig { params(t: Integer).void }
      attr_writer :t

      sig do
        params(
          signal: String,
          t: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(signal: nil, t: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            signal: String,
            t: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
