# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Services#inspect_
    class ServiceInspectParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute insert_defaults
      #   Fill empty fields with default values.
      #
      #   @return [Boolean, nil]
      optional :insert_defaults, Docker::Internal::Type::Boolean

      # @!method initialize(insert_defaults: nil, request_options: {})
      #   @param insert_defaults [Boolean] Fill empty fields with default values.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
