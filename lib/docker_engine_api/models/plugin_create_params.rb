# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Plugins#create
    class PluginCreateParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute name
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :name, String

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart]
      required :body, DockerEngineAPI::Internal::Type::FileInput

      # @!method initialize(name:, body:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineAPI::Models::PluginCreateParams} for more details.
      #
      #   @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngineAPI::FilePart]
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
