# typed: strong

module DockerEngineRuby
  module Models
    class ContainerRenameParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerRenameParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # New name for the container
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # New name for the container
        name:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { name: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
