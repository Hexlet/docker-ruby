# typed: strong

module DockerEngineRuby
  module Models
    class ImageSearchResponseItem < DockerEngineRuby::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::Models::ImageSearchResponseItem,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_automated

      sig { params(is_automated: T::Boolean).void }
      attr_writer :is_automated

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_official

      sig { params(is_official: T::Boolean).void }
      attr_writer :is_official

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(Integer)) }
      attr_reader :star_count

      sig { params(star_count: Integer).void }
      attr_writer :star_count

      sig do
        params(
          description: String,
          is_automated: T::Boolean,
          is_official: T::Boolean,
          name: String,
          star_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        description: nil,
        is_automated: nil,
        is_official: nil,
        name: nil,
        star_count: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            is_automated: T::Boolean,
            is_official: T::Boolean,
            name: String,
            star_count: Integer
          }
        )
      end
      def to_hash
      end
    end

    ImageSearchResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::Models::ImageSearchResponseItem
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
