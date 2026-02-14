# typed: strong

module DockerEngine
  module Models
    class ContainerArchiveParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerArchiveParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Resource in the container’s filesystem to archive.
      sig { returns(String) }
      attr_accessor :path

      sig do
        params(
          path: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Resource in the container’s filesystem to archive.
        path:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { path: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
