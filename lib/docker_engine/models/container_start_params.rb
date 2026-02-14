# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Containers#start
    class ContainerStartParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute detach_keys
      #   Override the key sequence for detaching a container. Format is a single
      #   character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      #   `[`, `,` or `_`.
      #
      #   @return [String, nil]
      optional :detach_keys, String

      # @!method initialize(detach_keys: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ContainerStartParams} for more details.
      #
      #   @param detach_keys [String] Override the key sequence for detaching a container. Format is a
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
