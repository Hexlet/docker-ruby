# typed: strong

module DockerEngineAPI
  module Models
    class TaskListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::TaskListParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # A JSON encoded value of the filters (a `map[string][]string`) to process on the
      # tasks list.
      #
      # Available filters:
      #
      # - `desired-state=(running | shutdown | accepted)`
      # - `id=<task id>`
      # - `label=key` or `label="key=value"`
      # - `name=<task name>`
      # - `node=<node id or name>`
      # - `service=<service name>`
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSON encoded value of the filters (a `map[string][]string`) to process on the
        # tasks list.
        #
        # Available filters:
        #
        # - `desired-state=(running | shutdown | accepted)`
        # - `id=<task id>`
        # - `label=key` or `label="key=value"`
        # - `name=<task name>`
        # - `node=<node id or name>`
        # - `service=<service name>`
        filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { filters: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
