# typed: strong

module DockerEngineAPI
  module Resources
    class Distribution
      # Return image digest and platform information by contacting the registry.
      sig do
        params(
          name: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Inspect)
      end
      def inspect_(
        # Image name or id
        name,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DockerEngineAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
