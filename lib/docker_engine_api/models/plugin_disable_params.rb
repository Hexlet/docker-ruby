# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#disable
    class PluginDisableParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute force
      #   Force disable a plugin even if still in use.
      #
      #   @return [Boolean, nil]
      optional :force, DockerEngineAPI::Internal::Type::Boolean

      # @!method initialize(force: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::PluginDisableParams} for more details.
      #
      #   @param force [Boolean] Force disable a plugin even if still in use.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
