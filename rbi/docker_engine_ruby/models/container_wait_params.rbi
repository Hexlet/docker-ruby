# typed: strong

module DockerEngineRuby
  module Models
    class ContainerWaitParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerWaitParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(DockerEngineRuby::ContainerWaitParams::Condition::OrSymbol)
        )
      end
      attr_reader :condition

      sig do
        params(
          condition: DockerEngineRuby::ContainerWaitParams::Condition::OrSymbol
        ).void
      end
      attr_writer :condition

      sig do
        params(
          condition: DockerEngineRuby::ContainerWaitParams::Condition::OrSymbol,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(condition: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            condition:
              DockerEngineRuby::ContainerWaitParams::Condition::OrSymbol,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Condition
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineRuby::ContainerWaitParams::Condition)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NOT_RUNNING =
          T.let(
            :"not-running",
            DockerEngineRuby::ContainerWaitParams::Condition::TaggedSymbol
          )
        NEXT_EXIT =
          T.let(
            :"next-exit",
            DockerEngineRuby::ContainerWaitParams::Condition::TaggedSymbol
          )
        REMOVED =
          T.let(
            :removed,
            DockerEngineRuby::ContainerWaitParams::Condition::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineRuby::ContainerWaitParams::Condition::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
