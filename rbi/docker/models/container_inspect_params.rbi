# typed: strong

module Docker
  module Models
    class ContainerInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ContainerInspectParams, Docker::Internal::AnyHash)
        end

      # Return the size of container as fields `SizeRw` and `SizeRootFs`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :size

      sig { params(size: T::Boolean).void }
      attr_writer :size

      sig do
        params(
          size: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
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
          { size: T::Boolean, request_options: Docker::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
