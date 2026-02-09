# typed: strong

module Docker
  module Models
    ContainerListResponse =
      T.let(
        Docker::Internal::Type::ArrayOf[Docker::Summary],
        Docker::Internal::Type::Converter
      )
  end
end
