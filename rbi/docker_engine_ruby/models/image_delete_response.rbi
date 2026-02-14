# typed: strong

module DockerEngineRuby
  module Models
    ImageDeleteResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::DeleteItem],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
