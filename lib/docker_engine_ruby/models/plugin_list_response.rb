# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    PluginListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Plugin }]
  end
end
