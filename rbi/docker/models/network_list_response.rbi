# typed: strong

module Docker
  module Models
    NetworkListResponse =
      T.let(
        Docker::Internal::Type::ArrayOf[Docker::Summary],
        Docker::Internal::Type::Converter
      )
  end
end
