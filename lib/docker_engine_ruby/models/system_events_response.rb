# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#events
    class SystemEventsResponse < DockerEngineRuby::Internal::Type::BaseModel
      # @!attribute action
      #   The type of event
      #
      #   @return [String, nil]
      optional :action, String, api_name: :Action

      # @!attribute actor
      #   Actor describes something that generates events, like a container, network, or a
      #   volume.
      #
      #   @return [DockerEngineRuby::Models::SystemEventsResponse::Actor, nil]
      optional :actor, -> { DockerEngineRuby::Models::SystemEventsResponse::Actor }, api_name: :Actor

      # @!attribute scope
      #   Scope of the event. Engine events are `local` scope. Cluster (Swarm) events are
      #   `swarm` scope.
      #
      #   @return [Symbol, DockerEngineRuby::Models::SystemEventsResponse::Scope, nil]
      optional :scope, enum: -> { DockerEngineRuby::Models::SystemEventsResponse::Scope }

      # @!attribute time
      #   Timestamp of event
      #
      #   @return [Integer, nil]
      optional :time, Integer

      # @!attribute time_nano
      #   Timestamp of event, with nanosecond accuracy
      #
      #   @return [Integer, nil]
      optional :time_nano, Integer, api_name: :timeNano

      # @!attribute type
      #   The type of object emitting the event
      #
      #   @return [Symbol, DockerEngineRuby::Models::SystemEventsResponse::Type, nil]
      optional :type, enum: -> { DockerEngineRuby::Models::SystemEventsResponse::Type }, api_name: :Type

      # @!method initialize(action: nil, actor: nil, scope: nil, time: nil, time_nano: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SystemEventsResponse} for more details.
      #
      #   EventMessage represents the information an event contains.
      #
      #   @param action [String] The type of event
      #
      #   @param actor [DockerEngineRuby::Models::SystemEventsResponse::Actor] Actor describes something that generates events, like a container, network,
      #
      #   @param scope [Symbol, DockerEngineRuby::Models::SystemEventsResponse::Scope] Scope of the event. Engine events are `local` scope. Cluster (Swarm)
      #
      #   @param time [Integer] Timestamp of event
      #
      #   @param time_nano [Integer] Timestamp of event, with nanosecond accuracy
      #
      #   @param type [Symbol, DockerEngineRuby::Models::SystemEventsResponse::Type] The type of object emitting the event

      # @see DockerEngineRuby::Models::SystemEventsResponse#actor
      class Actor < DockerEngineRuby::Internal::Type::BaseModel
        # @!attribute attributes
        #   Various key/value attributes of the object, depending on its type.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :attributes, DockerEngineRuby::Internal::Type::HashOf[String], api_name: :Attributes

        # @!attribute id
        #   The ID of the object emitting the event
        #
        #   @return [String, nil]
        optional :id, String, api_name: :ID

        # @!method initialize(attributes: nil, id: nil)
        #   Actor describes something that generates events, like a container, network, or a
        #   volume.
        #
        #   @param attributes [Hash{Symbol=>String}] Various key/value attributes of the object, depending on its type.
        #
        #   @param id [String] The ID of the object emitting the event
      end

      # Scope of the event. Engine events are `local` scope. Cluster (Swarm) events are
      # `swarm` scope.
      #
      # @see DockerEngineRuby::Models::SystemEventsResponse#scope
      module Scope
        extend DockerEngineRuby::Internal::Type::Enum

        LOCAL = :local
        SWARM = :swarm

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of object emitting the event
      #
      # @see DockerEngineRuby::Models::SystemEventsResponse#type
      module Type
        extend DockerEngineRuby::Internal::Type::Enum

        BUILDER = :builder
        CONFIG = :config
        CONTAINER = :container
        DAEMON = :daemon
        IMAGE = :image
        NETWORK = :network
        NODE = :node
        PLUGIN = :plugin
        SECRET = :secret
        SERVICE = :service
        VOLUME = :volume

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
