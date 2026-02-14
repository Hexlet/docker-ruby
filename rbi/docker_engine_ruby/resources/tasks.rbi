# typed: strong

module DockerEngineRuby
  module Resources
    class Tasks
      # List tasks
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Task])
      end
      def list(filters: nil, request_options: {})
      end

      # Inspect a task
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Task)
      end
      def inspect_(id, request_options: {})
      end

      # Get task logs
      sig do
        params(
          id: String,
          details: T::Boolean,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def logs(
        id,
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

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
