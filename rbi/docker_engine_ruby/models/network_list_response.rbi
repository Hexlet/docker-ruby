# typed: strong

module DockerEngineRuby
  module Models
    NetworkListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::NetworkSummary
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
