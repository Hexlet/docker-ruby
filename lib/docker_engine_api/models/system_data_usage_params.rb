# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::System#data_usage
    class SystemDataUsageParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute type
      #   Object types, for which to compute and return data.
      #
      #   @return [Array<Symbol, DockerEngineAPI::Models::SystemDataUsageParams::Type>, nil]
      optional :type,
               -> { DockerEngineAPI::Internal::Type::ArrayOf[enum: DockerEngineAPI::SystemDataUsageParams::Type] }

      # @!attribute verbose
      #   Show detailed information on space usage.
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(type: nil, verbose: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::SystemDataUsageParams} for more details.
      #
      #   @param type [Array<Symbol, DockerEngineAPI::Models::SystemDataUsageParams::Type>] Object types, for which to compute and return data.
      #
      #   @param verbose [Boolean] Show detailed information on space usage.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend DockerEngineAPI::Internal::Type::Enum

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
