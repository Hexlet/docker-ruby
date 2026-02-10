# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#list
    class ContainerListParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute all
      #   Return all containers. By default, only running containers are shown.
      #
      #   @return [Boolean, nil]
      optional :all, Docker::Internal::Type::Boolean

      # @!attribute filters
      #   Filters to process on the container list, encoded as JSON (a
      #   `map[string][]string`). For example, `{"status": ["paused"]}` will only return
      #   paused containers.
      #
      #   Available filters:
      #
      #   - `ancestor`=(`<image-name>[:<tag>]`, `<image id>`, or `<image@digest>`)
      #   - `before`=(`<container id>` or `<container name>`)
      #   - `expose`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      #   - `exited=<int>` containers with exit code of `<int>`
      #   - `health`=(`starting`|`healthy`|`unhealthy`|`none`)
      #   - `id=<ID>` a container's ID
      #   - `isolation=`(`default`|`process`|`hyperv`) (Windows daemon only)
      #   - `is-task=`(`true`|`false`)
      #   - `label=key` or `label="key=value"` of a container label
      #   - `name=<name>` a container's name
      #   - `network`=(`<network id>` or `<network name>`)
      #   - `publish`=(`<port>[/<proto>]`|`<startport-endport>/[<proto>]`)
      #   - `since`=(`<container id>` or `<container name>`)
      #   - `status=`(`created`|`restarting`|`running`|`removing`|`paused`|`exited`|`dead`)
      #   - `volume`=(`<volume name>` or `<mount point destination>`)
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute limit
      #   Return this number of most recently created containers, including non-running
      #   ones.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute size
      #   Return the size of container as fields `SizeRw` and `SizeRootFs`.
      #
      #   @return [Boolean, nil]
      optional :size, Docker::Internal::Type::Boolean

      # @!method initialize(all: nil, filters: nil, limit: nil, size: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ContainerListParams} for more details.
      #
      #   @param all [Boolean] Return all containers. By default, only running containers are shown.
      #
      #   @param filters [String] Filters to process on the container list, encoded as JSON (a
      #
      #   @param limit [Integer] Return this number of most recently created containers, including
      #
      #   @param size [Boolean] Return the size of container as fields `SizeRw` and `SizeRootFs`.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
