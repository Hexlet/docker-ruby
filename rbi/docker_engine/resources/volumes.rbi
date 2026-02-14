# typed: strong

module DockerEngine
  module Resources
    class Volumes
      # Create a volume
      sig do
        params(
          create_request: DockerEngine::CreateRequest::OrHash,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Volume)
      end
      def create(
        # Volume configuration
        create_request:,
        request_options: {}
      )
      end

      # List volumes
      sig do
        params(
          filters: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Models::VolumeListResponse)
      end
      def list(
        # JSON encoded value of the filters (a `map[string][]string`) to process on the
        # volumes list. Available filters:
        #
        # - `dangling=<boolean>` When set to `true` (or `1`), returns all volumes that are
        #   not in use by a container. When set to `false` (or `0`), only volumes that are
        #   in use by one or more containers are returned.
        # - `driver=<volume-driver-name>` Matches volumes based on their driver.
        # - `label=<key>` or `label=<key>:<value>` Matches volumes based on the presence
        #   of a `label` alone or a `label` and a value.
        # - `name=<volume-name>` Matches all or part of a volume name.
        filters: nil,
        request_options: {}
      )
      end

      # Instruct the driver to remove the volume.
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Volume name or ID
        name,
        # Force the removal of the volume
        force: nil,
        request_options: {}
      )
      end

      # Inspect a volume
      sig do
        params(
          name: String,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(DockerEngine::Volume)
      end
      def inspect_(
        # Volume name or ID
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
