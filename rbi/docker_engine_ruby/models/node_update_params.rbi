# typed: strong

module DockerEngineRuby
  module Models
    class NodeUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NodeUpdateParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(DockerEngineRuby::NodeSpec) }
      attr_reader :spec

      sig { params(spec: DockerEngineRuby::NodeSpec::OrHash).void }
      attr_writer :spec

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          spec: DockerEngineRuby::NodeSpec::OrHash,
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
            spec: DockerEngineRuby::NodeSpec,
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
