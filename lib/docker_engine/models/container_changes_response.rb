# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ContainerChangesResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::FilesystemChange }]
  end
end
