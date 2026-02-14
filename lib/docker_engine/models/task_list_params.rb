# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Tasks#list
    class TaskListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

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
      #   {DockerEngine::Models::TaskListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
