# frozen_string_literal: true

module DockerEngine
  module Resources
    class System
      # Get system information
      #
      # @overload info(request_options: {})
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::SystemInfoResponse]
      #
      # @see DockerEngine::Models::SystemInfoParams
      def info(params = {})
        @client.request(
          method: :get,
          path: "info",
          model: DockerEngine::Models::SystemInfoResponse,
          options: params[:request_options]
        )
      end

      # This is a dummy endpoint you can use to test if the server is accessible.
      #
      # @overload ping(request_options: {})
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see DockerEngine::Models::SystemPingParams
      def ping(params = {})
        @client.request(
          method: :get,
          path: "_ping",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
        )
      end

      # Returns the version of Docker that is running and various information about the
      # system that Docker is running on.
      #
      # @overload version(request_options: {})
      #
      # @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngine::Models::SystemVersionResponse]
      #
      # @see DockerEngine::Models::SystemVersionParams
      def version(params = {})
        @client.request(
          method: :get,
          path: "version",
          model: DockerEngine::Models::SystemVersionResponse,
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
