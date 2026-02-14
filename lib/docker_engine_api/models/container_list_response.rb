# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ContainerListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Summary }]
  end
end
