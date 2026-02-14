# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#list
    class ServiceListParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

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
      optional :status, DockerEngineRuby::Internal::Type::Boolean

      # @!method initialize(filters: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::ServiceListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param status [Boolean] Include service status, with count of running and desired tasks.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
