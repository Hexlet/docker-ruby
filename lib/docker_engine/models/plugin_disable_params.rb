# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#disable
    class PluginDisableParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute force
      #   Force disable a plugin even if still in use.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngine::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::PluginDisableParams} for more details.
      #
      #   @param force [Boolean] Force disable a plugin even if still in use.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
