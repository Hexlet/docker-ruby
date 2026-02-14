# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Tasks#list
    class TaskListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   tasks list.
      #
      #   Available filters:
      #
      #   - `desired-state=(running | shutdown | accepted)`
      #   - `id=<task id>`
      #   - `label=key` or `label="key=value"`
      #   - `name=<task name>`
      #   - `node=<node id or name>`
      #   - `service=<service name>`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::TaskListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
