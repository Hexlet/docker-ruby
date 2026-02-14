# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ImageListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Summary }]
  end
end
