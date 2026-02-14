# typed: strong

module DockerEngineAPI
  module Models
    ContainerListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Summary],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
