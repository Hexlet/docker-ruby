# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ConfigListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Config }]
  end
end
