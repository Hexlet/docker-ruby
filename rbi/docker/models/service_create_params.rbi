# typed: strong

module Docker
  module Models
    class ServiceCreateParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ServiceCreateParams, Docker::Internal::AnyHash)
        end

      # User modifiable configuration for a service.
      sig { returns(Docker::ServiceCreateParams::Spec) }
      attr_reader :spec

      sig { params(spec: Docker::ServiceCreateParams::Spec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :x_registry_auth

      sig { params(x_registry_auth: String).void }
      attr_writer :x_registry_auth

      sig do
        params(
          spec: Docker::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # User modifiable configuration for a service.
        spec:,
        x_registry_auth: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            spec: Docker::ServiceCreateParams::Spec,
            x_registry_auth: String,
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Spec < Docker::Models::Spec
        OrHash =
          T.type_alias do
            T.any(Docker::ServiceCreateParams::Spec, Docker::Internal::AnyHash)
          end

        # User modifiable configuration for a service.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
