# typed: strong

module DockerEngineAPI
  module Models
    class ContainerWaitParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::ContainerWaitParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      sig do
        returns(
          T.nilable(DockerEngineAPI::ContainerWaitParams::Condition::OrSymbol)
        )
      end
      attr_reader :condition

      sig do
        params(
          condition: DockerEngineAPI::ContainerWaitParams::Condition::OrSymbol
        ).void
      end
      attr_writer :condition

      sig do
        params(
          condition: DockerEngineAPI::ContainerWaitParams::Condition::OrSymbol,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
            condition:
              DockerEngineAPI::ContainerWaitParams::Condition::OrSymbol,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Wait until a container state reaches the given condition.
      #
      # Defaults to `not-running` if omitted or empty.
      module Condition
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineAPI::ContainerWaitParams::Condition)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NOT_RUNNING =
          T.let(
            :"not-running",
            DockerEngineAPI::ContainerWaitParams::Condition::TaggedSymbol
          )
        NEXT_EXIT =
          T.let(
            :"next-exit",
            DockerEngineAPI::ContainerWaitParams::Condition::TaggedSymbol
          )
        REMOVED =
          T.let(
            :removed,
            DockerEngineAPI::ContainerWaitParams::Condition::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineAPI::ContainerWaitParams::Condition::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
