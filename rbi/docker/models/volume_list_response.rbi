# typed: strong

module Docker
  module Models
    class VolumeListResponse < Docker::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Docker::Models::VolumeListResponse, Docker::Internal::AnyHash)
        end

      # List of volumes
      sig { returns(T.nilable(T::Array[Docker::Volume])) }
      attr_reader :volumes

      sig { params(volumes: T::Array[Docker::Volume::OrHash]).void }
      attr_writer :volumes

      # Warnings that occurred when fetching the list of volumes.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :warnings

      sig { params(warnings: T::Array[String]).void }
      attr_writer :warnings

      # Volume list response
      sig do
        params(
          volumes: T::Array[Docker::Volume::OrHash],
          warnings: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(
        # List of volumes
        volumes: nil,
        # Warnings that occurred when fetching the list of volumes.
        warnings: nil
      )
      end

      sig do
        override.returns(
          { volumes: T::Array[Docker::Volume], warnings: T::Array[String] }
        )
      end
      def to_hash
      end
    end
  end
end
