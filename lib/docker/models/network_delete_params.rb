# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Networks#delete
    class NetworkDeleteParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
