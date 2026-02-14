# typed: strong

module DockerEngineAPI
  module Models
    class NetworkPruneParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::NetworkPruneParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # Available filters:
      #
      # - `until=<timestamp>` Prune networks created before this timestamp. The
      #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
      #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
      #   machine’s time.
      # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #   `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...`
      #   is used) the specified labels.
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      sig do
        params(
          filters: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `until=<timestamp>` Prune networks created before this timestamp. The
        #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
        #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
        #   machine’s time.
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune networks with (or without, in case `label!=...`
        #   is used) the specified labels.
        filters: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { filters: String, request_options: DockerEngineAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
