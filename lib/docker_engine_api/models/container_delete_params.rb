# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#delete
    class ContainerDeleteParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute force
      #   If the container is running, kill it before removing it.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute link
      #   Remove the specified link associated with the container.
      #
      #   @return [Boolean, nil]
      optional :link, DockerEngineAPI::Internal::Type::Boolean

      # @!attribute v
      #   Remove anonymous volumes associated with the container.
      #
      #   @return [Boolean, nil]
      optional :v, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(force: nil, link: nil, v: nil, request_options: {})
      #   @param force [Boolean] If the container is running, kill it before removing it.
      #
      #   @param link [Boolean] Remove the specified link associated with the container.
      #
      #   @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
