# typed: strong

module DockerEngineRuby
  module Models
    class NetworkInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NetworkInspectParams,
            DockerEngineRuby::Internal::AnyHash
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
