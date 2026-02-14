# typed: strong

module DockerEngineAPI
  module Models
    class NetworkInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::NetworkInspectParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Filter the network by scope (swarm, global, or local)
      sig { returns(T.nilable(String)) }
      attr_reader :scope

      sig { params(scope: String).void }
      attr_writer :scope

      # Detailed inspect output for troubleshooting
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verbose

      sig { params(verbose: T::Boolean).void }
      attr_writer :verbose

      sig do
        params(
          scope: String,
          verbose: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter the network by scope (swarm, global, or local)
        scope: nil,
        # Detailed inspect output for troubleshooting
        verbose: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            scope: String,
            verbose: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
