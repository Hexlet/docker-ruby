# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#delete
    class ContainerDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute force
      #   If the container is running, kill it before removing it.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute link
      #   Remove the specified link associated with the container.
      #
      #   @return [Boolean, nil]
      optional :link, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute v
      #   Remove anonymous volumes associated with the container.
      #
      #   @return [Boolean, nil]
      optional :v, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(force: nil, link: nil, v: nil, request_options: {})
      #   @param force [Boolean] If the container is running, kill it before removing it.
      #
      #   @param link [Boolean] Remove the specified link associated with the container.
      #
      #   @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
