# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ContainerListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Summary }]
  end
end
