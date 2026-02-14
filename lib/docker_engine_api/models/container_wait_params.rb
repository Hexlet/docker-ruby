# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#wait
    class ContainerWaitParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute condition
      #   Wait until a container state reaches the given condition.
      #
      #   Defaults to `not-running` if omitted or empty.
      #
      #   @return [Symbol, DockerEngineAPI::Models::ContainerWaitParams::Condition, nil]
      optional :condition, enum: -> { DockerEngineAPI::ContainerWaitParams::Condition }

      # @!method initialize(condition: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ContainerWaitParams} for more details.
      #
      #   @param condition [Symbol, DockerEngineAPI::Models::ContainerWaitParams::Condition] Wait until a container state reaches the given condition.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      module Condition
        extend DockerEngineAPI::Internal::Type::Enum

        NOT_RUNNING = :"not-running"
        NEXT_EXIT = :"next-exit"
        REMOVED = :removed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
