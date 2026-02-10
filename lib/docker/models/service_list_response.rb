# frozen_string_literal: true

module Docker
  module Models
    # @type [Docker::Internal::Type::Converter]
    ServiceListResponse = Docker::Internal::Type::ArrayOf[-> { Docker::Service }]
  end
end
