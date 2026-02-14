# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#pull
    class PluginPullParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute remote
      #   Remote reference for plugin to install.
      #
      #   The `:latest` tag is optional, and is used as the default if omitted.
      #
      #   @return [String]
      required :remote, String

      # @!attribute name
      #   Local name for the pulled plugin.
      #
      #   The `:latest` tag is optional, and is used as the default if omitted.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute body
      #
      #   @return [Array<DockerEngine::Models::Privilege>, nil]
      optional :body, -> { DockerEngine::Internal::Type::ArrayOf[DockerEngine::Privilege] }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(remote:, name: nil, body: nil, x_registry_auth: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::PluginPullParams} for more details.
      #
      #   @param remote [String] Remote reference for plugin to install.
      #
      #   @param name [String] Local name for the pulled plugin.
      #
      #   @param body [Array<DockerEngine::Models::Privilege>]
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
