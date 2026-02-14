# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#search
    class ImageSearchParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute term
      #
      #   @return [String]
      required :term, String

      # @!attribute filters
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(term:, filters: nil, limit: nil, request_options: {})
      #   @param term [String]
      #   @param filters [String]
      #   @param limit [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
