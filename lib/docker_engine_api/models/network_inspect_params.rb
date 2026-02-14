# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Networks#inspect_
    class NetworkInspectParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute scope
      #   Filter the network by scope (swarm, global, or local)
      #
      #   @return [String, nil]
      optional :scope, String

      # @!attribute verbose
      #   Detailed inspect output for troubleshooting
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(scope: nil, verbose: nil, request_options: {})
      #   @param scope [String] Filter the network by scope (swarm, global, or local)
      #
      #   @param verbose [Boolean] Detailed inspect output for troubleshooting
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
