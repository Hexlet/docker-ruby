# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#inspect_
    class NetworkInspectParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute scope
      #   Filter the network by scope (swarm, global, or local)
      #
      #   @return [String, nil]
      optional :scope, String

      # @!attribute verbose
      #   Detailed inspect output for troubleshooting
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(scope: nil, verbose: nil, request_options: {})
      #   @param scope [String] Filter the network by scope (swarm, global, or local)
      #
      #   @param verbose [Boolean] Detailed inspect output for troubleshooting
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
