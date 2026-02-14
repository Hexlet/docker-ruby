# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    NodeListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Node }]
  end
end
