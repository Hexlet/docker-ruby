# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ServiceListResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::Service }]
  end
end
