# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#list
    class ServiceListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute filters
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute status
      #
      #   @return [Boolean, nil]
      optional :status, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(filters: nil, status: nil, request_options: {})
      #   @param filters [String]
      #   @param status [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
