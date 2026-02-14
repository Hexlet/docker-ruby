# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Swarm#leave
    class SwarmLeaveParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute force
      #   Force leave swarm, even if this is the last manager or that it will break the
      #   cluster.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::SwarmLeaveParams} for more details.
      #
      #   @param force [Boolean] Force leave swarm, even if this is the last manager or that it will
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
