# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    PluginPrivilegesResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Privilege }]
  end
end
