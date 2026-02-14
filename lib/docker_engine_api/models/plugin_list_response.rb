# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    PluginListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Plugin }]
  end
end
