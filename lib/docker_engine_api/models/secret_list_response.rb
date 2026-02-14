# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    SecretListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Secret }]
  end
end
