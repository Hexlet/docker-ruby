# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Networks#inspect_
    class NetworkInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute scope
      #   Filter the network by scope (swarm, global, or local)
      #
      #   @return [String, nil]
      optional :scope, String

      # @!attribute verbose
      #   Detailed inspect output for troubleshooting
      #
      #   @return [Boolean, nil]
      optional :verbose, Docker::Internal::Type::Boolean

      # @!method initialize(scope: nil, verbose: nil, request_options: {})
      #   @param scope [String] Filter the network by scope (swarm, global, or local)
      #
      #   @param verbose [Boolean] Detailed inspect output for troubleshooting
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
