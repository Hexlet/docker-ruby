# typed: strong

module DockerEngineRuby
  module Models
    class ServiceListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ServiceListParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :status

      sig { params(status: T::Boolean).void }
      attr_writer :status

      sig do
        params(
          filters: String,
          status: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(filters: nil, status: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            filters: String,
            status: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
