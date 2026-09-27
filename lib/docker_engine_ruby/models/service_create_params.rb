# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Services#create
    class ServiceCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::ServiceSpec]
      required :spec, -> { DockerEngineRuby::ServiceSpec }

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(spec:, x_registry_auth: nil, request_options: {})
      #   @param spec [DockerEngineRuby::Models::ServiceSpec]
      #   @param x_registry_auth [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
