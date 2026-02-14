# typed: strong

module DockerEngine
  module Models
    class ContainerRenameParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerRenameParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # New name for the container
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: DockerEngine::RequestOptions::OrHash
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
          { name: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
