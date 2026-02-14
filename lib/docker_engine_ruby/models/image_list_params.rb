# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#list
    class ImageListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute all
      #
      #   @return [Boolean, nil]
      optional :all, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute digests
      #
      #   @return [Boolean, nil]
      optional :digests, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute filters
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute manifests
      #
      #   @return [Boolean, nil]
      optional :manifests, DockerEngineRuby::Internal::Type::Boolean

      # @!attribute shared_size
      #
      #   @return [Boolean, nil]
      optional :shared_size, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(all: nil, digests: nil, filters: nil, manifests: nil, shared_size: nil, request_options: {})
      #   @param all [Boolean]
      #   @param digests [Boolean]
      #   @param filters [String]
      #   @param manifests [Boolean]
      #   @param shared_size [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
