# typed: strong

module DockerEngineAPI
  module Resources
    class Nodes
      # Update a node
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineAPI::Spec::OrHash,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param: The ID of the node
        id,
        # Query param: The version number of the node object being updated. This is
        # required to avoid conflicting writes.
        version:,
        # Body param
        spec: nil,
        request_options: {}
      )
      end

      # List nodes
      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineAPI::Node])
      end
      def list(
        # Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `id=<node id>`
        # - `label=<engine label>`
        # - `membership=`(`accepted`|`pending`)`
        # - `name=<node name>`
        # - `node.label=<node label>`
        # - `role=`(`manager`|`worker`)`
        filters: nil,
        request_options: {}
      )
      end

      # Delete a node
      sig do
        params(
          id: String,
          force: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The ID or name of the node
        id,
        # Force remove a node from the swarm
        force: nil,
        request_options: {}
      )
      end

      # Inspect a node
      sig do
        params(
          id: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(DockerEngineAPI::Node)
      end
      def inspect_(
        # The ID or name of the node
        id,
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
