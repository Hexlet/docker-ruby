# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Images#push
    class ImagePushParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute x_registry_auth
      #
      #   @return [String]
      required :x_registry_auth, String

      # @!attribute platform
      #
      #   @return [String, nil]
      optional :platform, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(x_registry_auth:, platform: nil, tag: nil, request_options: {})
      #   @param x_registry_auth [String]
      #   @param platform [String]
      #   @param tag [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
