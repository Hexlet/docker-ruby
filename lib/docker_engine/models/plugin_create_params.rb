# frozen_string_literal: true

module DockerEngine
  module Models
    # @see DockerEngine::Resources::Plugins#create
    class PluginCreateParams < DockerEngine::Internal::Type::BaseModel
      extend DockerEngine::Internal::Type::RequestParameters::Converter
      include DockerEngine::Internal::Type::RequestParameters

      # @!attribute name
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :name, String

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngine::FilePart]
      required :body, DockerEngine::Internal::Type::FileInput

      # @!method initialize(name:, body:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngine::Models::PluginCreateParams} for more details.
      #
      #   @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngine::FilePart]
      #
      #   @param request_options [DockerEngine::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
