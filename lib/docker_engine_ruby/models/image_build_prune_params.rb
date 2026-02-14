# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#build_prune
    class ImageBuildPruneParams < DockerEngineRuby::Internal::Type::BaseModel
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

      # @!attribute max_used_space
      #
      #   @return [Integer, nil]
      optional :max_used_space, Integer

      # @!attribute min_free_space
      #
      #   @return [Integer, nil]
      optional :min_free_space, Integer

      # @!attribute reserved_space
      #
      #   @return [Integer, nil]
      optional :reserved_space, Integer

      # @!method initialize(all: nil, filters: nil, max_used_space: nil, min_free_space: nil, reserved_space: nil, request_options: {})
      #   @param all [Boolean]
      #   @param filters [String]
      #   @param max_used_space [Integer]
      #   @param min_free_space [Integer]
      #   @param reserved_space [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
