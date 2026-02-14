# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ConfigListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Config }]
  end
end
