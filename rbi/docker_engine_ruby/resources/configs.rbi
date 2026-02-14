# typed: strong

module DockerEngineRuby
  module Resources
    class Configs
      # Create a config
      sig do
        params(
          spec: DockerEngineRuby::Spec::OrHash,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Models::ConfigCreateResponse)
      end
      def create(spec:, request_options: {})
      end

      # Update a Config
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

      # List configs
      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T::Array[DockerEngineRuby::Config])
      end
      def list(filters: nil, request_options: {})
      end

      # Delete a config
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).void
      end
      def delete(id, request_options: {})
      end

      # Inspect a config
      sig do
        params(
          id: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(DockerEngineRuby::Config)
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
