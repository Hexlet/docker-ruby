# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Networks#list
    class NetworkListParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute filters
      #   JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   networks list.
      #
      #   Available filters:
      #
      #   - `dangling=<boolean>` When set to `true` (or `1`), returns all networks that
      #     are not in use by a container. When set to `false` (or `0`), only networks
      #     that are in use by one or more containers are returned.
      #   - `driver=<driver-name>` Matches a network's driver.
      #   - `id=<network-id>` Matches all or part of a network ID.
      #   - `label=<key>` or `label=<key>=<value>` of a network label.
      #   - `name=<network-name>` Matches all or part of a network name.
      #   - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`,
      #     `global`, or `local`).
      #   - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword
      #     returns all user-defined networks.
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::NetworkListParams} for more details.
      #
      #   @param filters [String] JSON encoded value of the filters (a `map[string][]string`) to process
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
