# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Networks#inspect_
    class NetworkInspectParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute scope
      #   Filter the network by scope (swarm, global, or local)
      #
      #   @return [String, nil]
      optional :scope, String

      # @!attribute verbose
      #   Detailed inspect output for troubleshooting
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngine::Internal::Type::Boolean

      # @!method initialize(scope: nil, verbose: nil, request_options: {})
      #   @param scope [String] Filter the network by scope (swarm, global, or local)
      #
      #   @param verbose [Boolean] Detailed inspect output for troubleshooting
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
