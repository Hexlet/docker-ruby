# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#load_
    class ImageLoadParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Object]
      required :body, DockerEngineRuby::Internal::Type::Unknown

      # @!attribute platform
      #
      #   @return [Array<String>, nil]
      optional :platform, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!attribute quiet
      #
      #   @return [Boolean, nil]
      optional :quiet, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(body:, platform: nil, quiet: nil, request_options: {})
      #   @param body [Object]
      #   @param platform [Array<String>]
      #   @param quiet [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
