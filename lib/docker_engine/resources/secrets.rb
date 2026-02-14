# frozen_string_literal: true

module DockerEngine
  module Resources
    class Secrets
      # Create a secret
      #
      # @overload create(spec: nil, request_options: {})
      #
      # @param spec [DockerEngine::Models::SecretCreateParams::Spec]
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::SecretCreateResponse]
      #
      # @see DockerEngine::Models::SecretCreateParams
      def create(params = {})
        parsed, options = DockerEngine::SecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "secrets/create",
          body: parsed[:spec],
          model: DockerEngine::Models::SecretCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::SecretUpdateParams} for more details.
      #
      # Update a Secret
      #
      # @overload update(id, version:, spec: nil, request_options: {})
      #
      # @param id [String] Path param: The ID or name of the secret
      #
      # @param version [Integer] Query param: The version number of the secret object being updated. This is
      #
      # @param spec [DockerEngine::Models::Spec] Body param
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::SecretUpdateParams
      def update(id, params)
        parsed, options = DockerEngine::SecretUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["secrets/%1$s/update", id],
          query: parsed.except(:spec),
          body: parsed[:spec],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngine::Models::SecretListParams} for more details.
      #
      # List secrets
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngine::Models::Secret>]
      #
      # @see DockerEngine::Models::SecretListParams
      def list(params = {})
        parsed, options = DockerEngine::SecretListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "secrets",
          query: parsed,
          model: DockerEngine::Internal::Type::ArrayOf[DockerEngine::Secret],
          options: options
        )
      end

      # Delete a secret
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID of the secret
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngine::Models::SecretDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["secrets/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Inspect a secret
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String] ID of the secret
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::Secret]
      #
      # @see DockerEngine::Models::SecretInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["secrets/%1$s", id],
          model: DockerEngine::Secret,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [DockerEngine::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
