# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    PluginPrivilegesResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Privilege }]
  end
end
