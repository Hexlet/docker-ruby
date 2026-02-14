# typed: strong

module DockerEngine
  module Models
    class WaitResponse < DockerEngine::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngine::WaitResponse, DockerEngine::Internal::AnyHash)
        end

      # Exit code of the container
      sig { returns(Integer) }
      attr_accessor :status_code

      # container waiting error, if any
      sig { returns(T.nilable(DockerEngine::WaitResponse::Error)) }
      attr_reader :error

      sig { params(error: DockerEngine::WaitResponse::Error::OrHash).void }
      attr_writer :error

      # OK response to ContainerWait operation
      sig do
        params(
          status_code: Integer,
          error: DockerEngine::WaitResponse::Error::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Exit code of the container
        status_code:,
        # container waiting error, if any
        error: nil
      )
      end

      sig do
        override.returns(
          { status_code: Integer, error: DockerEngine::WaitResponse::Error }
        )
      end
      def to_hash
      end

      class Error < DockerEngine::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngine::WaitResponse::Error,
              DockerEngine::Internal::AnyHash
            )
          end

        # Details of an error
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # container waiting error, if any
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # Details of an error
          message: nil
        )
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end
    end
  end
end
