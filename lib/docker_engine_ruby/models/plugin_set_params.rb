# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#set
    class PluginSetParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Array<String>, nil]
      optional :body, DockerEngineRuby::Internal::Type::ArrayOf[String]

      # @!method initialize(body: nil, request_options: {})
      #   @param body [Array<String>]
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
