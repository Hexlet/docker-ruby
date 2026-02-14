# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ServiceListResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::Service }]
  end
end
