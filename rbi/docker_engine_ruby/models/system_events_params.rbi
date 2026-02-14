# typed: strong

module DockerEngineRuby
  module Models
    class SystemEventsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::SystemEventsParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig { returns(T.nilable(String)) }
      attr_reader :since

      sig { params(since: String).void }
      attr_writer :since

      sig { returns(T.nilable(String)) }
      attr_reader :until_

      sig { params(until_: String).void }
      attr_writer :until_

      sig do
        params(
          filters: String,
          since: String,
          until_: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(filters: nil, since: nil, until_: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            filters: String,
            since: String,
            until_: String,
            request_options: DockerEngineRuby::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
