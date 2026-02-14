# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ContainerChangesResponse =
      DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::FilesystemChange }]
  end
end
