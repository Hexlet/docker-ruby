# typed: strong

module DockerEngineAPI
  module Models
    NodeListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Node],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
