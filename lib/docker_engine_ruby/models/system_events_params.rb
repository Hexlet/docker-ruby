# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#events
    class SystemEventsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute filters
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute since
      #
      #   @return [String, nil]
      optional :since, String

      # @!attribute until_
      #
      #   @return [String, nil]
      optional :until_, String

      # @!method initialize(filters: nil, since: nil, until_: nil, request_options: {})
      #   @param filters [String]
      #   @param since [String]
      #   @param until_ [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
