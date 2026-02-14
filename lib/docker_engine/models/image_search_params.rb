# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#search
    class ImageSearchParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute term
      #   Term to search
      #
      #   @return [String]
      required :term, String

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   images list. Available filters:
      #
      #   - `is-official=(true|false)`
      #   - `stars=<number>` Matches images that has at least 'number' stars.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(term:, filters: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageSearchParams} for more details.
      #
      #   @param term [String] Term to search
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
