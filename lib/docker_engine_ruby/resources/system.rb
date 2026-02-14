# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class System
      # Get data usage information
      #
      # @overload data_usage(type: nil, verbose: nil, request_options: {})
      #
      # @param type [Symbol, Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type::UnionMember1>, DockerEngineRuby::Models::SystemDataUsageParams::Type]
      # @param verbose [Boolean]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SystemDataUsageResponse]
      #
      # @see DockerEngineRuby::Models::SystemDataUsageParams
      def data_usage(params = {})
        parsed, options = DockerEngineRuby::SystemDataUsageParams.dump_request(params)
        @client.request(
          method: :get,
          path: "system/df",
          query: parsed,
          model: DockerEngineRuby::Models::SystemDataUsageResponse,
          options: options
        )
      end

      # Monitor events
      #
      # @overload events(filters: nil, since: nil, until_: nil, request_options: {})
      #
      # @param filters [String]
      # @param since [String]
      # @param until_ [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::SystemEventsResponse]
      #
      # @see DockerEngineRuby::Models::SystemEventsParams
      def events(params = {})
        parsed, options = DockerEngineRuby::SystemEventsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "events",
          query: parsed.transform_keys(until_: "until"),
          model: DockerEngineRuby::Models::SystemEventsResponse,
          options: options
        )
      end

      # Get system information
      #
      # @overload info(request_options: {})
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Info]
      #
      # @see DockerEngineRuby::Models::SystemInfoParams
      def info(params = {})
        @client.request(
          method: :get,
          path: "info",
          model: DockerEngineRuby::Info,
          options: params[:request_options]
        )
      end

      # Ping
      #
      # @overload ping(request_options: {})
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see DockerEngineRuby::Models::SystemPingParams
      def ping(params = {})
        @client.request(
          method: :get,
          path: "_ping",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
        )
      end

      # Get version
      #
      # @overload version(request_options: {})
      #
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Version]
      #
      # @see DockerEngineRuby::Models::SystemVersionParams
      def version(params = {})
        @client.request(
          method: :get,
          path: "version",
          model: DockerEngineRuby::Version,
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
