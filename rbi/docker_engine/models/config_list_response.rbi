# typed: strong

module DockerEngine
  module Models
    ConfigListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Config],
        DockerEngine::Internal::Type::Converter
      )
  end
end
