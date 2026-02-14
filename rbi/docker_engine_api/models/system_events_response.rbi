# typed: strong

module DockerEngineAPI
  module Models
    class SystemEventsResponse < DockerEngineAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::Models::SystemEventsResponse,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # The type of event
      sig { returns(T.nilable(String)) }
      attr_reader :action

      sig { params(action: String).void }
      attr_writer :action

      # Actor describes something that generates events, like a container, network, or a
      # volume.
      sig do
        returns(T.nilable(DockerEngineAPI::Models::SystemEventsResponse::Actor))
      end
      attr_reader :actor

      sig do
        params(
          actor: DockerEngineAPI::Models::SystemEventsResponse::Actor::OrHash
        ).void
      end
      attr_writer :actor

      # Scope of the event. Engine events are `local` scope. Cluster (Swarm) events are
      # `swarm` scope.
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemEventsResponse::Scope::TaggedSymbol
          )
        )
      end
      attr_reader :scope

      sig do
        params(
          scope: DockerEngineAPI::Models::SystemEventsResponse::Scope::OrSymbol
        ).void
      end
      attr_writer :scope

      # Timestamp of event
      sig { returns(T.nilable(Integer)) }
      attr_reader :time

      sig { params(time: Integer).void }
      attr_writer :time

      # Timestamp of event, with nanosecond accuracy
      sig { returns(T.nilable(Integer)) }
      attr_reader :time_nano

      sig { params(time_nano: Integer).void }
      attr_writer :time_nano

      # The type of object emitting the event
      sig do
        returns(
          T.nilable(
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type: DockerEngineAPI::Models::SystemEventsResponse::Type::OrSymbol
        ).void
      end
      attr_writer :type

      # EventMessage represents the information an event contains.
      sig do
        params(
          action: String,
          actor: DockerEngineAPI::Models::SystemEventsResponse::Actor::OrHash,
          scope: DockerEngineAPI::Models::SystemEventsResponse::Scope::OrSymbol,
          time: Integer,
          time_nano: Integer,
          type: DockerEngineAPI::Models::SystemEventsResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The type of event
        action: nil,
        # Actor describes something that generates events, like a container, network, or a
        # volume.
        actor: nil,
        # Scope of the event. Engine events are `local` scope. Cluster (Swarm) events are
        # `swarm` scope.
        scope: nil,
        # Timestamp of event
        time: nil,
        # Timestamp of event, with nanosecond accuracy
        time_nano: nil,
        # The type of object emitting the event
        type: nil
      )
      end

      sig do
        override.returns(
          {
            action: String,
            actor: DockerEngineAPI::Models::SystemEventsResponse::Actor,
            scope:
              DockerEngineAPI::Models::SystemEventsResponse::Scope::TaggedSymbol,
            time: Integer,
            time_nano: Integer,
            type:
              DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Actor < DockerEngineAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DockerEngineAPI::Models::SystemEventsResponse::Actor,
              DockerEngineAPI::Internal::AnyHash
            )
          end

        # Various key/value attributes of the object, depending on its type.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :attributes

        sig { params(attributes: T::Hash[Symbol, String]).void }
        attr_writer :attributes

        # The ID of the object emitting the event
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Actor describes something that generates events, like a container, network, or a
        # volume.
        sig do
          params(attributes: T::Hash[Symbol, String], id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Various key/value attributes of the object, depending on its type.
          attributes: nil,
          # The ID of the object emitting the event
          id: nil
        )
        end

        sig do
          override.returns({ attributes: T::Hash[Symbol, String], id: String })
        end
        def to_hash
        end
      end

      # Scope of the event. Engine events are `local` scope. Cluster (Swarm) events are
      # `swarm` scope.
      module Scope
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineAPI::Models::SystemEventsResponse::Scope)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL =
          T.let(
            :local,
            DockerEngineAPI::Models::SystemEventsResponse::Scope::TaggedSymbol
          )
        SWARM =
          T.let(
            :swarm,
            DockerEngineAPI::Models::SystemEventsResponse::Scope::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineAPI::Models::SystemEventsResponse::Scope::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The type of object emitting the event
      module Type
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineAPI::Models::SystemEventsResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BUILDER =
          T.let(
            :builder,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        CONFIG =
          T.let(
            :config,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        CONTAINER =
          T.let(
            :container,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        DAEMON =
          T.let(
            :daemon,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        IMAGE =
          T.let(
            :image,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        NETWORK =
          T.let(
            :network,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        NODE =
          T.let(
            :node,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        PLUGIN =
          T.let(
            :plugin,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        SECRET =
          T.let(
            :secret,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        SERVICE =
          T.let(
            :service,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )
        VOLUME =
          T.let(
            :volume,
            DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineAPI::Models::SystemEventsResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
