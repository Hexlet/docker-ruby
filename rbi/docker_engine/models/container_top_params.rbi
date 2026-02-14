# typed: strong

module DockerEngine
  module Models
    class ContainerTopParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerTopParams,
            DockerEngine::Internal::AnyHash
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
          request_options: DockerEngine::RequestOptions::OrHash
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
          { ps_args: String, request_options: DockerEngine::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
