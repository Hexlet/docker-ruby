# typed: strong

module DockerEngine
  module Models
    ImageListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Summary],
        DockerEngine::Internal::Type::Converter
      )
  end
end
