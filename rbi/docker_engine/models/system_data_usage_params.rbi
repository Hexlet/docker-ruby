# typed: strong

module DockerEngine
  module Models
    class SystemDataUsageParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::SystemDataUsageParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Object types, for which to compute and return data.
      sig do
        returns(
          T.nilable(
            T::Array[DockerEngine::SystemDataUsageParams::Type::OrSymbol]
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type: T::Array[DockerEngine::SystemDataUsageParams::Type::OrSymbol]
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
          type: T::Array[DockerEngine::SystemDataUsageParams::Type::OrSymbol],
          verbose: T::Boolean,
          request_options: DockerEngine::RequestOptions::OrHash
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
            type: T::Array[DockerEngine::SystemDataUsageParams::Type::OrSymbol],
            verbose: T::Boolean,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Type
        extend DockerEngine::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, DockerEngine::SystemDataUsageParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONTAINER =
          T.let(
            :container,
            DockerEngine::SystemDataUsageParams::Type::TaggedSymbol
          )
        IMAGE =
          T.let(:image, DockerEngine::SystemDataUsageParams::Type::TaggedSymbol)
        VOLUME =
          T.let(
            :volume,
            DockerEngine::SystemDataUsageParams::Type::TaggedSymbol
          )
        BUILD_CACHE =
          T.let(
            :"build-cache",
            DockerEngine::SystemDataUsageParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[DockerEngine::SystemDataUsageParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
