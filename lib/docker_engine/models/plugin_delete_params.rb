# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#delete
    class PluginDeleteParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute force
      #   Disable the plugin before removing. This may result in issues if the plugin is
      #   in use by a container.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngine::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::PluginDeleteParams} for more details.
      #
      #   @param force [Boolean] Disable the plugin before removing. This may result in issues if the
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
