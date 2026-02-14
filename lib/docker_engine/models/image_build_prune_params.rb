# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Images#build_prune
    class ImageBuildPruneParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute all
      #   Remove all types of build cache
      #
      #   @return [Boolean, nil]
      optional :all, DockerEngine::Internal::Type::Boolean

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   list of build cache objects.
      #
      #   Available filters:
      #
      #   - `until=<timestamp>` remove cache older than `<timestamp>`. The `<timestamp>`
      #     can be Unix timestamps, date formatted timestamps, or Go duration strings
      #     (e.g. `10m`, `1h30m`) computed relative to the daemon's local time.
      #   - `id=<id>`
      #   - `parent=<id>`
      #   - `type=<string>`
      #   - `description=<string>`
      #   - `inuse`
      #   - `shared`
      #   - `private`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute max_used_space
      #   Maximum amount of disk space allowed to keep for cache
      #
      #   @return [Integer, nil]
      optional :max_used_space, Integer

      # @!attribute min_free_space
      #   Target amount of free disk space after pruning
      #
      #   @return [Integer, nil]
      optional :min_free_space, Integer

      # @!attribute reserved_space
      #   Amount of disk space in bytes to keep for cache
      #
      #   @return [Integer, nil]
      optional :reserved_space, Integer

      # @!method initialize(all: nil, filters: nil, max_used_space: nil, min_free_space: nil, reserved_space: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ImageBuildPruneParams} for more details.
      #
      #   @param all [Boolean] Remove all types of build cache
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param max_used_space [Integer] Maximum amount of disk space allowed to keep for cache
      #
      #   @param min_free_space [Integer] Target amount of free disk space after pruning
      #
      #   @param reserved_space [Integer] Amount of disk space in bytes to keep for cache
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
