# typed: strong

module DockerEngine
  module Models
    ContainerChangesResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::FilesystemChange],
        DockerEngine::Internal::Type::Converter
      )
  end
end
