# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Secrets
      # Create a secret
      #
      # @overload create(spec: nil, request_options: {})
      #
      # @param spec [DockerEngineRuby::Models::SecretCreateParams::Spec]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SecretCreateResponse]
      #
      # @see DockerEngineRuby::Models::SecretCreateParams
      def create(params = {})
        parsed, options = DockerEngineRuby::SecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "secrets/create",
          body: parsed[:spec],
          model: DockerEngineRuby::Models::SecretCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {DockerEngineRuby::Models::SecretUpdateParams} for more details.
      #
      # Update a Secret
      #
      # @overload update(id, version:, spec: nil, request_options: {})
      #
      # @param id [String] Path param: The ID or name of the secret
      #
      # @param version [Integer] Query param: The version number of the secret object being updated. This is
      #
      # @param spec [DockerEngineRuby::Models::Spec] Body param
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SecretUpdateParams
      def update(id, params)
        parsed, options = DockerEngineRuby::SecretUpdateParams.dump_request(params)
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
      # {DockerEngineRuby::Models::SecretListParams} for more details.
      #
      # List secrets
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<DockerEngineRuby::Models::Secret>]
      #
      # @see DockerEngineRuby::Models::SecretListParams
      def list(params = {})
        parsed, options = DockerEngineRuby::SecretListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "secrets",
          query: parsed,
          model: DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Secret],
          options: options
        )
      end

      # Delete a secret
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] ID of the secret
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::SecretDeleteParams
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
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Secret]
      #
      # @see DockerEngineRuby::Models::SecretInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["secrets/%1$s", id],
          model: DockerEngineRuby::Secret,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [DockerEngineRuby::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
