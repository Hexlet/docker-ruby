# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Exec
      # Inspect an exec instance
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::ExecInspectResponse]
      #
      # @see DockerEngineRuby::Models::ExecInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["exec/%1$s/json", id],
          model: DockerEngineRuby::Models::ExecInspectResponse,
          options: params[:request_options]
        )
      end

      # Resize an exec instance
      #
      # @overload resize(id, h:, w:, request_options: {})
      #
      # @param id [String]
      # @param h [Integer]
      # @param w [Integer]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ExecResizeParams
      def resize(id, params)
        parsed, options = DockerEngineRuby::ExecResizeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["exec/%1$s/resize", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Start an exec instance
      #
      # @overload start(id, console_size: nil, detach: nil, tty: nil, request_options: {})
      #
      # @param id [String]
      # @param console_size [Array<Integer>, nil]
      # @param detach [Boolean]
      # @param tty [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineRuby::Models::ExecStartParams
      def start(id, params = {})
        parsed, options = DockerEngineRuby::ExecStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["exec/%1$s/start", id],
          body: parsed,
          model: NilClass,
          options: options
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
