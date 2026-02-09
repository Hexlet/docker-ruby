# typed: strong

module Docker
  module Models
    class ContainerKillParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ContainerKillParams, Docker::Internal::AnyHash)
        end

      # Signal to send to the container as an integer or string (e.g. `SIGINT`).
      sig { returns(T.nilable(String)) }
      attr_reader :signal

      sig { params(signal: String).void }
      attr_writer :signal

      sig do
        params(
          signal: String,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Signal to send to the container as an integer or string (e.g. `SIGINT`).
        signal: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { signal: String, request_options: Docker::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
