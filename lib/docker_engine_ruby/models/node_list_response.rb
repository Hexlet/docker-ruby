# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    NodeListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Node }]
  end
end
