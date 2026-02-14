# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Secrets#list
    class SecretListParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute filters
      #   A JSON encoded value of the filters (a `map[string][]string`) to process on the
      #   secrets list.
      #
      #   Available filters:
      #
      #   - `id=<secret id>`
      #   - `label=<key> or label=<key>=value`
      #   - `name=<secret name>`
      #   - `names=<secret name>`
      #
      #   @return [String, nil]
      optional :filters, String

      # @!method initialize(filters: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::SecretListParams} for more details.
      #
      #   @param filters [String] A JSON encoded value of the filters (a `map[string][]string`) to
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
