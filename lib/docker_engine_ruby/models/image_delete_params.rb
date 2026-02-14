# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#delete
    class ImageDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute force
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute noprune
      #
      #   @return [Boolean, nil]
      optional :noprune, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute platforms
      #
      #   @return [Array<String>, nil]
      optional :platforms, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(force: nil, noprune: nil, platforms: nil, request_options: {})
      #   @param force [Boolean]
      #   @param noprune [Boolean]
      #   @param platforms [Array<String>]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
