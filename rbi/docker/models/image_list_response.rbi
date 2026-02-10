# typed: strong

module Docker
  module Models
    ImageListResponse =
      T.let(
        Docker::Internal::Type::ArrayOf[Docker::Summary],
        Docker::Internal::Type::Converter
      )
  end
end
