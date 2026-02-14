# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#privileges
    class PluginPrivilegesParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute remote
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :remote, String

      # @!method initialize(remote:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::PluginPrivilegesParams} for more details.
      #
      #   @param remote [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
