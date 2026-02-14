# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Volumes#prune
    class VolumePruneParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

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
      #   {DockerEngine::Models::VolumePruneParams} for more details.
      #
      #   @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
