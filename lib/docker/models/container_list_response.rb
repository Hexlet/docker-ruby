# frozen_string_literal: true

module Docker
  module Models
    # @type [Docker::Internal::Type::Converter]
    ContainerListResponse = Docker::Internal::Type::ArrayOf[-> { Docker::Summary }]
  end
end
