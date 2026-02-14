# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#wait
    class ContainerWaitParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute condition
      #   Wait until a container state reaches the given condition.
      #
      #   Defaults to `not-running` if omitted or empty.
      #
      #   @return [Symbol, DockerEngine::Models::ContainerWaitParams::Condition, nil]
      optional :condition, enum: -> { DockerEngine::ContainerWaitParams::Condition }

      # @!method initialize(condition: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerWaitParams} for more details.
      #
      #   @param condition [Symbol, DockerEngine::Models::ContainerWaitParams::Condition] Wait until a container state reaches the given condition.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      module Condition
        extend DockerEngine::Internal::Type::Enum

        NOT_RUNNING = :"not-running"
        NEXT_EXIT = :"next-exit"
        REMOVED = :removed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
