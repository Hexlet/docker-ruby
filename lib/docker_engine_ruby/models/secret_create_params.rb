# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Secrets#create
    class SecretCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::SecretCreateParams::Spec, nil]
      optional :spec, -> { DockerEngineRuby::SecretCreateParams::Spec }

      # @!method initialize(spec: nil, request_options: {})
      #   @param spec [DockerEngineRuby::Models::SecretCreateParams::Spec]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineRuby::Models::Spec
        # @!method initialize
      end
    end
  end
end
