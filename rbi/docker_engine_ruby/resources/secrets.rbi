# typed: strong

module DockerEngineRuby
  module Resources
    class Secrets
      # Create a secret
      sig do
        params(
          spec: DockerEngineRuby::SecretSpec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::SecretCreateResponse)
      end
      def create(spec:, request_options: {})
      end

      # Update a Secret
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineRuby::SecretSpec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param
        id,
        # Query param
        version:,
        # Body param
        spec:,
        request_options: {}
      )
      end

      # List secrets
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Secret])
      end
      def list(filters: nil, request_options: {})
      end

      # Delete a secret
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, request_options: {})
      end

      # Inspect a secret
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Secret)
      end
      def inspect_(id, request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
