# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Plugins#create
    class PluginCreateParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute name
      #   The name of the plugin. The `:latest` tag is optional, and is the default if
      #   omitted.
      #
      #   @return [String]
      required :name, String

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, DockerEngineRuby::FilePart]
      required :body, DockerEngineRuby::Internal::Type::FileInput

      # @!method initialize(name:, body:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {DockerEngineRuby::Models::PluginCreateParams} for more details.
      #
      #   @param name [String] The name of the plugin. The `:latest` tag is optional, and is the
      #
      #   @param body [Pathname, StringIO, IO, String, DockerEngineRuby::FilePart]
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
