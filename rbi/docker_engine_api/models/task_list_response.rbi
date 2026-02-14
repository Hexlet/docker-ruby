# typed: strong

module DockerEngineAPI
  module Models
    TaskListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Task],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
