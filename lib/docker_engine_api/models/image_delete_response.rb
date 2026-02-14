# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ImageDeleteResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::DeleteItem }]
  end
end
