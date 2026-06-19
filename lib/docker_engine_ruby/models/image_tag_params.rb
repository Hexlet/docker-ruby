# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#tag
    class ImageTagParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute repo
      #
      #   @return [String, nil]
      optional :repo, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(name:, repo: nil, tag: nil, request_options: {})
      #   @param name [String]
      #   @param repo [String]
      #   @param tag [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
