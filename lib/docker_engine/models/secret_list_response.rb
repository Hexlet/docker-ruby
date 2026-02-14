# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    SecretListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Secret }]
  end
end
