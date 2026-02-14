# typed: strong

module DockerEngine
  module Models
    ImageDeleteResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::DeleteItem],
        DockerEngine::Internal::Type::Converter
      )
  end
end
