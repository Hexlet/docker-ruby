# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ConfigListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Config }]
  end
end
