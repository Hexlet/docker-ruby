# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Configs#list
    class ConfigListParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   configs list.
      #
      #   Available filters:
      #
      #   - `id=<config id>`
      #   - `label=<key> or label=<key>=value`
      #   - `name=<config name>`
      #   - `names=<config name>`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ConfigListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
