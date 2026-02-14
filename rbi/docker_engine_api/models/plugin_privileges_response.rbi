# typed: strong

module DockerEngineAPI
  module Models
    PluginPrivilegesResponse =
      T.let(
        DockerEngineAPI::Internal::Type::ArrayOf[DockerEngineAPI::Privilege],
        DockerEngineAPI::Internal::Type::Converter
      )
  end
end
