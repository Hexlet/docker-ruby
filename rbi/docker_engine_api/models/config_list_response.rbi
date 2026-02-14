# typed: strong

module DockerEngineAPI
  module Models
    ConfigListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Config],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
