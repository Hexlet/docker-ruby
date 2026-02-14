# typed: strong

module DockerEngineRuby
  module Models
    class ContainerArchiveParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerArchiveParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Resource in the container’s filesystem to archive.
      sig { returns(String) }
      attr_accessor :path

      sig do
        params(
          path: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
          { path: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
