# typed: strong

module DockerEngineRuby
  module Models
    class ConfigUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ConfigUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::ConfigSpec) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::ConfigSpec::OrHash).void }
      attr_writer :spec

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          spec: DockerEngineRuby::ConfigSpec::OrHash,
          id: String,
          version: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(spec:, id:, version:, request_options: {})
      end

      sig do
        override.returns(
          {
            spec: DockerEngineRuby::ConfigSpec,
            id: String,
            version: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
