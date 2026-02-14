# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#data_usage
    class SystemDataUsageParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute type
      #   Object types, for which to compute and return data.
      #
      #   @return [Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type>, nil]
      optional :type,
               -> { DockerEngineRuby::Internal::Type::ArrayOf[enum: DockerEngineRuby::SystemDataUsageParams::Type] }

      # @!attribute verbose
      #   Show detailed information on space usage.
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(type: nil, verbose: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SystemDataUsageParams} for more details.
      #
      #   @param type [Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type>] Object types, for which to compute and return data.
      #
      #   @param verbose [Boolean] Show detailed information on space usage.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend DockerEngineRuby::Internal::Type::Enum

        CONTAINER = :container
        IMAGE = :image
        VOLUME = :volume
        BUILD_CACHE = :"build-cache"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
