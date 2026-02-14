# typed: strong

module DockerEngineAPI
  module Models
    class SystemDataUsageParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SystemDataUsageParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Object types, for which to compute and return data.
      sig do
        returns(
          T.nilable(
            T::Array[DockerEngineAPI::SystemDataUsageParams::Type::OrSymbol]
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type: T::Array[DockerEngineAPI::SystemDataUsageParams::Type::OrSymbol]
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
            T::Array[DockerEngineAPI::SystemDataUsageParams::Type::OrSymbol],
          verbose: T::Boolean,
          request_options: DockerEngineAPI::RequestOptions::OrHash
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
              T::Array[DockerEngineAPI::SystemDataUsageParams::Type::OrSymbol],
            verbose: T::Boolean,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Type
        extend DockerEngineAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngineAPI::SystemDataUsageParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONTAINER =
          T.let(
            :container,
            DockerEngineAPI::SystemDataUsageParams::Type::TaggedSymbol
          )
        IMAGE =
          T.let(
            :image,
            DockerEngineAPI::SystemDataUsageParams::Type::TaggedSymbol
          )
        VOLUME =
          T.let(
            :volume,
            DockerEngineAPI::SystemDataUsageParams::Type::TaggedSymbol
          )
        BUILD_CACHE =
          T.let(
            :"build-cache",
            DockerEngineAPI::SystemDataUsageParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[DockerEngineAPI::SystemDataUsageParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
