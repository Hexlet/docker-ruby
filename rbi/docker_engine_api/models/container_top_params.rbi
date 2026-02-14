# typed: strong

module DockerEngineAPI
  module Models
    class ContainerTopParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerTopParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The arguments to pass to `ps`. For example, `aux`
      sig { returns(T.nilable(String)) }
      attr_reader :ps_args

      sig { params(ps_args: String).void }
      attr_writer :ps_args

      sig do
        params(
          ps_args: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The arguments to pass to `ps`. For example, `aux`
        ps_args: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { ps_args: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
