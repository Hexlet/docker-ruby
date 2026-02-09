# typed: strong

module Docker
  module Resources
    class Services
      # Create a service
      sig do
        params(
          spec: Docker::ServiceCreateParams::Spec::OrHash,
          x_registry_auth: String,
          request_options: Docker::RequestOptions::OrHash
        ).returns(Docker::Models::ServiceCreateResponse)
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

      # List services
      sig do
        params(
          filters: String,
          status: T::Boolean,
          request_options: Docker::RequestOptions::OrHash
        ).returns(T::Array[Docker::Service])
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
        params(id: String, request_options: Docker::RequestOptions::OrHash).void
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
          request_options: Docker::RequestOptions::OrHash
        ).returns(Docker::Service)
      end
      def inspect_(
        # ID or name of service.
        id,
        # Fill empty fields with default values.
        insert_defaults: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Docker::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
