# typed: strong

module DockerEngine
  module Models
    TaskListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Task],
        DockerEngine::Internal::Type::Converter
      )
  end
end
