# typed: strong

module DockerEngineRuby
  module Models
    SecretListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Secret],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
