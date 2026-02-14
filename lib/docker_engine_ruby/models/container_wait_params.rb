# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#wait
    class ContainerWaitParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute condition
      #
      #   @return [Symbol, DockerEngineRuby::Models::ContainerWaitParams::Condition, nil]
      optional :condition, enum: -> { DockerEngineRuby::ContainerWaitParams::Condition }

      # @!method initialize(condition: nil, request_options: {})
      #   @param condition [Symbol, DockerEngineRuby::Models::ContainerWaitParams::Condition]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      module Condition
        extend DockerEngineRuby::Internal::Type::Enum

        NOT_RUNNING = :"not-running"
        NEXT_EXIT = :"next-exit"
        REMOVED = :removed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
