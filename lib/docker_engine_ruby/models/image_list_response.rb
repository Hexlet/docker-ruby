# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ImageListResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::Summary }]
  end
end
