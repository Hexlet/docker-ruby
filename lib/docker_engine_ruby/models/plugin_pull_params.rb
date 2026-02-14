# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#pull
    class PluginPullParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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
      #   @return [Array<DockerEngineRuby::Models::Privilege>, nil]
      optional :body, -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege] }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(remote:, name: nil, body: nil, x_registry_auth: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::PluginPullParams} for more details.
      #
      #   @param remote [String] Remote reference for plugin to install.
      #
      #   @param name [String] Local name for the pulled plugin.
      #
      #   @param body [Array<DockerEngineRuby::Models::Privilege>]
      #
      #   @param x_registry_auth [String]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
