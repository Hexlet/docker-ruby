# frozen_string_literal: true

module DockerEngine
  module Models
    # @type [DockerEngine::Internal::Type::Converter]
    ImageHistoryResponse = DockerEngine::Internal::Type::ArrayOf[-> { DockerEngine::HistoryItem }]
  end
end
