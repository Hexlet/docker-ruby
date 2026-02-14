# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#delete
    class ContainerDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute force
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute link
      #
      #   @return [Boolean, nil]
      optional :link, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute v
      #
      #   @return [Boolean, nil]
      optional :v, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(force: nil, link: nil, v: nil, request_options: {})
      #   @param force [Boolean]
      #   @param link [Boolean]
      #   @param v [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
