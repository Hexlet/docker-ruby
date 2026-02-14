# typed: strong

module DockerEngineRuby
  module Resources
    class Volumes
      # Create a volume
      sig do
        params(
          create_request: DockerEngineRuby::CreateRequest::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Volume)
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
          spec: DockerEngineRuby::VolumeUpdateParams::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def update(
        # Path param
        name,
        # Query param
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
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::ListResponse)
      end
      def list(filters: nil, request_options: {})
      end

      # Remove a volume
      sig do
        params(
          name: String,
          force: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(name, force: nil, request_options: {})
      end

      # Inspect a volume
      sig do
        params(
          name: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Volume)
      end
      def inspect_(name, request_options: {})
      end

      # Delete unused volumes
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::VolumePruneResponse)
      end
      def prune(filters: nil, request_options: {})
      end

      # @api private
      sig { params(client: DockerEngineRuby::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
