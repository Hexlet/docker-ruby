# typed: strong

module DockerEngineRuby
  module Models
    class ContainerKillParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerKillParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(String)) }
      attr_reader :signal

      sig { params(signal: String).void }
      attr_writer :signal

      sig do
        params(
          id: String,
          signal: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, signal: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
            signal: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
