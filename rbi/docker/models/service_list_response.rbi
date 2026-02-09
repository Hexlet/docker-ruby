# typed: strong

module Docker
  module Models
    ServiceListResponse =
      T.let(
        Docker::Internal::Type::ArrayOf[Docker::Service],
        Docker::Internal::Type::Converter
      )
  end
end
