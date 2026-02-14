# typed: strong

module DockerEngineRuby
  module Resources
    class Secrets
      # Create a secret
      sig do
        params(
          spec: DockerEngineRuby::SecretCreateParams::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::SecretCreateResponse)
      end
      def create(spec: nil, request_options: {})
      end

      # Update a Secret
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineRuby::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The ID or name of the secret
        id,
        # Query param: The version number of the secret object being updated. This is
        # required to avoid conflicting writes.
        version:,
        # Body param
        spec: nil,
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
      def list(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # secrets list.
        #
        # Available filters:
        #
        # - `id=<secret id>`
        # - `label=<key> or label=<key>=value`
        # - `name=<secret name>`
        # - `names=<secret name>`
        filters: nil,
        request_options: {}
      )
      end

      # Delete a secret
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(
        # ID of the secret
        id,
        request_options: {}
      )
      end

      # Inspect a secret
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Secret)
      end
      def inspect_(
        # ID of the secret
        id,
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
