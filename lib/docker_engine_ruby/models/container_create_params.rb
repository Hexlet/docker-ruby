# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#create
    class ContainerCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute platform
      #
      #   @return [String, nil]
      optional :platform, String

      # @!method initialize(name: nil, platform: nil, request_options: {})
      #   @param name [String]
      #   @param platform [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
