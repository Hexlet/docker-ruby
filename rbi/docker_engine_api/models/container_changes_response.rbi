# typed: strong

module DockerEngineAPI
  module Models
    ContainerChangesResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[
          DockerEngineAPI::FilesystemChange
        ],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
