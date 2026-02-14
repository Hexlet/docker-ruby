# typed: strong

module DockerEngine
  module Models
    NodeListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Node],
        DockerEngine::Internal::Type::Converter
      )
  end
end
