# typed: strong

module DockerEngineRuby
  module Models
    class ContainerPruneParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineRuby::ContainerPruneParams,
            DockerEngineRuby::Internal::AnyHash
          )
        end

      # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # Available filters:
      #
      # - `until=<timestamp>` Prune containers created before this timestamp. The
      #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
      #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
      #   machine’s time.
      # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #   `label!=<key>=<value>`) Prune containers with (or without, in case
      #   `label!=...` is used) the specified labels.
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
        # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
        #
        # Available filters:
        #
        # - `until=<timestamp>` Prune containers created before this timestamp. The
        #   `<timestamp>` can be Unix timestamps, date formatted timestamps, or Go
        #   duration strings (e.g. `10m`, `1h30m`) computed relative to the daemon
        #   machine’s time.
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune containers with (or without, in case
        #   `label!=...` is used) the specified labels.
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
