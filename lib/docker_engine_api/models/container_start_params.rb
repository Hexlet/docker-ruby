# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#start
    class ContainerStartParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute detach_keys
      #   Override the key sequence for detaching a container. Format is a single
      #   character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      #   `[`, `,` or `_`.
      #
      #   @return [String, nil]
      optional :detach_keys, String

      # @!method initialize(detach_keys: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::ContainerStartParams} for more details.
      #
      #   @param detach_keys [String] Override the key sequence for detaching a container. Format is a
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
