# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    PluginListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Plugin }]
  end
end
