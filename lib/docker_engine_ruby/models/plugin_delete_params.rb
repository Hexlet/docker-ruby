# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#delete
    class PluginDeleteParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute force
      #   Disable the plugin before removing. This may result in issues if the plugin is
      #   in use by a container.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::PluginDeleteParams} for more details.
      #
      #   @param force [Boolean] Disable the plugin before removing. This may result in issues if the
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
