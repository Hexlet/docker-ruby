# typed: strong

module DockerEngine
  module Models
    class DistributionInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::DistributionInspectParams,
            DockerEngine::Internal::AnyHash
          )
        end

      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: DockerEngine::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
