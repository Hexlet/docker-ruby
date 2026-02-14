# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Networks#prune
    class NetworkPruneParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute filters
      #   Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   Available filters:
      #
      #   - `until=<timestamp>` Prune networks created before this timestamp. The
      #     `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
      #     duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
      #     machine’s time.
      #   - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #     `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...`
      #     is used) the specified labels.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::NetworkPruneParams} for more details.
      #
      #   @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
