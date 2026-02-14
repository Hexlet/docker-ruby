# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Nodes#delete
    class NodeDeleteParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute force
      #   Force remove a node from the swarm
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngine::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   @param force [Boolean] Force remove a node from the swarm
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
