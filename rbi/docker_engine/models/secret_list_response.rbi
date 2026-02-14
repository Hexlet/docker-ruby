# typed: strong

module DockerEngine
  module Models
    SecretListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Secret],
        DockerEngine::Internal::Type::Converter
      )
  end
end
