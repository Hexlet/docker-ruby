# typed: strong

module DockerEngineRuby
  module Resources
    class Distribution
      # Return image digest and platform information by contacting the registry.
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Inspect)
      end
      def inspect_(
        # Image name or id
        name,
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
