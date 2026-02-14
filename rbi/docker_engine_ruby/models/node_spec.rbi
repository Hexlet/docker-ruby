# typed: strong

module DockerEngineRuby
  module Models
    class NodeSpec < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DockerEngineRuby::NodeSpec, DockerEngineRuby::Internal::AnyHash)
        end

      # Availability of the node.
      sig do
        returns(T.nilable(DockerEngineRuby::NodeSpec::Availability::OrSymbol))
      end
      attr_reader :availability

      sig do
        params(
          availability: DockerEngineRuby::NodeSpec::Availability::OrSymbol
        ).void
      end
      attr_writer :availability

      # User-defined key/value metadata.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Name for the node.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Role of the node.
      sig { returns(T.nilable(DockerEngineRuby::NodeSpec::Role::OrSymbol)) }
      attr_reader :role

      sig { params(role: DockerEngineRuby::NodeSpec::Role::OrSymbol).void }
      attr_writer :role

      sig do
        params(
          availability: DockerEngineRuby::NodeSpec::Availability::OrSymbol,
          labels: T::Hash[Symbol, String],
          name: String,
          role: DockerEngineRuby::NodeSpec::Role::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Availability of the node.
        availability: nil,
        # User-defined key/value metadata.
        labels: nil,
        # Name for the node.
        name: nil,
        # Role of the node.
        role: nil
      )
      end

      sig do
        override.returns(
          {
            availability: DockerEngineRuby::NodeSpec::Availability::OrSymbol,
            labels: T::Hash[Symbol, String],
            name: String,
            role: DockerEngineRuby::NodeSpec::Role::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Availability of the node.
      module Availability
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineRuby::NodeSpec::Availability)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, DockerEngineRuby::NodeSpec::Availability::TaggedSymbol)
        PAUSE =
          T.let(:pause, DockerEngineRuby::NodeSpec::Availability::TaggedSymbol)
        DRAIN =
          T.let(:drain, DockerEngineRuby::NodeSpec::Availability::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::NodeSpec::Availability::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Role of the node.
      module Role
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DockerEngineRuby::NodeSpec::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WORKER = T.let(:worker, DockerEngineRuby::NodeSpec::Role::TaggedSymbol)
        MANAGER =
          T.let(:manager, DockerEngineRuby::NodeSpec::Role::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DockerEngineRuby::NodeSpec::Role::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
