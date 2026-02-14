# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#get
    class ImageGetParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute platform
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(platform: nil, request_options: {})
      #   @param platform [Array<String>]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
