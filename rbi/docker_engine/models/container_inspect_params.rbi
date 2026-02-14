# typed: strong

module DockerEngine
  module Models
    class ContainerInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerInspectParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Return the size of container as fields `SizeRw` and `SizeRootFs`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :size

      sig { params(size: T::Boolean).void }
      attr_writer :size

      sig do
        params(
          size: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Return the size of container as fields `SizeRw` and `SizeRootFs`
        size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { size: T::Boolean, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
