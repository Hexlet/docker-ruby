# frozen_string_literal: true

module DockerEngineAPI
  module Models
    # @see DockerEngineAPI::Resources::Containers#archive
    class ContainerArchiveParams < DockerEngineAPI::Internal::Type::BaseModel
      extend DockerEngineAPI::Internal::Type::RequestParameters::Converter
      include DockerEngineAPI::Internal::Type::RequestParameters

      # @!attribute path
      #   Resource in the container’s filesystem to archive.
      #
      #   @return [String]
      required :path, String

      # @!method initialize(path:, request_options: {})
      #   @param path [String] Resource in the container’s filesystem to archive.
      #
      #   @param request_options [DockerEngineAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
