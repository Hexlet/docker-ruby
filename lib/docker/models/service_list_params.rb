# frozen_string_literal: true

module Docker
  module Models
    # @see Docker::Resources::Services#list
    class ServiceListParams < Docker::Internal::Type::BaseModel
      extend Docker::Internal::Type::RequestParameters::Converter
      include Docker::Internal::Type::RequestParameters

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   services list.
      #
      #   Available filters:
      #
      #   - `id=<service id>`
      #   - `label=<service label>`
      #   - `mode=["replicated"|"global"]`
      #   - `name=<service name>`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!attribute status
      #   Include service status, with count of running and desired tasks.
      #
      #   @return [Boolean, nil]
      optional :status, Docker::Internal::Type::Boolean

      # @!method initialize(filters: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Docker::Models::ServiceListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      #   @param request_options [Docker::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
