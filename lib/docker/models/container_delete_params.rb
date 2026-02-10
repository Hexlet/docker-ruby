# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#delete
    class ContainerDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute force
      #   If the container is running, kill it before removing it.
      #
      #   @return [Boolean, nil]
      optional :force, Docker::Internal::Type::Boolean

      # @!attribute link
      #   Remove the specified link associated with the container.
      #
      #   @return [Boolean, nil]
      optional :link, Docker::Internal::Type::Boolean

      # @!attribute v
      #   Remove anonymous volumes associated with the container.
      #
      #   @return [Boolean, nil]
      optional :v, Docker::Internal::Type::Boolean

      # @!method initialize(force: nil, link: nil, v: nil, request_options: {})
      #   @param force [Boolean] If the container is running, kill it before removing it.
      #
      #   @param link [Boolean] Remove the specified link associated with the container.
      #
      #   @param v [Boolean] Remove anonymous volumes associated with the container.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
