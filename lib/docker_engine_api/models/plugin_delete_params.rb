# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#delete
    class PluginDeleteParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute force
      #   Disable the plugin before removing. This may result in issues if the plugin is
      #   in use by a container.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::PluginDeleteParams} for more details.
      #
      #   @param force [Boolean] Disable the plugin before removing. This may result in issues if the
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
