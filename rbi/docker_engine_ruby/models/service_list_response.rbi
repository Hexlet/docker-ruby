# typed: strong

module DockerEngineRuby
  module Models
    ServiceListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Service],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
