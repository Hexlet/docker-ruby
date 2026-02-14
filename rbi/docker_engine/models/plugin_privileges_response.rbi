# typed: strong

module DockerEngine
  module Models
    PluginPrivilegesResponse =
      T.let(
        DockerEngine::Internal::Type::ArrayOf[DockerEngine::Privilege],
        DockerEngine::Internal::Type::Converter
      )
  end
end
