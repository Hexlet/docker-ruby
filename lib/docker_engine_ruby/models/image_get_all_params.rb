# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#get_all
    class ImageGetAllParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute names
      #
      #   @return [Array<String>, nil]
      optional :names, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute platform
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(names: nil, platform: nil, request_options: {})
      #   @param names [Array<String>]
      #   @param platform [Array<String>]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
