# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Nodes#list
    class NodeListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute filters
      #   Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      #
      #   Available filters:
      #
      #   - `id=<node id>`
      #   - `label=<engine label>`
      #   - `membership=`(`accepted`|`pending`)`
      #   - `name=<node name>`
      #   - `node.label=<node label>`
      #   - `role=`(`manager`|`worker`)`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::NodeListParams} for more details.
      #
      #   @param filters [String] Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
