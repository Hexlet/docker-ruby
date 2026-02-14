# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Nodes#list
    class NodeListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

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
      #   {DockerEngineAPI::Models::NodeListParams} for more details.
      #
      #   @param filters [String] Filters to process on the nodes list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
