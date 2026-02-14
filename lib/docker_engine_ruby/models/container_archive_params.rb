# frozen_string_literal: true

module DockerEngineRuby
  module Models
    # @see DockerEngineRuby::Resources::Containers#archive
    class ContainerArchiveParams < DockerEngineRuby::Internal::Type::BaseModel
      extend DockerEngineRuby::Internal::Type::RequestParameters::Converter
      include DockerEngineRuby::Internal::Type::RequestParameters

      # @!attribute path
      #   Resource in the container’s filesystem to archive.
      #
      #   @return [String]
      required :path, String

      # @!method initialize(path:, request_options: {})
      #   @param path [String] Resource in the container’s filesystem to archive.
      #
      #   @param request_options [DockerEngineRuby::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
