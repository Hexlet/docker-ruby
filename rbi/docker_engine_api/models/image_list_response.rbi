# typed: strong

module DockerEngineAPI
  module Models
    ImageListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Summary],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
