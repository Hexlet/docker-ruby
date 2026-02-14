# typed: strong

module DockerEngineRuby
  module Models
    class NetworkListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::NetworkListParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # JSON encoded value of the filters (a `map[string][]string`) to process on the
      # networks list.
      #
      # Available filters:
      #
      # - `dangling=<boolean>` When set to `true` (or `1`), returns all networks that
      #   are not in use by a container. When set to `false` (or `0`), only networks
      #   that are in use by one or more containers are returned.
      # - `driver=<driver-name>` Matches a network's driver.
      # - `id=<network-id>` Matches all or part of a network ID.
      # - `label=<key>` or `label=<key>=<value>` of a network label.
      # - `name=<network-name>` Matches all or part of a network name.
      # - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`,
      #   `global`, or `local`).
      # - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword
      #   returns all user-defined networks.
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig do
        params(
          filters: String,
          request_options: DockerEngineRuby::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # JSON encoded value of the filters (a `map[string][]string`) to process on the
        # networks list.
        #
        # Available filters:
        #
        # - `dangling=<boolean>` When set to `true` (or `1`), returns all networks that
        #   are not in use by a container. When set to `false` (or `0`), only networks
        #   that are in use by one or more containers are returned.
        # - `driver=<driver-name>` Matches a network's driver.
        # - `id=<network-id>` Matches all or part of a network ID.
        # - `label=<key>` or `label=<key>=<value>` of a network label.
        # - `name=<network-name>` Matches all or part of a network name.
        # - `scope=["swarm"|"global"|"local"]` Filters networks by scope (`swarm`,
        #   `global`, or `local`).
        # - `type=["custom"|"builtin"]` Filters networks by type. The `custom` keyword
        #   returns all user-defined networks.
        filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { filters: String, request_options: DockerEngineRuby::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
