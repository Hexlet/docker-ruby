# typed: strong

module DockerEngineAPI
  module Models
    ImageHistoryResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::HistoryItem],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
