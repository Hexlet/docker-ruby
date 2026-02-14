# typed: strong

module DockerEngineRuby
  module Models
    ImageHistoryResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::HistoryItem
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
