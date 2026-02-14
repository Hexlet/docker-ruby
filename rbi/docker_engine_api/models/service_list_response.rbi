# typed: strong

module DockerEngineAPI
  module Models
    ServiceListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Service],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
