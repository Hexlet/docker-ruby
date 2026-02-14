# typed: strong

module DockerEngine
  module Resources
    class System
      # Get system information
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          DockerEngine::Models::SystemInfoResponse
        )
      end
      def info(request_options: {})
      end

      # This is a dummy endpoint you can use to test if the server is accessible.
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          String
        )
      end
      def ping(request_options: {})
      end

      # Returns the version of Docker that is running and various information about the
      # system that Docker is running on.
      sig do
        params(request_options: DockerEngine::RequestOptions::OrHash).returns(
          DockerEngine::Models::SystemVersionResponse
        )
      end
      def version(request_options: {})
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
