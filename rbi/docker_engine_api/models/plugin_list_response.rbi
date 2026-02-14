# typed: strong

module DockerEngineAPI
  module Models
    PluginListResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Plugin],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
