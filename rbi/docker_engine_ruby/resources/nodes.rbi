# typed: strong

module DockerEngineRuby
  module Resources
    class Nodes
      # Update a node
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineRuby::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Node])
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Node)
      end
      def inspect_(
        # The ID or name of the node
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
