# typed: strong

module DockerEngineRuby
  module Models
    class SystemDataUsageParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SystemDataUsageParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Object types, for which to compute and return data.
      sig do
        returns(
          T.nilable(
            T::Array[DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol]
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type:
            T::Array[DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol]
        ).void
      end
      attr_writer :type

      # Show detailed information on space usage.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verbose

      sig { params(verbose: T::Boolean).void }
      attr_writer :verbose

      sig do
        params(
          type:
            T::Array[DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol],
          verbose: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Object types, for which to compute and return data.
        type: nil,
        # Show detailed information on space usage.
        verbose: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            type:
              T::Array[DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol],
            verbose: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Type
        extend DockerEngineRuby::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineRuby::SystemDataUsageParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONTAINER =
          T.let(
            :container,
            DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol
          )
        IMAGE =
          T.let(
            :image,
            DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol
          )
        VOLUME =
          T.let(
            :volume,
            DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol
          )
        BUILD_CACHE =
          T.let(
            :"build-cache",
            DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
