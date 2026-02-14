# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::System#data_usage
    class SystemDataUsageParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute type
      #   Object types, for which to compute and return data.
      #
      #   @return [Array<Symbol, DockerEngine::Models::SystemDataUsageParams::Type>, nil]
      optional :type,
               -> { DockerEngine::Internal::Type::ArrayOf[enum: DockerEngine::SystemDataUsageParams::Type] }

      # @!attribute verbose
      #   Show detailed information on space usage.
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngine::Internal::Type::Boolean

      # @!method initialize(type: nil, verbose: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::SystemDataUsageParams} for more details.
      #
      #   @param type [Array<Symbol, DockerEngine::Models::SystemDataUsageParams::Type>] Object types, for which to compute and return data.
      #
      #   @param verbose [Boolean] Show detailed information on space usage.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend DockerEngine::Internal::Type::Enum

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
