# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#pull
    class PluginPullParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute remote
      #
      #   @return [String]
      required :remote, String

      # @!attribute body
      #
      #   @return [Array<DockerEngineRuby::Models::Privilege>]
      required :body, -> { DockerEngineRuby::Internal::Type::ArrayOf[DockerEngineRuby::Privilege] }

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute x_registry_auth
      #
      #   @return [String, nil]
      optional :x_registry_auth, String

      # @!method initialize(remote:, body:, name: nil, x_registry_auth: nil, request_options: {})
      #   @param remote [String]
      #   @param body [Array<DockerEngineRuby::Models::Privilege>]
      #   @param name [String]
      #   @param x_registry_auth [String]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
