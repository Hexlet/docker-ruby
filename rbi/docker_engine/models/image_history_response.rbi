# typed: strong

module DockerEngine
  module Models
    ImageHistoryResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::HistoryItem],
        DockerEngine::Internal::Type::Converter
      )
  end
end
