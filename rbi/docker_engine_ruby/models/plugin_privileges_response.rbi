# typed: strong

module DockerEngineRuby
  module Models
    PluginPrivilegesResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
