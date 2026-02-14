# typed: strong

module DockerEngineRuby
  module Resources
    class Services
      # Create a service
      sig do
        params(
          spec: DockerEngineRuby::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::CreateResponse)
      end
      def create(
        # Body param: User modifiable configuration for a service.
        spec:,
        # Header param: A base64url-encoded auth configuration for pulling from private
        # registries.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
        x_registry_auth: nil,
        request_options: {}
      )
      end

      # Update a service
      sig do
        params(
          id: String,
          version: Integer,
          spec: DockerEngineRuby::ServiceUpdateParams::Spec::OrHash,
          registry_auth_from:
            DockerEngineRuby::ServiceUpdateParams::RegistryAuthFrom::OrSymbol,
          rollback: String,
          x_registry_auth: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::UpdateResponse)
      end
      def update(
        # Path param: ID or name of service.
        id,
        # Query param: The version number of the service object being updated. This is
        # required to avoid conflicting writes. This version number should be the value as
        # currently set on the service _before_ the update. You can find the current
        # version by calling `GET /services/{id}`
        version:,
        # Body param: User modifiable configuration for a service.
        spec:,
        # Query param: If the `X-Registry-Auth` header is not specified, this parameter
        # indicates where to find registry authorization credentials.
        registry_auth_from: nil,
        # Query param: Set to this parameter to `previous` to cause a server-side rollback
        # to the previous service spec. The supplied spec will be ignored in this case.
        rollback: nil,
        # Header param: A base64url-encoded auth configuration for pulling from private
        # registries.
        #
        # Refer to the [authentication section](#section/Authentication) for details.
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
      def list(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # services list.
        #
        # Available filters:
        #
        # - `id=<service id>`
        # - `label=<service label>`
        # - `mode=["replicated"|"global"]`
        # - `name=<service name>`
        filters: nil,
        # Include service status, with count of running and desired tasks.
        status: nil,
        request_options: {}
      )
      end

      # Delete a service
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(
        # ID or name of service.
        id,
        request_options: {}
      )
      end

      # Inspect a service
      sig do
        params(
          id: String,
          insert_defaults: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Service)
      end
      def inspect_(
        # ID or name of service.
        id,
        # Fill empty fields with default values.
        insert_defaults: nil,
        request_options: {}
      )
      end

      # Get `stdout` and `stderr` logs from a service. See also
      # [`/containers/{id}/logs`](#operation/ContainerLogs).
      #
      # **Note**: This endpoint works only for services with the `local`, `json-file` or
      # `journald` logging drivers.
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
        # ID or name of the service
        id,
        # Show service context and extra details provided to logs.
        details: nil,
        # Keep connection after returning logs.
        follow: nil,
        # Only return logs since this time, as a UNIX timestamp
        since: nil,
        # Return logs from `stderr`
        stderr: nil,
        # Return logs from `stdout`
        stdout: nil,
        # Only return this number of log lines from the end of the logs. Specify as an
        # integer or `all` to output all log lines.
        tail: nil,
        # Add timestamps to every log line
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
