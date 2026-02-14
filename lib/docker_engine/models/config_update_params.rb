# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Configs#update
    class ConfigUpdateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute version
      #   The version number of the config object being updated. This is required to avoid
      #   conflicting writes.
      #
      #   @return [Integer]
      required :version, Integer

      # @!method initialize(version:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::ConfigUpdateParams} for more details.
      #
      #   @param version [Integer] The version number of the config object being updated. This is
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
