# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#privileges
    class PluginPrivilegesParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute remote
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :remote, String

      # @!method initialize(remote:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::PluginPrivilegesParams} for more details.
      #
      #   @param remote [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
