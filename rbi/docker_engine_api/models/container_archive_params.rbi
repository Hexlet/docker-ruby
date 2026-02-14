# typed: strong

module DockerEngineAPI
  module Models
    class ContainerArchiveParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerArchiveParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Resource in the container’s filesystem to archive.
      sig { returns(String) }
      attr_accessor :path

      sig do
        params(
          path: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
          { path: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
