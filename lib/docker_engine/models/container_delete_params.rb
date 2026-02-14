# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#delete
    class ContainerDeleteParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute force
      #   If the container is running, kill it before removing it.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngine::Internal::Type::Boolean

      # @!attribute link
      #   Remove the specified link associated with the container.
      #
      #   @return [Boolean, nil]
      optional :link, DockerEngine::Internal::Type::Boolean

      # @!attribute v
      #   Remove anonymous volumes associated with the container.
      #
      #   @return [Boolean, nil]
      optional :v, DockerEngine::Internal::Type::Boolean

      # @!method initialize(force: nil, link: nil, v: nil, request_options: {})
      #   @param force [Boolean] If the container is running, kill it before removing it.
      #
      #   @param link [Boolean] Remove the specified link associated with the container.
      #
      #   @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
