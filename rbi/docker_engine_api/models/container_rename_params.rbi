# typed: strong

module DockerEngineAPI
  module Models
    class ContainerRenameParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerRenameParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # New name for the container
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
          { name: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
