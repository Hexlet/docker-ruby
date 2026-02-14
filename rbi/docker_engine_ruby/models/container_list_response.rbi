# typed: strong

module DockerEngineRuby
  module Models
    ContainerListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Summary],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
