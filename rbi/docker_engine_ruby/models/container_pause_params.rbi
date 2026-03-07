# typed: strong

module DockerEngineRuby
  module Models
    class ContainerPauseParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerPauseParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, request_options: {})
      end

      sig do
        override.returns(
          { id: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
