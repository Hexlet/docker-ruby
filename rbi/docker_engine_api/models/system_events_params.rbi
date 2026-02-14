# typed: strong

module DockerEngineAPI
  module Models
    class SystemEventsParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            DockerEngineAPI::SystemEventsParams,
            DockerEngineAPI::Internal::AnyHash
          )
        end

      # A JSON encoded value of filters (a `map[string][]string`) to process on the
      # event list. Available filters:
      #
      # - `config=<string>` config name or ID
      # - `container=<string>` container name or ID
      # - `daemon=<string>` daemon name or ID
      # - `event=<string>` event type
      # - `image=<string>` image name or ID
      # - `label=<string>` image or container label
      # - `network=<string>` network name or ID
      # - `node=<string>` node ID
      # - `plugin`=<string> plugin name or ID
      # - `scope`=<string> local or swarm
      # - `secret=<string>` secret name or ID
      # - `service=<string>` service name or ID
      # - `type=<string>` object to filter by, one of `container`, `image`, `volume`,
      #   `network`, `daemon`, `plugin`, `node`, `service`, `secret` or `config`
      # - `volume=<string>` volume name
      sig { returns(T.nilable(String)) }
      attr_reader :filters

      sig { params(filters: String).void }
      attr_writer :filters

      # Show events created since this timestamp then stream new events.
      sig { returns(T.nilable(String)) }
      attr_reader :since

      sig { params(since: String).void }
      attr_writer :since

      # Show events created until this timestamp then stop streaming.
      sig { returns(T.nilable(String)) }
      attr_reader :until_

      sig { params(until_: String).void }
      attr_writer :until_

      sig do
        params(
          filters: String,
          since: String,
          until_: String,
          request_options: DockerEngineAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSON encoded value of filters (a `map[string][]string`) to process on the
        # event list. Available filters:
        #
        # - `config=<string>` config name or ID
        # - `container=<string>` container name or ID
        # - `daemon=<string>` daemon name or ID
        # - `event=<string>` event type
        # - `image=<string>` image name or ID
        # - `label=<string>` image or container label
        # - `network=<string>` network name or ID
        # - `node=<string>` node ID
        # - `plugin`=<string> plugin name or ID
        # - `scope`=<string> local or swarm
        # - `secret=<string>` secret name or ID
        # - `service=<string>` service name or ID
        # - `type=<string>` object to filter by, one of `container`, `image`, `volume`,
        #   `network`, `daemon`, `plugin`, `node`, `service`, `secret` or `config`
        # - `volume=<string>` volume name
        filters: nil,
        # Show events created since this timestamp then stream new events.
        since: nil,
        # Show events created until this timestamp then stop streaming.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            filters: String,
            since: String,
            until_: String,
            request_options: DockerEngineAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
