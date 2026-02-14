# typed: strong

module DockerEngineAPI
  module Models
    class ContainerInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerInspectParams,
            DockerEngineAPI::Internal::AnyHash
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
          { size: T::Boolean, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
