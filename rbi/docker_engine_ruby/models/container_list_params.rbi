# typed: strong

module DockerEngineRuby
  module Models
    class ContainerListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerListParams,
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
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :size

      sig { params(size: T::Boolean).void }
      attr_writer :size

      sig do
        params(
          all: T::Boolean,
          filters: String,
          limit: Integer,
          size: T::Boolean,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        all: nil,
        filters: nil,
        limit: nil,
        size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all: T::Boolean,
            filters: String,
            limit: Integer,
            size: T::Boolean,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
