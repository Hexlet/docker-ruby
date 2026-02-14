# typed: strong

module DockerEngineAPI
  module Models
    NetworkListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Summary],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
