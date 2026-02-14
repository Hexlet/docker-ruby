# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#set
    class PluginSetParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Array<String>, nil]
      optional :body, DockerEngineAPI::Internal::Type::ArrayOf[String]

      # @!method initialize(body: nil, request_options: {})
      #   @param body [Array<String>]
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
