# typed: strong

module DockerEngine
  module Models
    ServiceListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Service],
        DockerEngine::Internal::Type::Converter
      )
  end
end
