# typed: strong

module DockerEngineAPI
  module Models
    class VolumeListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::VolumeListParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # JSON encoded value of the filters (a `map[string][]string`) to process on the
      # volumes list. Available filters:
      #
      # - `dangling=<boolean>` When set to `true` (or `1`), returns all volumes that are
      #   not in use by a container. When set to `false` (or `0`), only volumes that are
      #   in use by one or more containers are returned.
      # - `driver=<volume-driver-name>` Matches volumes based on their driver.
      # - `label=<key>` or `label=<key>:<value>` Matches volumes based on the presence
      #   of a `label` alone or a `label` and a value.
      # - `name=<volume-name>` Matches all or part of a volume name.
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
        # JSON encoded value of the filters (a `map[string][]string`) to process on the
        # volumes list. Available filters:
        #
        # - `dangling=<boolean>` When set to `true` (or `1`), returns all volumes that are
        #   not in use by a container. When set to `false` (or `0`), only volumes that are
        #   in use by one or more containers are returned.
        # - `driver=<volume-driver-name>` Matches volumes based on their driver.
        # - `label=<key>` or `label=<key>:<value>` Matches volumes based on the presence
        #   of a `label` alone or a `label` and a value.
        # - `name=<volume-name>` Matches all or part of a volume name.
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
