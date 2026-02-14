# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @type [DockerEngineAPI::Internal::Type::Converter]
    ImageHistoryResponse = DockerEngineAPI::Internal::Type::ArrayOf[-> { DockerEngineAPI::HistoryItem }]
  end
end
