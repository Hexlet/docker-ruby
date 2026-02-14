# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    NodeListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Node }]
  end
end
