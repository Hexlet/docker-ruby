# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#list
    class ContainerListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute all
      #
      #   @return [Boolean, nil]
      optional :all, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute filters
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute size
      #
      #   @return [Boolean, nil]
      optional :size, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(all: nil, filters: nil, limit: nil, size: nil, request_options: {})
      #   @param all [Boolean]
      #   @param filters [String]
      #   @param limit [Integer]
      #   @param size [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
