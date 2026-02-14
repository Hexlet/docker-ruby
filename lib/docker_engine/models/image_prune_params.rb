# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#prune
    class ImagePruneParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute filters
      #   Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #   Available filters:
      #
      #   - `dangling=<boolean>` When set to `true` (or `1`), prune only unused _and_
      #     untagged images. When set to `false` (or `0`), all unused images are pruned.
      #   - `until=<string>` Prune images created before this timestamp. The `<timestamp>`
      #     can be Unix timestamps, date formatted timestamps, or Go duration strings
      #     (e.g. `10m`, `1h30m`) computed relative to the daemon machine’s time.
      #   - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #     `label!=<key>=<value>`) Prune images with (or without, in case `label!=...` is
      #     used) the specified labels.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImagePruneParams} for more details.
      #
      #   @param filters [String] Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
