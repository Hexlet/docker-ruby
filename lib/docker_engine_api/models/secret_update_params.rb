# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Secrets#update
    class SecretUpdateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the secret object being updated. This is required to avoid
      #   conflicting writes.
      #
      #   @return [Integer]
      required :version, Integer

      # @!method initialize(version:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::SecretUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the secret object being updated. This is
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
