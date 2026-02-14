# typed: strong

module DockerEngine
  module Models
    PluginListResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Plugin],
        DockerEngine::Internal::Type::Converter
      )
  end
end
