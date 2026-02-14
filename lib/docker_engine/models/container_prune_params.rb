# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#prune
    class ContainerPruneParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute filters
      #   Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   Available filters:
      #
      #   - `until=<timestamp>` Prune containers created before this timestamp. The
      #     `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
      #     duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
      #     machine’s time.
      #   - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #     `label!=<key>=<value>`) Prune containers with (or without, in case
      #     `label!=...` is used) the specified labels.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerPruneParams} for more details.
      #
      #   @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
