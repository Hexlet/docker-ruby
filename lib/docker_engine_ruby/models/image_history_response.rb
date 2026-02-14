# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @type [DockerEngineRuby::Internal::Type::Converter]
    ImageHistoryResponse = DockerEngineRuby::Internal::Type::ArrayOf[-> { DockerEngineRuby::HistoryItem }]
  end
end
