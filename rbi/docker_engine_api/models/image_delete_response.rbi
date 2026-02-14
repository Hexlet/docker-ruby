# typed: strong

module DockerEngineAPI
  module Models
    ImageDeleteResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::DeleteItem],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
