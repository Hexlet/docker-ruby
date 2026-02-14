# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Secrets#create
    class SecretCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineAPI::Models::SecretCreateParams::Spec, nil]
      optional :spec, -> { DockerEngineAPI::SecretCreateParams::Spec }

      # @!method initialize(spec: nil, request_options: {})
      #   @param spec [DockerEngineAPI::Models::SecretCreateParams::Spec]
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]

      class Spec < DockerEngineAPI::Models::Spec
        # @!method initialize
      end
    end
  end
end
