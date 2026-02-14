# typed: strong

module DockerEngineRuby
  module Models
    class TaskLogsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::TaskLogsParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :details

      sig { params(details: T::Boolean).void }
      attr_writer :details

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow

      sig { params(follow: T::Boolean).void }
      attr_writer :follow

      sig { returns(T.nilable(Integer)) }
      attr_reader :since

      sig { params(since: Integer).void }
      attr_writer :since

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stderr

      sig { params(stderr: T::Boolean).void }
      attr_writer :stderr

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stdout

      sig { params(stdout: T::Boolean).void }
      attr_writer :stdout

      sig { returns(T.nilable(String)) }
      attr_reader :tail

      sig { params(tail: String).void }
      attr_writer :tail

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :timestamps

      sig { params(timestamps: T::Boolean).void }
      attr_writer :timestamps

      sig do
        params(
          details: T::Boolean,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        details: nil,
        follow: nil,
        since: nil,
        stderr: nil,
        stdout: nil,
        tail: nil,
        timestamps: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            details: T::Boolean,
            follow: T::Boolean,
            since: Integer,
            stderr: T::Boolean,
            stdout: T::Boolean,
            tail: String,
            timestamps: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
