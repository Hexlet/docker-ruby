# frozen_string_literal: true

module DockerEngineAPI
  module Resources
    class Distribution
      # Return image digest and platform information by contacting the registry.
      #
      # @overload inspect_(name, request_options: {})
      #
      # @param name [String] Image name or id
      #
      # @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DockerEngineAPI::Models::Inspect]
      #
      # @see DockerEngineAPI::Models::DistributionInspectParams
      def inspect_(name, params = {})
        @client.request(
          method: :get,
          path: ["distribution/%1$s/json", name],
          model: DockerEngineAPI::Inspect,
          options: params[:request_options]
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
