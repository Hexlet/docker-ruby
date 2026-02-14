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

      sig do
        returns(
          T.nilable(
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol,
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::OrSymbol
              ]
            )
          )
        )
      end
      attr_reader :type

      sig do
        params(
          type:
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol,
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::OrSymbol
              ]
            )
        ).void
      end
      attr_writer :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verbose

      sig { params(verbose: T::Boolean).void }
      attr_writer :verbose

      sig do
        params(
          type:
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol,
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::OrSymbol
              ]
            ),
          verbose: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(type: nil, verbose: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            type:
              T.any(
                DockerEngineRuby::SystemDataUsageParams::Type::OrSymbol,
                T::Array[
                  DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::OrSymbol
                ]
              ),
            verbose: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Type
        extend DockerEngineRuby::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              DockerEngineRuby::SystemDataUsageParams::Type::TaggedSymbol,
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::TaggedSymbol
              ]
            )
          end

        module UnionMember1
          extend DockerEngineRuby::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUILD_CACHE =
            T.let(
              :"build-cache",
              DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[DockerEngineRuby::SystemDataUsageParams::Type::Variants]
          )
        end
        def self.variants
        end

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

        UnionMember1Array =
          T.let(
            DockerEngineRuby::Internal::Type::ArrayOf[
              enum: DockerEngineRuby::SystemDataUsageParams::Type::UnionMember1
            ],
            DockerEngineRuby::Internal::Type::Converter
          )
      end
    end
  end
end
