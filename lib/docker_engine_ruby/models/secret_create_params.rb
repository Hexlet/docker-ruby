# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Secrets#create
    class SecretCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::SecretSpec]
      required :spec, -> { DockerEngineRuby::SecretSpec }

      # @!method initialize(spec:, request_options: {})
      #   @param spec [DockerEngineRuby::Models::SecretSpec]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
