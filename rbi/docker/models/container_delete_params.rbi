# typed: strong

module Docker
  module Models
    class ContainerDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ContainerDeleteParams, Docker::Internal::AnyHash)
        end

      # If the container is running, kill it before removing it.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :force

      sig { params(force: T::Boolean).void }
      attr_writer :force

      # Remove the specified link associated with the container.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :link

      sig { params(link: T::Boolean).void }
      attr_writer :link

      # Remove anonymous volumes associated with the container.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :v

      sig { params(v: T::Boolean).void }
      attr_writer :v

      sig do
        params(
          force: T::Boolean,
          link: T::Boolean,
          v: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # If the container is running, kill it before removing it.
        force: nil,
        # Remove the specified link associated with the container.
        link: nil,
        # Remove anonymous volumes associated with the container.
        v: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            force: T::Boolean,
            link: T::Boolean,
            v: T::Boolean,
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
