# typed: strong

module DockerEngine
  module Resources
    class Configs
      # Create a config
      sig do
        params(
          spec: DockerEngine::ConfigCreateParams::Spec::OrHash,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::ConfigCreateResponse)
      end
      def create(spec: nil, request_options: {})
      end

      # Update a Config
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngine::Spec::OrHash,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The ID or name of the config
        id,
        # Query param: The version number of the config object being updated. This is
        # required to avoid conflicting writes.
        version:,
        # Body param
        spec: nil,
        request_options: {}
      )
      end

      # List configs
      sig do
        params(
          filters: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T::Array[DockerEngine::Config])
      end
      def list(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # configs list.
        #
        # Available filters:
        #
        # - `id=<config id>`
        # - `label=<key> or label=<key>=value`
        # - `name=<config name>`
        # - `names=<config name>`
        filters: nil,
        request_options: {}
      )
      end

      # Delete a config
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def delete(
        # ID of the config
        id,
        request_options: {}
      )
      end

      # Inspect a config
      sig do
        params(
          id: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Config)
      end
      def inspect_(
        # ID of the config
        id,
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
