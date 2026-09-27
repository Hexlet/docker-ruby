# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Configs#create
    class ConfigCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute spec
      #
      #   @return [DockerEngineRuby::Models::ConfigSpec]
      required :spec, -> { DockerEngineRuby::ConfigSpec }

      # @!method initialize(spec:, request_options: {})
      #   @param spec [DockerEngineRuby::Models::ConfigSpec]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
