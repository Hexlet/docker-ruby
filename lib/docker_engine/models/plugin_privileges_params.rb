# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#privileges
    class PluginPrivilegesParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute remote
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :remote, String

      # @!method initialize(remote:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::PluginPrivilegesParams} for more details.
      #
      #   @param remote [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
