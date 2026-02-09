# typed: strong

module Docker
  module Models
    class SystemVersionParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::SystemVersionParams, Docker::Internal::AnyHash)
        end

      sig do
        params(request_options: Docker::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Docker::RequestOptions }) }
      def to_hash
      end
    end
  end
end
