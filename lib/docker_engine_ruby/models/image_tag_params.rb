# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#tag
    class ImageTagParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute repo
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(repo: nil, tag: nil, request_options: {})
      #   @param repo [String]
      #   @param tag [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
