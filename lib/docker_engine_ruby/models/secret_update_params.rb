# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Secrets#update
    class SecretUpdateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::SecretSpec]
      required :spec, -> { DockerEngineRuby::SecretSpec }

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute version
      #
      #   @return [Integer]
      required :version, Integer

      # @!method initialize(spec:, id:, version:, request_options: {})
      #   @param spec [DockerEngineRuby::Models::SecretSpec]
      #   @param id [String]
      #   @param version [Integer]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
