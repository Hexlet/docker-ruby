# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Secrets#create
    class SecretCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngine::Models::SecretCreateParams::Spec, nil]
      optional :spec, -> { DockerEngine::SecretCreateParams::Spec }

      # @!method initialize(spec: nil, request_options: {})
      #   @param spec [DockerEngine::Models::SecretCreateParams::Spec]
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngine::Models::Spec
        # @!method initialize
      end
    end
  end
end
