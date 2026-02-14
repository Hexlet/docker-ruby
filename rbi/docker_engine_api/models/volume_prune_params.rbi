# typed: strong

module DockerEngineAPI
  module Models
    class VolumePruneParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::VolumePruneParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # Filters to process on the prune list, encoded as JSON (a `map[string][]string`).
      #
      # Available filters:
      #
      # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
      #   `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...`
      #   is used) the specified labels.
      # - `all` (`all=true`) - Consider all (local) volumes for pruning and not just
      #   anonymous volumes.
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
        # - `label` (`label=<key>`, `label=<key>=<value>`, `label!=<key>`, or
        #   `label!=<key>=<value>`) Prune volumes with (or without, in case `label!=...`
        #   is used) the specified labels.
        # - `all` (`all=true`) - Consider all (local) volumes for pruning and not just
        #   anonymous volumes.
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
