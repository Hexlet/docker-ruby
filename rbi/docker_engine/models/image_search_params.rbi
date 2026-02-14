# typed: strong

module DockerEngine
  module Models
    class ImageSearchParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngine::ImageSearchParams,
            DockerEngine::Internal::AnyHash
          )
        end

      # Term to search
      sig { returns(String) }
      attr_accessor :term

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # images list. Available filters:
      #
      # - `is-official=(true|false)`
      # - `stars=<number>` Matches images that has at least 'number' stars.
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          term: String,
          filters: String,
          limit: Integer,
          request_options: DockerEngine::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Term to search
        term:,
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # images list. Available filters:
        #
        # - `is-official=(true|false)`
        # - `stars=<number>` Matches images that has at least 'number' stars.
        filters: nil,
        # Maximum number of results to return
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            term: String,
            filters: String,
            limit: Integer,
            request_options: DockerEngine::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
