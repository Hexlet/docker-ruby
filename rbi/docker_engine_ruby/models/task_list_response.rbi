# typed: strong

module DockerEngineRuby
  module Models
    TaskListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Task],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
