# frozen_string_literal: true

module DockerEngineRuby
  module Resources
    class Distribution
      # Get image information from the registry
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String]
      # @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineRuby::Models::Inspect]
      #
      # @see DockerEngineRuby::Models::DistributionInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["distribution/%1$s/json", name],
          model: DockerEngineRuby::Inspect,
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
