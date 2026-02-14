# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Secrets
      # Create a secret
      #
      # @overload create(spec:, request_options: {})
      #
      # @param spec [DockerEngineRuby::Models::SecretSpec]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SecretCreateResponse]
      #
      # @see DockerEngineRuby::Models::SecretCreateParams
      def create(params)
        parsed, options = DockerEngineRuby::SecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "secrets/create",
          body: parsed[:spec],
          model: DockerEngineRuby::Models::SecretCreateResponse,
          options: options
        )
      end

      # Update a Secret
      #
      # @overload update(id, version:, spec:, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param version [Integer] Query param
      #
      # @param spec [DockerEngineRuby::Models::SecretSpec] Body param
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

      # List secrets
      #
      # @overload list(filters: nil, request_options: {})
      #
      # @param filters [String]
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
      # @param id [String]
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
      # @param id [String]
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
