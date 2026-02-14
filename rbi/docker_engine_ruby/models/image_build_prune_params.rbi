# typed: strong

module DockerEngineRuby
  module Models
    class ImageBuildPruneParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ImageBuildPruneParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all

      sig { params(all: T::Boolean).void }
      attr_writer :all

      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig { returns(T.nilable(Integer)) }
      attr_reader :max_used_space

      sig { params(max_used_space: Integer).void }
      attr_writer :max_used_space

      sig { returns(T.nilable(Integer)) }
      attr_reader :min_free_space

      sig { params(min_free_space: Integer).void }
      attr_writer :min_free_space

      sig { returns(T.nilable(Integer)) }
      attr_reader :reserved_space

      sig { params(reserved_space: Integer).void }
      attr_writer :reserved_space

      sig do
        params(
          all: T::Boolean,
          filters: String,
          max_used_space: Integer,
          min_free_space: Integer,
          reserved_space: Integer,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        all: nil,
        filters: nil,
        max_used_space: nil,
        min_free_space: nil,
        reserved_space: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            filters: String,
            max_used_space: Integer,
            min_free_space: Integer,
            reserved_space: Integer,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
