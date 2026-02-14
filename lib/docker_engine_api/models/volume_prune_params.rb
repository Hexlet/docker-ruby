# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Volumes#prune
    class VolumePruneParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute filters
      #   Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   Available filters:
      #
      #   - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #     `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...`
      #     is used) the specified labels.
      #   - `all` (`all=true`) - Consider all (local) volumes for pruning and not just
      #     anonymous volumes.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::VolumePruneParams} for more details.
      #
      #   @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
