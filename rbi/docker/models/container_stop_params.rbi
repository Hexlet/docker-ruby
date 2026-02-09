# typed: strong

module Docker
  module Models
    class ContainerStopParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Docker::ContainerStopParams, Docker::Internal::AnyHash)
        end

      # Signal to send to the container as an integer or string (e.g. `SIGINT`).
      sig { returns(T.nilable(String)) }
      attr_reader :signal

      sig { params(signal: String).void }
      attr_writer :signal

      # Number of seconds to wait before killing the container
      sig { returns(T.nilable(Integer)) }
      attr_reader :t

      sig { params(t: Integer).void }
      attr_writer :t

      sig do
        params(
          signal: String,
          t: Integer,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Signal to send to the container as an integer or string (e.g. `SIGINT`).
        signal: nil,
        # Number of seconds to wait before killing the container
        t: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            signal: String,
            t: Integer,
            request_options: Docker::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
