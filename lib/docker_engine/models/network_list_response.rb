# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    NetworkListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Summary }]
  end
end
