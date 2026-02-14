# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Services#list
    class ServiceListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

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
      optional :status, DockerEngine::Internal::Type::Boolean

      # @!method initialize(filters: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ServiceListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
