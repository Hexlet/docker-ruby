# typed: strong

module DockerEngineRuby
  module Resources
    class Services
      # Create a service
      sig do
        params(
          spec: DockerEngineRuby::Spec::OrHash,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::CreateResponse)
      end
      def create(
        # Body param: User modifiable configuration for a service.
        spec:,
        # Header param
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Update a service
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineRuby::Spec::OrHash,
          registry_auth_from:
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
          rollback: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::UpdateResponse)
      end
      def update(
        # Path param
        id,
        # Query param
        version:,
        # Body param: User modifiable configuration for a service.
        spec:,
        # Query param
        registry_auth_from: nil,
        # Query param
        rollback: nil,
        # Header param
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # List services
      sig do
        params(
          filters: String,
          status: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Service])
      end
      def list(filters: nil, status: nil, request_options: {})
      end

      # Delete a service
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, request_options: {})
      end

      # Inspect a service
      sig do
        params(
          id: String,
          insert_defaults: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Service)
      end
      def inspect_(id, insert_defaults: nil, request_options: {})
      end

      # Get service logs
      sig do
        params(
          id: String,
          details: T::Boolean,
          follow: T::Boolean,
          since: Integer,
          stderr: T::Boolean,
          stdout: T::Boolean,
          tail: String,
          timestamps: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def logs(
        id,
        details: nil,
        follow: nil,
        since: nil,
        stderr: nil,
        stdout: nil,
        tail: nil,
        timestamps: nil,
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
