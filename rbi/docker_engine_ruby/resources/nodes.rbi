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
        # Path param
        id,
        # Query param
        version:,
        # Body param
        spec:,
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
      def list(filters: nil, request_options: {})
      end

      # Delete a node
      sig do
        params(
          id: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, force: nil, request_options: {})
      end

      # Inspect a node
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Node)
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
