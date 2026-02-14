# typed: strong

module DockerEngineAPI
  module Models
    SecretListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Secret],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
