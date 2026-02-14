# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Exec
      # Return low-level information about an exec instance.
      #
      # @overload inspect_(id, request_options: {})
      #
      # @param id [String] Exec instance ID
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::ExecInspectResponse]
      #
      # @see DockerEngineAPI::Models::ExecInspectParams
      def inspect_(id, params = {})
        @client.request(
          method: :get,
          path: ["exec/%1$s/json", id],
          model: DockerEngineAPI::Models::ExecInspectResponse,
          options: params[:request_options]
        )
      end

      # Resize the TTY session used by an exec instance. This endpoint only works if
      # `tty` was specified as part of creating and starting the exec instance.
      #
      # @overload resize(id, h:, w:, request_options: {})
      #
      # @param id [String] Exec instance ID
      #
      # @param h [Integer] Height of the TTY session in characters
      #
      # @param w [Integer] Width of the TTY session in characters
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ExecResizeParams
      def resize(id, params)
        parsed, options = DockerEngineAPI::ExecResizeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["exec/%1$s/resize", id],
          query: parsed,
          model: NilClass,
          options: options
        )
      end

      # Starts a previously set up exec instance. If detach is true, this endpoint
      # returns immediately after starting the command. Otherwise, it sets up an
      # interactive session with the command.
      #
      # @overload start(id, console_size: nil, detach: nil, tty: nil, request_options: {})
      #
      # @param id [String] Exec instance ID
      #
      # @param console_size [Array<Integer>, nil] Initial console size, as an `[height, width]` array.
      #
      # @param detach [Boolean] Detach from the command.
      #
      # @param tty [Boolean] Allocate a pseudo-TTY.
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see DockerEngineAPI::Models::ExecStartParams
      def start(id, params = {})
        parsed, options = DockerEngineAPI::ExecStartParams.dump_request(params)
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
      # @param client [DockerEngineAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
