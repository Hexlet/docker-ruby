# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#data_usage
    class SystemDataUsageParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute type
      #
      #   @return [Symbol, Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type::UnionMember1>, DockerEngineRuby::Models::SystemDataUsageParams::Type, nil]
      optional :type, union: -> { DockerEngineRuby::SystemDataUsageParams::Type }

      # @!attribute verbose
      #
      #   @return [Boolean, nil]
      optional :verbose, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(type: nil, verbose: nil, request_options: {})
      #   @param type [Symbol, Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type::UnionMember1>, DockerEngineRuby::Models::SystemDataUsageParams::Type]
      #   @param verbose [Boolean]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      module Type
        extend DockerEngineRuby::Internal::Type::Union

        variant const: -> { DockerEngineRuby::Models::SystemDataUsageParams::Type::CONTAINER }

        variant const: -> { DockerEngineRuby::Models::SystemDataUsageParams::Type::IMAGE }

        variant const: -> { DockerEngineRuby::Models::SystemDataUsageParams::Type::VOLUME }

        variant -> { DockerEngineRuby::Models::SystemDataUsageParams::Type::UnionMember1Array }

        module UnionMember1
          extend DockerEngineRuby::Internal::Type::Enum

          BUILD_CACHE = :"build-cache"

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Symbol, Array<Symbol, DockerEngineRuby::Models::SystemDataUsageParams::Type::UnionMember1>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol,
              T::Array[DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::TaggedSymbol]
            )
          end
        end

        # @!group

        CONTAINER = :container
        IMAGE = :image
        VOLUME = :volume

        # @!endgroup

        # @type [DockerEngineRuby::Internal::Type::Converter]
        UnionMember1Array =
          DockerEngineRuby::Internal::Type::ArrayOf[enum: -> {
            DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1
          }]
      end
    end
  end
end
