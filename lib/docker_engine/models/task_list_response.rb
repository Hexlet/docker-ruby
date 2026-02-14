# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    TaskListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Task }]
  end
end
