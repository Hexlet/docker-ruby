# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::System#events
    class SystemEventsParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute filters
      #   A JSON encoded value of filters (a `map[string][]string`) to process on the
      #   event list. Available filters:
      #
      #   - `config=<string>` config name or ID
      #   - `container=<string>` container name or ID
      #   - `daemon=<string>` daemon name or ID
      #   - `event=<string>` event type
      #   - `image=<string>` image name or ID
      #   - `label=<string>` image or container label
      #   - `network=<string>` network name or ID
      #   - `node=<string>` node ID
      #   - `plugin`=<string> plugin name or ID
      #   - `scope`=<string> local or swarm
      #   - `secret=<string>` secret name or ID
      #   - `service=<string>` service name or ID
      #   - `type=<string>` object to filter by, one of `container`, `image`, `volume`,
      #     `network`, `daemon`, `plugin`, `node`, `service`, `secret` or `config`
      #   - `volume=<string>` volume name
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute since
      #   Show events created since this timestamp then stream new events.
      #
      #   @return [String, nil]
      optional :since, String

      # @!attribute until_
      #   Show events created until this timestamp then stop streaming.
      #
      #   @return [String, nil]
      optional :until_, String

      # @!method initialize(filters: nil, since: nil, until_: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::SystemEventsParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of filters (a `map[string][]string`) to process on the even
      #
      #   @param since [String] Show events created since this timestamp then stream new events.
      #
      #   @param until_ [String] Show events created until this timestamp then stop streaming.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
