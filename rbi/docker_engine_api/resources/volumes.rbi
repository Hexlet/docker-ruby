# typed: strong

module DockerEngineAPI
  module Resources
    class Volumes
      # Create a volume
      sig do
        params(
          create_request: DockerEngineAPI::CreateRequest::OrHash,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Volume)
      end
      def create(
        # Volume configuration
        create_request:,
        request_options: {}
      )
      end

      # "Update a volume. Valid only for Swarm cluster volumes"
      sig do
        params(
          name: String,
          version: Integer,
          spec: DockerEngineAPI::VolumeUpdateParams::Spec::OrHash,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The name or ID of the volume
        name,
        # Query param: The version number of the volume being updated. This is required to
        # avoid conflicting writes. Found in the volume's `ClusterVolume` field.
        version:,
        # Body param: Cluster-specific options used to create the volume.
        spec: nil,
        request_options: {}
      )
      end

      # List volumes
      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::ListResponse)
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Volume)
      end
      def inspect_(
        # Volume name or ID
        name,
        request_options: {}
      )
      end

      # Delete unused volumes
      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Models::VolumePruneResponse)
      end
      def prune(
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...`
        #   is used) the specified labels.
        # - `all` (`all=true`) - Consider all (local) volumes for pruning and not just
        #   anonymous volumes.
        filters: nil,
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
