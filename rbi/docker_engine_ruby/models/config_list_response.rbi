# typed: strong

module DockerEngineRuby
  module Models
    ConfigListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::ConfigObject
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
