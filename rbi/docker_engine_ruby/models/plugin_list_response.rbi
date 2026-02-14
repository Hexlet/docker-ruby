# typed: strong

module DockerEngineRuby
  module Models
    PluginListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Plugin],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
