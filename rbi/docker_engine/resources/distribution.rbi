# typed: strong

module DockerEngine
  module Resources
    class Distribution
      # Return image digest and platform information by contacting the registry.
      sig do
        params(
          name: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Inspect)
      end
      def inspect_(
        # Image name or id
        name,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngine::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
