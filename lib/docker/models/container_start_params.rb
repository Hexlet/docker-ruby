# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Containers#start
    class ContainerStartParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute detach_keys
      #   Override the key sequence for detaching a container. Format is a single
      #   character `[a-Z]` or `ctrl-<value>` where `<value>` is one of: `a-z`, `@`, `^`,
      #   `[`, `,` or `_`.
      #
      #   @return [String, nil]
      optional :detach_keys, String

      # @!method initialize(detach_keys: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ContainerStartParams} for more details.
      #
      #   @param detach_keys [String] Override the key sequence for detaching a container. Format is a
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
