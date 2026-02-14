# typed: strong

module DockerEngineAPI
  module Models
    class ContainerStartParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerStartParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Override the key sequence for detaching a container. Format is a single
      # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      # `[`, `,` or `_`.
      sig { returns(T.nilable(String)) }
      attr_reader :detach_keys

      sig { params(detach_keys: String).void }
      attr_writer :detach_keys

      sig do
        params(
          detach_keys: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Override the key sequence for detaching a container. Format is a single
        # character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
        # `[`, `,` or `_`.
        detach_keys: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            detach_keys: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
