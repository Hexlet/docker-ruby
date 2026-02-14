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

      # The version number of the node object being updated. This is required to avoid
      # conflicting writes.
      sig { returns(Integer) }
      attr_accessor :version

      sig do
        params(
          version: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The version number of the node object being updated. This is required to avoid
        # conflicting writes.
        version:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
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
