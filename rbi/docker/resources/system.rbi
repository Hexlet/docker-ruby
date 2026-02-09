# typed: strong

module Docker
  module Resources
    class System
      # Get system information
      sig do
        params(request_options: Docker::RequestOptions::OrHash).returns(
          Docker::Models::SystemInfoResponse
        )
      end
      def info(request_options: {})
      end

      # This is a dummy endpoint you can use to test if the server is accessible.
      sig do
        params(request_options: Docker::RequestOptions::OrHash).returns(String)
      end
      def ping(request_options: {})
      end

      # Returns the version of Docker that is running and various information about the
      # system that Docker is running on.
      sig do
        params(request_options: Docker::RequestOptions::OrHash).returns(
          Docker::Models::SystemVersionResponse
        )
      end
      def version(request_options: {})
      end

      # @api private
      sig { params(client: Docker::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
