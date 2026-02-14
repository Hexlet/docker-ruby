# typed: strong

module DockerEngine
  module Models
    class ContainerWaitParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ContainerWaitParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      sig do
        returns(
          T.nilable(DockerEngine::ContainerWaitParams::Condition::OrSymbol)
        )
      end
      attr_reader :condition

      sig do
        params(
          condition: DockerEngine::ContainerWaitParams::Condition::OrSymbol
        ).void
      end
      attr_writer :condition

      sig do
        params(
          condition: DockerEngine::ContainerWaitParams::Condition::OrSymbol,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Wait until a container state reaches the given condition.
        #
        # Defaults to `not-running` if omitted or empty.
        condition: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            condition: DockerEngine::ContainerWaitParams::Condition::OrSymbol,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      module Condition
        extend DockerEngine::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngine::ContainerWaitParams::Condition)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NOT_RUNNING =
          T.let(
            :"not-running",
            DockerEngine::ContainerWaitParams::Condition::TaggedSymbol
          )
        NEXT_EXIT =
          T.let(
            :"next-exit",
            DockerEngine::ContainerWaitParams::Condition::TaggedSymbol
          )
        REMOVED =
          T.let(
            :removed,
            DockerEngine::ContainerWaitParams::Condition::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[DockerEngine::ContainerWaitParams::Condition::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
