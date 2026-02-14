# typed: strong

module DockerEngineRuby
  module Models
    NodeListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Node],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
