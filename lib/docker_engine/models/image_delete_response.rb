# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ImageDeleteResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::DeleteItem }]
  end
end
