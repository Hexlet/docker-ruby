# frozen_string_literal: true

module Docker
  module Models
    # @type [Docker::Internal::Type::Converter]
    ImageListResponse = Docker::Internal::Type::ArrayOf[-> { Docker::Summary }]
  end
end
