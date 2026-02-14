# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ContainerChangesResponse =
      DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::FilesystemChange }]
  end
end
