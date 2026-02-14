# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#set
    class PluginSetParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Array<String>, nil]
      optional :body, DockerEngine::Internal::Type::ArrayOf[String]

      # @!method initialize(body: nil, request_options: {})
      #   @param body [Array<String>]
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
