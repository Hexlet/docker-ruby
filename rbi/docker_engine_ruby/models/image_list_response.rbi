# typed: strong

module DockerEngineRuby
  module Models
    ImageListResponse =
      T.let(
        DockerEngineRuby::Internal::Type::ArrayOf[
          DockerEngineRuby::ImageSummary
        ],
        DockerEngineRuby::Internal::Type::Converter
      )
  end
end
